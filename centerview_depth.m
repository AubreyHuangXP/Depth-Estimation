function centerview_depth(LF_str,row,col,hor_depthmap,ver_depthmap)
if ((row == 8) && (col == 8))    
    alpha = 0.5;
else
    alpha = abs(row-8)/(abs(row-8)+abs(col-8));
end
param.iternum = 4;
depthmap=hor_depthmap*(1-alpha)+ver_depthmap*alpha;
I = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(row),'_',int2str(col),'.bmp']); 
E3 = WMT(depthmap*255 , I);
E4 = IterRefine(E3,I,param);
imwrite(E4/255,['E:\test\LF_depth\Ours\',LF_str,'\',num2str(col),'\depth_',num2str(row),'_',num2str(col),'.bmp']);
