%Plot RGB 3D histogram using Matlab patch plot

%default input transfer MxNx3 (size(I)xChannel) to 256x256x256 (RxGxB) histogram
%convert3Dmat;
rng(9,'twister')

%plot setting
set(gcf,'Color',[1 1 1]);set(gca,'Color',[1 1 1]);
patch(isocaps(result,.8),'FaceColor','blue','EdgeColor','none');
p1 = patch(isosurface(result,.8),'FaceColor','blue','EdgeColor','none');
isonormals(result,p1)
view(3); 
axis square 
camlight left; 
colormap jet
lighting gouraud
grid on

%axis label
xlabel('L','FontSize',12) % x-axis label
ylabel('a','FontSize',12) % y-axis label
zlabel('b','rot',0,'FontSize',12) % x-axis label
