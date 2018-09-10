function [M, F] = vertical_cost_function(row,epi_vertical,view_number,height,step)
A=(-45:45);
l = length(A);
M = zeros(height,view_number);
F = zeros(height,view_number);
for s = view_number-row+1
%     for s = 1:view_number
    for u = 1:height
        y = 45;
        MSE_sum = zeros(1,l);
        for a = 1:l
            for i = 1-s:step:view_number-s
                j = round(i*tand(A(a)));
                if(u+j < 1 || u+j > height || s+i < 1 || s+i>view_number)
                    continue;
                else
                    MSE_sum(a) = MSE_sum(a)+(epi_vertical(u,s) - epi_vertical(u+j,s+i))^2;
                end
            end
        end
        if (length(find(min(MSE_sum) == MSE_sum)) > 15)
            M(u,s) = 0.35/(1-tand(A(y)));
        else
            [x y] = min(MSE_sum);
            M(u,s) = 0.35/(1-tand(A(y)));
            F(u,s) = 1;
%             MSE(u,s) = 0.3+tand(A(y));
        end
    end
end
end