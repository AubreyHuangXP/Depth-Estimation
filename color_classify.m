function depthmap = color_classify(r,img)
% imshow(dp);
% img=double(img);
[m n]=size(img);

imgn=zeros(m+2*r+1,n+2*r+1);

imgn(r+1:m+r,r+1:n+r)=img;
imgn(1:r,r+1:n+r)=img(1:r,1:n); 
imgn(1:m+r,n+r+1:n+2*r+1)=imgn(1:m+r,n:n+r);
imgn(m+r+1:m+2*r+1,r+1:n+2*r+1)=imgn(m:m+r,r+1:n+2*r+1);
imgn(1:m+2*r+1,1:r)=imgn(1:m+2*r+1,r+1:2*r);
% imshow(mat2gray(imgn))

for i=1+r:m+r
    for j=1+r:n+r
        ser=imgn(i-r:i+r,j-r:j+r);
        ser=reshape(ser,[1 (2*r+1)^2]);         %将二维模板变为一维
        imgn(i,j)=mean_shift(ser,2*r^2+2*r+1);   %取模板最中间的那个值作为迭代初值
    
    end    
end

% figure;
imgn=imgn(r+1:m+r,r+1:n+r);
% imshow(mat2gray(imgn));
depthmap = mat2gray(imgn);
end