function epi_vertical_depth = converting_vertical_EPI(row,col,height,step,width,view_number,LF_SAI)
epi_vertical_depth = cell(2,width);
epi_vertical = zeros(height,view_number,'double');

for i= 1:width
%     disp(['vertical EPI computing : (' num2str(i) '/' num2str(width) ')']);
    for j = 1:view_number
        im = LF_SAI{j,col};
        epi_vertical(:,view_number+1-j) = im(:,i);
    end
    [M, F] = vertical_cost_function(row,epi_vertical,view_number,height,step);
    epi_vertical_depth{1,i} = M;
    epi_vertical_depth{2,i} = F;
end