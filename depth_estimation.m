clear all
clc
   
height = 434;
width = 625;
view_number = 15;
step = 1;

LF_name = {'Ankylosaurus_&_Diplodocus_1','Bikes','Danger_de_Mort','Desktop','Flowers','Fountain_&_Vincent_2','Friends_1','Magnets_1','Stone_Pillars_Outside','Vespa','bicycle'};
for LF_i = 1:10
    LF_str = LF_name{LF_i};
    fprintf('EPI construction...\n');
    LF_SAI = cell(view_number,view_number);
    for i = 1:view_number
        for j = 1:view_number
            LF_SAI{i,j} = rgb2gray(imread(['E:\test\LF_SAI\',LF_str,'\',num2str(i),'_',num2str(j),'.bmp']));
%             LF_SAI{i,j} = im;
    %         LF_SAI{i,j} = histeq(myHE(im));
        end
    end 
    for col = 4
        for row = 2:14
            disp(['estimating : (' num2str(row) '_' num2str(col) ')']);
            
            fprintf('converting horizontal EPI...\n');
            epi_horizontal_depth = converting_horizontal_EPI(row,col,width,step,height,view_number,LF_SAI);

            fprintf('converting vertical EPI...\n');
            epi_vertical_depth = converting_vertical_EPI(row,col,height,step,width,view_number,LF_SAI);

            fprintf('depth enhancing...\n');
            depth_enhancement(height,width,view_number,row,col,epi_horizontal_depth,epi_vertical_depth,LF_str);

        end
    end
end