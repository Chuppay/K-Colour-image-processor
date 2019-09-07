function SD = SquaredDistance(P,Q)
% The SquaredDistance function calculates the square distance between 2
% points taking into account all 3 dimensions
% Inputs:  -P = a point in 3D space contained in an array
%          -Q = another point in 3D space contained in an array
% Outputs: -SD = the square distance between the two points P and Q
% Author: XinMing Yang

% pre-allocate array
SD=zeros(3,1);

% cycle through each dimension of the points
for i=1:3
    % find squared distance in each dimension and store it
    SD(i)=(P(i)-Q(i)).^2;
end

% get the total distance by adding up all the distances from all dimensions
SD=sum(SD);
end