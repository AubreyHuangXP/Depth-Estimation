function [M, F] = horizontal_cost_function(col,epi_horizontal,view_number,width,step)
A=(-45:45);
l = length(A);
M = zeros(view_number,width);
F = zeros(view_number,width);
% for u = 1:view_number

size_patch = 3;
d = (size_patch+1)/2;
    
for u = view_number-col+1
    for s = d : width - d
        y = round(l/2);
        MSE_sum = zeros(1,l);
        N = 0;
        for a = 1:l
            for i = 1-u:step:view_number-u
                j = round(i*tand(A(a)));
                if( u+i < 1 || u+i > view_number || s+j < 1 || s+j > width )
                    continue;
                else
                    MSE_sum(a) = MSE_sum(a)+(epi_horizontal(u,s) - epi_horizontal(u+i,s+j))^2;
                    N = N + 1;
                end
            end
        end
        if (length(find(min(MSE_sum/N) == MSE_sum/N)) > 5)
            Patch = zeros(size_patch,size_patch);
            for pu = u-(d-1):u+(d-1)
                for pv = s-(d-1):s+(d-1)
                    Patch(u-pu+d,s-pv+d) = epi_horizontal(pu,pv);
                end
            end
            if ( std(std(Patch)) < 1)
                M(u,s) = 0.35/(1-tand(A(y)));
            end
        else
            [x y] = min(MSE_sum/N);
            M(u,s) = 0.35/(1-tand(A(y)));
            F(u,s) = 1;
%         MSE(u,s) = 0.3+tand(A(y));
        end
    end
end

end