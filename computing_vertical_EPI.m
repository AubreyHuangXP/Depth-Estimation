function epi_vertical_depth = computing_vertical_EPI(row,height,step,width,column,LF_SAI)
epi_vertical_depth = cell(2,width);
epi_vertical = zeros(height,column,3,'uint8');

for i= 1:width
    for j = 1:column
%         im = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(j),'_',int2str(row),'.bmp']);
        im = LF_SAI{j,row};
        epi_vertical(:,column+1-j,:) = im(:,i,:);
    end
    M = vertical_cost_function(epi_vertical,column,height,step);
    epi_vertical_depth{1,i} = M;
%     epi_vertical_depth{2,i} = F;
end