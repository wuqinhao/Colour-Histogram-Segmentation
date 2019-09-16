mreye1 = [];

%resultcollect55 = zeros(5,21);
j=1;
%for dis = 40:60
ccenter=7;
for i = 0:4

% Name1 = ['image_',num2str(i)];
% Name2 = ['mask_',num2str(i)];
Name1 = ['g_',num2str(i,)];
Name2 = ['maskg',num2str(i)];
%eval(['[r,c,ch] = size(',Name1,');']);
% eval(['N1 = ',Name1,'(150:(1312-185),500:(2000-500),:);']);
% eval(['N2 = ',Name2,'(150:(1312-185),500:(2000-500));']);
% eval(['N1 = ',Name1,'(50:(400-30),110:(600-50),:);']);
% eval(['N2 = ',Name2,'(50:(400-30),110:(600-50),:);']);


% eval(['result = colour_histogram(',Name1,',0);']);
% P = find_peak(result);
% distance = dis;
% ColourLabel = peak_selection(distance, P);
% cl1 = insertInterpret(ColourLabel);
% cl2 = interpretLabel(ColourLabel);
% eval(['[RI, cc, ri3] = readimage_rebuild(',Name1,', ColourLabel);']);
% eval(['[rr1, cc1, pI1] = readimage_rebuild(',Name1,', cl1);']);
% eval(['[rr2, cc2, pI2] = readimage_rebuild(',Name1,', cl2);']);

lab1 = rgb2hsi(N1);
label1 = cluster_segmentation(lab1, 1, ccenter);
ri3 = separateLabel(label1, 7);

%imshow(RI);
%c1 = pcaimage(rr1.*RI);
%figure;imshow(rr1);
%figure;imshow(rr1);
%figure;imshow(rr2.*RI);

%ri3 = pI;
%eval(['[r,c,l] = size(',Name1,');']);
%A = [500 500 600 600 500];
%B = [520 680 680 520 520];
%startxx = poly2mask(A,B,r,c);
%startxx = imbinarize(rgb2gray(RI),0.3);
%stats = regionprops('table',pI,'Centroid','MajorAxisLength','MinorAxisLength');
%centers = stats.Centroid;
%diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
%radii = diameters/2;
%startxx = createCirclesMask([r,c],centers,radii);

%figure;imshow(startxx);
%figure;
%imshow(RI);hold on;
%ri3=activecontour(RI,startxx,400,'Chan-Vese','SmoothFactor',10);
%contour(ri3);
%eval(['bm3 = ',Name2,';']);
bm3 = N2;
%hold on;
%contour(bm3);


result1 = ri3&bm3;
result2 = ri3|bm3;

a = sum(max(result1))/sum(max(result2));
b = sum(max(result1,[],2))/sum(max(result2,[],2));

mreye1 = [mreye1;(a+b)/2];

%contour(ri3);
%hold on
%eval(['contour(',Name2,',''g'');']);
%
end

%resultcollect55(:,j) = mreye1;
%resultcollect2(:,j) = hrf2;
%resultcollect3(:,j) = hrf3;
j=j+1;
%disp(dis);
disp('Finished.');
%mreye1=[];
%end
%end
%{
devideg = zeros(15,11);
Measurement = Back;
for j = 1:1:11

for i = 1:1:15
Address1 = ['C:\Doctor of Philosophy\g_',int2str(i),'.txt'];
if (i<10)
    Address2 = ['C:\Users\wuq\Documents\ImageDatabases\HRF\images\0',int2str(i),'_g.jpg'];
else
    Address2 = ['C:\Users\wuq\Documents\ImageDatabases\HRF\images\',int2str(i),'_g.jpg'];
end

A = dlmread(Address1);

convert3Dmat_256;
findpeak;
ColourLabel = peakselection(49+j, P);
RI = readimage_rebuild(Address2, ColourLabel);
Measurement(i,:) = pattern_measure(ColourLabel, RI);
disp(Address1);
end
disp('Finished.');
devideg(:,j) = Measurement(:,1);
Measurement = Back;
end
%}
