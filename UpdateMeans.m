function [means] = UpdateMeans (A,k,clusters)
% The UpdateMeans function takes the average of the points' values assigned
% to each cluster and then updates the values
% Inputs:  -A = a 3D array containing the data of a RGB image
%          -k = number of clusters
%          -clusters = a 2D array containing the clusters that each point
%          is assigned to
% Outputs: -means = A 3D array containing the mean values for each of the
%          clusters
% Author: XinMing Yang

% get the length of each dimension of the image array
[rows,cols,lays]=size(A);
% pre-allocate the not_eliminated array
not_eliminated=zeros(rows,cols,lays);
% pre-allocate the output 'means' array
means=zeros(k,1,3);

% cycle through each cluster number
for i=1:k
    % find the location of each relevant point and store it in an array
    relevant = double(i==clusters);
    % find the number of points that are in the cluster
    number_of_relevant = nnz(relevant);
    % single out each of the points and their values in the cluster
    not_eliminated= relevant.*A;
    % find the sum of all the numbers for each layer
    Total= sum(sum(not_eliminated,1),2);
    % find the average of RGB values
    average=Total/number_of_relevant;
    % store the new averages for each point in new 'means' array
    means(i,1,:)=average;
end
end

