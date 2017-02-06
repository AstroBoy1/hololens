% Michael Omori
% 2017
% This program takes in a file of png panorama images with alpha values and

clear all;
clc;

% Specify the path to save the edited panorama images to
PATH = 'C:\Users\Michael\Documents\Assets\libraries\Resources\';

 imagefiles = dir('*.png');      
 nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   [currentimage, ~, alpha] = imread(currentfilename);
   images{ii} = currentimage;
   alphas{ii} = alpha;
end

% Processes the images
'editing images'
for i=1:nfiles
    dim = size(images{i});
    for j=1:dim(1)
        for k=1:dim(2)
            %if((images{1,i}(j, k, 1) == 255 && images{1,i}(j, k, 2) == 255 && images{1,i}(j, k, 3) == 255) || ((images{1,i}(j, k, 1) == images{1,i+1}(j, k, 1)) && (images{1,i}(j, k, 2) == images{1,i+1}(j, k, 2)) && (images{1,i}(j, k, 3) == images{1,i+1}(j, k, 3))))
            if(images{1,i}(j, k, 1) == 255 && images{1,i}(j, k, 2) == 255 && images{1,i}(j, k, 3) == 255)    
                alphas{1,i}(j, k) = 0;
            end
        end
    end
end

% Writes the image to folder given by path variable
'writing images'
for i=1:nfiles
    name = sprintf('%i_edited.png', i);
    imwrite(images{1,i}, [PATH name], 'Alpha', alphas{1,i});
end