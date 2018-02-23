%% clear
clc; clear all; close all;

%% load image
for i=1:2
   ims(:,:,:,i) = imread(['./im/image' num2str(i+11) '.png']);
end

%% microcracks segmentation
ndir = 12; 
s1 = 12; 
s2 = 2;
[imth,imtmax] = dolomite_microcracks_segmentation2d(ims,ndir,s1,s2);

%% plot
figure; imagesc(imtmax); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;
figure; imagesc(imth); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;