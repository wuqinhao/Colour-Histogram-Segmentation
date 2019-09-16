%Accumulate the colour histogram for input image
%image: input image;
%ntimes: Gaussian blurring times on histogram
function colorHist = colour_histogram(image,ntimes)
[rows, cols, c] = size(image);
image = im2double(image);
colorHist = double(zeros(256,256,256)); %initial

%accumulate histogram
for x = 1:1:cols
  for y = 1:1:rows
    redValue = (double(image(y,x,1))+1);
    greenValue = (double(image(y,x,2))+1);
    blueValue = (double(image(y,x,3))+1);
    colorHist(redValue, greenValue, blueValue) = (colorHist(redValue, greenValue, blueValue) + 1);
  end
end

%Gaussian blur
if (ntimes ~=0)
    for i =1:ntimes
        colorHist = imgaussfilt3(colorHist,0.625);
    end
end