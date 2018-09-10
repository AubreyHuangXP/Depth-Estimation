function epi_horizontal_depth = computing_horizontal_EPI(row,width,step,height,column,LF_SAI)
epi_horizontal_depth = cell(2,height);
epi_horizontal = zeros(column,width,3,'uint8');

for i= 1:height
    for j = 1:column
%         im = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(row),'_',int2str(j),'.bmp']);
        im = LF_SAI{row,j};
        epi_horizontal(column+1-j,:) = im(i,:);
%         imwrite(epi_horizontal,['E:\test\test\',num2str(i),'.bmp']);
    end
    M = horizontal_cost_function(epi_horizontal,column,width,step);
    epi_horizontal_depth{1,i} = M;
%     epi_horizontal_depth{2,i} = F;
end