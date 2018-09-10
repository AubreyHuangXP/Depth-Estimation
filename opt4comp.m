function D = opt4comp(I, D, F, e)
L = size(I);
% for i=2:L(1)-1
%     for j=2:L(2)-1
%         T = zeros(1,8);
%         T(1) = I(i-1,j-1)/I(i,j);
%         T(2) = I(i-1,j)/I(i,j);
%         T(3) = I(i-1,j+1)/I(i,j);
%         T(4) = I(i,j-1)/I(i,j);
%         T(5) = I(i,j+1)/I(i,j);
%         T(6) = I(i+1,j-1)/I(i,j);
%         T(7) = I(i+1,j)/I(i,j);
%         T(8) = I(i+1,j+1)/I(i,j);
% %         [x y] = min(T); 
%         t = mean(T);
%         if (t>1-e && t<=1+e)
%             N = zeros(1,8);
%             N(1) = D(i-1,j-1)/T(1);
%             N(2) = D(i-1,j)/T(2);
%             N(3) = D(i-1,j+1)/T(3);
%             N(4) = D(i,j-1)/T(4);
%             N(5) = D(i,j+1)/T(5);
%             N(6) = D(i+1,j-1)/T(6);
%             N(7) = D(i+1,j)/T(7);
%             N(8) = D(i+1,j+1)/T(8);
% %             N = sort(N);
%             dv = mean(N);
%             D(i,j) = dv;
%             D(i-1,j-1)= dv;
%             D(i-1,j)= dv;
%             D(i-1,j+1)= dv;
%             D(i,j-1)= dv;
%             D(i,j+1)= dv;
%             D(i+1,j-1)= dv;
%             D(i+1,j)= dv;
%             D(i+1,j+1)= dv;
%         end
%     end
% end
size_patch = 3;
d = (size_patch+1)/2;
for i = d-1:L(1)+1-d
    for j = d-1:L(2)+1-d
        T = zeros(1,size_patch^2);
%         N = zeros(1,size_patch^2);
        for u = i-d+2:i+d-1
            for v = j-d+2:j+d-1
                T((u-1)*size_patch+v) = I(u,v)/I(i,j);
            end
        end
        t = mean(T);
        if (t>1-e && t<=1+e && ~F(u,v))
%             D(i,j) = D(i,j)/t;
            N = zeros(1,size_patch^2);
            for u = i-d+1:i+d-1
                for v = j-d+1:j+d-1
                    N((u-1)*size_patch+v) = D(u,v)/T((u-1)*size_patch+v);
                end
            end
            N = sort(N);
            dv = mean(N);
            for u = i-d+2:i+d-1
                for v = j-d+2:j+d-1
                    D(i,j) = dv;
                end
            end
        end
    end
end
end
