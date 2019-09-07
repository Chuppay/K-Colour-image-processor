function [RGBValues] = GetRGBValuesForPoints(A,points)
% The GetRGBValuesForPoints function obtains the RGB values from each of
% the points given in the 'points' array and stores in a 3D array
% Inputs:  -A = a 3D array containing the data of an image
%          -points = a 2D array containing the points of which the RGB
%           values will be obtained from
% Outputs: -RGBValues = A 3D array containing the RGB values of the given
%           points
% Author: XinMing Yang

% create a 3D array to store RGBValues
RBGValues=zeros(size(points,1),1,3);

%cycle through and obtain the values of rows and columns of 'points'
for i=1:size(points,1)
    % cycle through number of colours
    for j=1:3
        % Store the RGB values of the points in an array
        RGBValues(i,1,j)= A(points(i,1),points(i,2),j);
    end
end

