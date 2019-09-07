function [image] = CreateKColourImage(clusters,means)
% The CreateKColourImage function creates a 3D array of unsigned 8bit
% integers representing the data of an image created with k colours given
% a 2D array (clusters) of which colour to assign each pixel and a 3D array
% (means) containing the data of colours.
% Inputs:  -cluters = a 2D array containing the clusters that each point
%          is assigned to
%          -means = a 3D array containg the RGB data of the final set of
%          colours that is going to be used
% Outputs: -image = a 3D array of unsigned 8bit integers containing the
%          the image to be displayed
% Author: XinMing Yang

% round either value of means to the nearest whole number
means=round(means);
% find the dimensions of the clusters array
[rows,cols]=size(clusters);
% pre-allocate an unsigned 8bit array
image=uint8(zeros(rows,cols,3));


for i = 1:size(means,1) % cycle through each colour
    relevant=double(clusters==i); % isolate the relevant points
    % construct image by adding the relevant points' values in their
    % respective locations
    image=image + uint8(relevant.* means(i,1,:));
end

