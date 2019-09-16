%Find local peak from histogram with threshold and distance 
%result: input RGB 3D histogram
function P = find_peak(result)
P=[];%local peak
sp=2;%check step

%Loop search all candidates
for i = (1):sp:(256-sp)
    for j=(1):sp:(256-sp)
        for k=(1):sp:(256-sp)
            A = reshape(result(i:i+sp,j:j+sp,k:k+sp),[],1);%transpose cube into vector
            [val, idx] = max(A);%output max, record value and RGB value
            
            %courrence threshold check
            if ((val<10))
                continue;
            else
                [x, y, z] = ind2sub([sp sp sp], idx);
                P = [P; [val,x+i,y+j,z+k]];
            end
        end
    end
end

%select the peak from candidates
%sort candidates from high occurence to low
P=sortrows(P,[2 3 4 1],{ 'ascend' 'ascend' 'ascend' 'descend'});
testmean = mean(P(:,1))*0.01;
idx=[];
for i = 1:length(P)
    if (P(i,1)<testmean)
        idx = [idx;i];
    end
end
if (~isempty(idx))
    P(idx,:) = [];% output peak
end
end
