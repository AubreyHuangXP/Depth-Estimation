function LF_SAI = im_enhancement(LF_str, column)


for i = 1:column
    for j = 1:column
        im = rgb2gray(imread(['E:\test\LF_SAI\',LF_str,'\',num2str(i),'_',num2str(j),'.bmp']));
        LF_SAI{i,j} = myHE(im);
    end
end  
