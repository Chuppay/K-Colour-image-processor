function [points] = SelectKRandomPoints(A,k)
% The SelectKRandomPoints function selects a number of points from the
% image and identifies and displays the rows and columns of the selected
% points with no duplicates
% Inputs:  -A = a 3D array containing the data of an image
%          -k = number of points desired for the function to
%          display
% Outputs: -points = a 2D array showing the row and columns of the selected
%           points
% Author: XinMing Yang

[rownum,colnum,~]=size(A);
% create a 2D array to store the points
points=zeros(k+1,2);
% generate random integers between 1 and the number of rows and store in
% first coloumn
points(:,1)=randi(rownum,k+1,1);
% generate random integers between 1 and the number of columns and store in
% second column
points(:,2)=randi(colnum,k+1,1);
% first row as zeros in preperation for the unique function (when more than
% 1 lines are elminated and points are plotted at row k+1, the rows in
% between will become zeros so this will allow the code the eliminate them)
points(1,:)=[0 0];

% eliminate all the dupicates
points=unique(points,'rows');

% keep adding pair of random integers at row k+1 and eliminating duplicates
% until the height of points is k+1
while size(points,1)< k+1
    points(k+1,:) = [randi(size(A,1)),randi(size(A,2))]; %add integers at k+1
    points=unique(points,'rows'); %eliminate duplicates
end

% extract everything but first row (first row is [0,0] which was needed to
% eliminate the extra [0,0] produced by placing a random integer at row k+1
% in lines 15)
points=points(2:end,:);
end

