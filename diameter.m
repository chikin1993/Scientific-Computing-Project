% A function to calulate the diameter of a network, using the tokengame
% function on each node and returning the highest value found
function maxshortest = diameter(adjmat)
    
    % A quick check to make sure we arent at the last step empty matrix
    if isempty(adjmat) == 1
        maxshortest = 0;
        return
    end
    
    % Find the number of nodes in the network
    [N,~] = size(adjmat);
        
    % Create an empty matrix to store the distance vectors
    distancemat = zeros(N,N);
    
    % Loop over each node, calculating the distances for each and appending
    % them to the distance matrix
    for i=1:N
       
        distancemat(i,:) = tokengame(adjmat,i);
        
    end
    
    % Now replace all the values the same as N to be 0
    distancemat(distancemat==N) = 0;
    
    % Now return the largest value still in the matrix to the user
    maxshortest = max(max(distancemat));
    
end