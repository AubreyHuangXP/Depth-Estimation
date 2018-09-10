function epi_horizontal_depth = converting_horizontal_EPI(row,col,width,step,height,view_number,LF_SAI)
epi_horizontal_depth = cell(2,height);
epi_horizontal = zeros(view_number,width,'double');

for i= 1:height
%     disp(['horizontal EPI computing : (' num2str(i) '/' num2str(height) ')']);
    for j = 1:view_number
        im = LF_SAI{row,j};
        epi_horizontal(view_number+1-j,:) = im(i,:);
    end
    [M, F]= horizontal_cost_function(col,epi_horizontal,view_number,width,step);
    epi_horizontal_depth{1,i} = M;
    epi_horizontal_depth{2,i} = F;
end