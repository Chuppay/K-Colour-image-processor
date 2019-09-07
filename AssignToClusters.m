function [clusters] = AssignToClusters(A,Means)
% The AssignToClusters function assigns each point of the the 3D array
% containing the image to a cluster depending on the lowest squared
% distance from each of the means.
% Inputs:  -A = A 3D array containing the data of a RGB image
%          -Means = A 3D array containing information for each of the
%           mean points
% Outputs: -clusters = A 2D array containing the corresponding cluster
%           numbers that each point has been assigned to
% Author: XinMing Yang

% get height and length of the image array
[rows,cols,~]=size(A);
% determine how many points there are in the 'Means' array
points=1:size(Means,1);
% pre-allocated the D array
D=zeros(rows,cols,size(Means,1));

% cycle through each point
for i=points
    % find the squared differences between each point in the image array
    % and the 'Means' array in all dimensions
    SquaredDifferences=(Means(i,:,:)-A).^2;
    % get the total squared distance for each point and store the
    % differences for each point of 'Means' in a temporary array D
    D(:,:,i)=sum(SquaredDifferences,3);
end
% find the minimum value of each point in the through the 3rd dimension
% (layers) and extract the index which gives the clusters array
[~,clusters]=min(D,[],3);
end
