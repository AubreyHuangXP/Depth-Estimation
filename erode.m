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
% % el=45; %��������Ϊ30�ȡ�
% % for az=0:0.1:90 %�÷�λ�Ǵ�0�䵽360����z��һ��
% %     view(az,el);
% %     drawnow;
% % end
% az= 0; %���÷�λ��Ϊ0
% for el=45:0.05:90 %���Ǵ�0�䵽360
%     view(az,el);
%     drawnow;
% end


