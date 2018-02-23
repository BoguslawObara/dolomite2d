function [imth,imtmax] = dolomite_microcracks_segmentation2d(ims,ndir,s1,s2)
%%  dolomite_microcracks_segmentation2d - microcracks segmentation using 
%%                                          linear structuring element
%   
%   REFERENCE:
%       B. Obara, 
%       Identification of transcrystalline microcracks observed in 
%       microscope images of dolomite structure using image analysis 
%       methods based on linear structuring element processing,
%       Computers & Geosciences, 33, 2, 151-158, 2007
%
%   INPUT:
%       ims     - set of color images 
%       ndir    - number of directions
%       s1      - size od line structuring element
%       s2      - size od disk structuring element
%
%   OUTPUT:
%       imth    - segmented microcracks
%       imtmax  - max tophat with rotated linear structuring element
%
%   AUTHOR:
%       Boguslaw Obara
%
%   VERSION:
%       0.1 - 15/11/2010 First implementation

%% init
imtmax = zeros(size(ims,1),size(ims,2));
for i=1:size(ims,4)
    
    im = rgb2gray(ims(:,:,:,i));
    
    % normalize
    im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));
    
    % bothat
    a = 0;
    for j=1:ndir
        a = a + 180/ndir;
        se = strel('line',s1,a);
        imt = imbothat(im,se);
        imtmax = max(imtmax,imt);
    end
end

%% thresholding
level = graythresh(imtmax);
imth = imtmax>level;

%% post-processing
se = strel('disk',s2);
imo = imopen(imth,se);
imth = imreconstruct(imo,imth);

end