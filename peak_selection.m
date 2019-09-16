%Select dominant peak from local peak candidates
%D: distance threshold
%P: local peak candidates
%return the dominant peak matrix ColourLabel
function ColourLabel = peak_selection(D, P)
%initial
label = 1;
n=5;
d = floor(length(P)/n);

cp = P(1,:);
ColourLabel = [cp,label]; %output peak
label = label+1;

for i =2:5:length(P)
    %use euclidean distance
    if (norm(P(i,2:4)-ColourLabel(label-1,2:4))>=D)
        ColourLabel = [ColourLabel;P(i,:),label];
        label = label+1;
    end
    if (label == (n+1))
        break;
    end
end
ColourLabel = [ColourLabel;P(length(P),:),label];%add the black peak to collect frame

%sort output peak by RGB value
ColourLabel = sortrows(ColourLabel,[2 3 4],{ 'descend' 'descend' 'descend'});
end