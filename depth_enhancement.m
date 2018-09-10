function depth_enhancement(height,width,view_number,row,col,epi_horizontal_depth,epi_vertical_depth,LF_str)
rec_horizontal_depthmap = zeros(height,width);
flag_horizontal_depthmap = zeros(height,width);
rec_vertical_depthmap = zeros(height,width);
flag_vertical_depthmap = zeros(height,width);
% param.iternum = 4;
% for r = 1:column
for v = view_number-col+1
    for i= 1:height
        horizontal_depth = epi_horizontal_depth{1,i};
        horizontal_flag = epi_horizontal_depth{2,i};
        rec_horizontal_depthmap(i,:) = horizontal_depth(v,:);
        flag_horizontal_depthmap(i,:) = horizontal_flag(v,:);
    end
    I = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(row),'_',int2str(col),'.bmp']); 
%     max_value = max(max(rec_horizontal_depthmap));
%     min_value = min(min(rec_horizontal_depthmap));
%     for i = 1:height
%         for j = 1:width
%             rec_horizontal_depthmap(i,j) = (rec_horizontal_depthmap(i,j)-min_value)/(max_value-min_value);
%         end
%     end
%     hor_depthmap = smoothness(erode(opt4comp(I,rec_horizontal_depthmap,0.012)));
    hor_depthmap = opt4comp(im2double(I),rec_horizontal_depthmap,flag_horizontal_depthmap,0.012);
%     E3 = WMT(hor_depthmap*255 , I);
%     E4 = IterRefine(E3,I,param);
    imwrite(hor_depthmap,['E:\test\LF_depth\Ours\',LF_str,'\h_depth_',int2str(row),'_',int2str(col),'.bmp']);
end

for v = view_number-row+1
    for i= 1:width
        vertical_depth = epi_vertical_depth{1,i};
        vertical_flag = epi_vertical_depth{2,i};
        rec_vertical_depthmap(:,i) = vertical_depth(:,v);
        flag_vertical_depthmap(:,i) = vertical_flag(:,v);
    end
    I = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(row),'_',int2str(col),'.bmp']);
%     max_value = max(max(rec_vertical_depthmap));
%     min_value = min(min(rec_vertical_depthmap));
%     for i = 1:height
%         for j = 1:width
%             rec_vertical_depthmap(i,j) = (rec_vertical_depthmap(i,j)-min_value)/(max_value-min_value);
%         end
%     end
%     ver_depthmap = smoothness(erode(opt4comp(I,rec_vertical_depthmap,0.012)));
    ver_depthmap = opt4comp(im2double(I),rec_vertical_depthmap,flag_vertical_depthmap,0.012);
%     E3 = WMT(ver_depthmap*255 , I);
%     E4 = IterRefine(E3,I,param);
    imwrite(ver_depthmap,['E:\test\LF_depth\Ours\',LF_str,'\v_depth_',int2str(row),'_',int2str(col),'.bmp']);
    
%     depthmap=alfa*ver_depthmap+(1-alfa)*ver_depthmap;
%     imwrite(depthmap,['E:\test\LF_depth\Ours\',LF_str,'\depth_',num2str(u),'_',num2str(v),'.bmp']);
end
centerview_depth(LF_str,row,col,hor_depthmap,ver_depthmap);
end
