%% clear
clc; clear all; close all;

%% load image
for i=1:11
   ims(:,:,:,i) = imread(['./im/image' num2str(i) '.png']);
end

%% Grains segmentation
s1 = 8; 
s2 = 5;
[imth,imvmax] = dolomite_grains_segmentation2d(ims,s1,s2);

%% plot
figure; imagesc(ims(:,:,:,1)); colormap jet; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;
figure; imagesc(imvmax); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;
figure; imagesc(imth); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;