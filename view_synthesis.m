clear all
clc
LF_name = {'Bikes','Danger_de_Mort','Flowers','Magnets_1','Stone_Pillars_Outside'};
view = [0 0 0 0 1 0 0 0 0 0 2 0 0 0 0];
for LF_i = 1:5
perf_ssim = zeros(15,15);
perf_psnr = zeros(15,15);
for c = 5:3:11
sft = 5;
LF_str = LF_name{LF_i};
for frame = 2:14
im_cen = imread(['E:\test\LF_video\',LF_str,'\',int2str(view(c)),'\',int2str(frame),'.bmp']);
height = size(im_cen,1);
width = size(im_cen,2);
imwrite(im_cen,['E:\test\LF_rec\',LF_str,'\',int2str(frame),'_',int2str(c),'.bmp']);
depth = im2double(imread(['E:\test\LF_depth\Ours\',LF_str,'\1\depth_',int2str(frame),'_',int2str(c),'.bmp']))-0.4;
num_of_synview = 1;

%% horizontal left synthesis
for angular = -sft:-sft:-sft*num_of_synview

        im_new = zeros(height,width,3,'uint8');
%         im_cen = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(frame),'_8.bmp']);
%         depth = im2double(imread(['E:\test\LF_depth\Ours\',LF_str,'\1_test.bmp']))-0.4;
        for i = 1:height
            for j = 1:width
                dis = depth(i,j);
                if round(j+angular*dis)<width && round(j+angular*dis)>1
                    im_new(i,j,:) = im_cen(i,round(j+angular*dis),:);
                end
            end
        end
    %     im_new(:,1:3,:) = im_cen(:,1:3,:);
%     imwrite(im_new,['E:\test\test\comparison\8_',int2str(8+(angular/3)),'.bmp']);
    gt = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(frame),'_',int2str(c+(angular/sft)),'.bmp']);
    imwrite(im_new,['E:\test\test\',int2str(frame),'_',int2str(c+(angular/sft)),'.bmp']);
    perf_ssim(frame,c+angular/sft) = ssim(im_new,gt(1:height,1:width,:));
	perf_psnr(frame,c+angular/sft) = psnr(im_new,gt(1:height,1:width,:));

end

%% horizontal right synthesis
for angular = sft:sft:sft*num_of_synview

        im_new = zeros(height,width,3,'uint8');
%         im_cen = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(frame),'_8.bmp']);
%         depth = im2double(imread(['E:\test\LF_depth\Ours\',LF_str,'\1_test.bmp']))-0.4;
        for i = 1:height
            for j = 1:width
                dis = depth(i,j);
                if round(j+angular*dis)<width && round(j+angular*dis)>1
                    im_new(i,j,:) = im_cen(i,round(j+angular*dis),:);
                end
            end
        end
%     im_new(:,end-3:end,:) = im_cen(:,end-3:end,:);
%         imwrite(im_new,['E:\test\test\comparison\8_',int2str(8+(angular/3)),'.bmp']);
        gt = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(frame),'_',int2str(c+(angular/sft)),'.bmp']);
        imwrite(im_new,['E:\test\test\',int2str(frame),'_',int2str(c+(angular/sft)),'.bmp']);
        perf_ssim(frame,c+(angular/sft)) = ssim(im_new,gt(1:height,1:width,:));
        perf_psnr(frame,c+(angular/sft)) = psnr(im_new,gt(1:height,1:width,:));

end

%% vertical synthesis
% for angular = -3:-3:-21
%     im_new = zeros(432,624,3,'uint8');
%     for i = 1:432
%         for j = 1:624
%             dis = depth(i,j);
%             if round(i+angular*dis)<432 && round(i+angular*dis)>1
%                 im_new(i,j,:) = im_cen(round(i+angular*dis),j,:);
%             end
%         end
%     end
% %     im_new(1:3,:,:) = im_cen(1:3,:,:);
% %     im_new(end-3:end,:,:) = im_cen(end-3:end,:,:);
%     imwrite(im_new,['E:\test\test\comparison\',int2str(8+(angular/3)),'_8.bmp']);
%     gt = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(8+(angular/3)),'_8.bmp']);
%     performance(-angular/3,1) = ssim(im_new,gt(1:432,1:624,:));
%     performance(-angular/3,2) = psnr(im_new,gt(1:432,1:624,:));
% end

%% vertical synthesis
% for angular = 3:3:21
%     im_new = zeros(432,624,3,'uint8');
%     for i = 1:432
%         for j = 1:624
%             dis = depth(i,j);
%             if round(i+angular*dis)<432 && round(i+angular*dis)>1
%                 im_new(i,j,:) = im_cen(round(i+angular*dis),j,:);
%             end
%         end
%     end
% %     im_new(1:3,:,:) = im_cen(1:3,:,:);
% %     im_new(end-3:end,:,:) = im_cen(end-3:end,:,:);
%     imwrite(im_new,['E:\test\test\comparison\',int2str(8+(angular/3)),'_8.bmp']);
%     gt = imread(['E:\test\LF_SAI\',LF_str,'\',int2str(8+(angular/3)),'_8.bmp']);
%     performance(8+(angular/3),1) = ssim(im_new,gt(1:432,1:624,:));
%     performance(8+(angular/3),2) = psnr(im_new,gt(1:432,1:624,:));
% end
end
end
%% display
% im_new(:,1:3,:) = im_cen(:,1:3,:);
% imwrite(im_new,'E:\test\test\comparison\8_6.bmp');
% avg = sum(perf_ssim)/14;
% PSNR = psnr(im_new,gt);    % PSNR score
% SSIM = ssim(im_new,gt);    % SSIM score
avg_perf_ssim = mean(perf_ssim(perf_ssim~=0));
avg_perf_psnr = mean(perf_psnr(perf_psnr~=0));
% figure;
% suptitle(sprintf('PSNR: %.3f, SSIM: %.3f',PSNR,SSIM));
% subplot(1,2,1);
% imshow(gt);
% title('ground truth');
% subplot(1,2,2);
% imshow(im_new);
% title('synthesized view');
end