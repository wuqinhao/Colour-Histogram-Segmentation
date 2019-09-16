%Perform segmentation based on ColourLabel
%Address: the input image or image address
%ColourLabel: dominant peak
%return
%RI: output segmentation result with dominant peak value
%RI1: output label map 
%pI: output label map with particular label
function [RI, RI1, pI] = readimage_rebuild(Address, ColourLabel)
%I = imread(Address);
I = Address;

if isempty(I)
    disp('could not find any picture');
    return;
end
I=im2double(I);
[l, w, c] = size(I);%l length, w width, c colour channel;
RI = I;
pI = zeros(l,w);
RI1 = zeros(l,w);

minLabel = 0;
minN = 1000000;

%recreate every pixel
for i = 1:1:l
    for j = 1:1:w
        for l = size(ColourLabel,1):-1:1
            temp = round(I(i,j,:)*256);
            temp = reshape(temp,1,[]);
            %euclidean distance for RGB
            distance = norm(ColourLabel(l,2:4)-temp);
            if (distance<minN)
                minN = distance;
                minLabel = l;
            end
        end
        %assign value
        RI(i,j,1) = ColourLabel(minLabel,2)/255;%G
        RI(i,j,2) = ColourLabel(minLabel,3)/255;%B
        RI(i,j,3) = ColourLabel(minLabel,4)/255;%R
        RI1(i,j) = minLabel;
        if (j>50)%get rid of frame
            if (minLabel==2)
                pI(i,j) = 1;
            end
        end
        
        minLabel = 0;%reset
        minN = 1000000;
    end
end

RI1 = RI1/max(max(RI1));
end
