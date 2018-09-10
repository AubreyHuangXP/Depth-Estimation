function depthmap = erode(J)

% D = double(imread('E:\test\depth\Flowers\den_8.bmp'))/255;
% I = imread('E:\light field sample\TextImage\Flowers\Flowers_8_8.bmp');

for i=2
     se=strel('disk',i);
%      J=imerode(J,se);
     J=imclose(imopen(J,se),se); 
%      J=imopen(imclose(J,se),se);
%      J=imerode(J,se);
end
% depthmap = J;
% depthmap = medfilt2(J);
% se = strel('disk',2);
% depthmap = imopen(J,se);
% depthmap = imerode(J,se);
% depthmap = denoise(depthmap);
% imshow(depthmap);
depthmap = medfilt2(J);
end
% [y,x] = size(depthmap);
% [X,Y] = meshgrid(1:x,1:y);
% pp = double(depthmap);
% mesh(X,Y,pp);colormap gray
% 
% % el=45; %设置仰角为30度。
% % for az=0:0.1:90 %让方位角从0变到360，绕z轴一周
% %     view(az,el);
% %     drawnow;
% % end
% az= 0; %设置方位角为0
% for el=45:0.05:90 %仰角从0变到360
%     view(az,el);
%     drawnow;
% end


