function [clusters,means] = KMeansRGB(A,seedmeans,k)
% The KMeansRGB function repeats the 'AssignToClusters' function and
% 'UpdateMeans' until the updated means is the same as the previous set of
% means then
% Inputs:  -A = a 3D array containing the data of a RGB image
%          -seedmeans = a 3D array containg the RGB data of the original
%          set of means
%          -k = maximum amount of iterations
% Outputs: -clusters = a 2D array containing the clusters that each point
%          is assigned to
%          -means= a 3D array containg the RGB data of the final set of
%          means
% Author: XinMing Yang


% find the clusters that each of the points are assigned to
clusters = AssignToClusters(A,seedmeans);
% find the amount of clusters that are produced
c=size(seedmeans,1);

% go through the first iteration
% update the means according to the clusters
means = UpdateMeans (A,c,clusters);
% assign the seedmeans as old_means
old_means=seedmeans;
% use a logical variable to use for the while loop
same_mean = isequal(means,old_means);
% iteration count is 1
i=1;

% when 'means' and 'old_means' are not the same, proceed
while  ~same_mean
    % old_means now takes the value of means
    old_means=means;
    % find the new cluster number that each point is assigned to
    clusters = AssignToClusters(A,means);
    % update the values of the means
    means=UpdateMeans (A,c,clusters);
    % increase iteration count
    i=i+1;
    
    if i==k % iteration count has reached max
        message=['Maximum number of iterations reached before ' ...
            'convergence was achieved'];
        warning(message); % display warning message
        return
    end
    %update condition using new values of 'means' and 'old_means'
    same_mean = isequal(means,old_means);
end
end