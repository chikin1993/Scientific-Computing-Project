% A function to determine if a network has a GC by using the Molloy-Reed
% Criterion (k2/k1 > 2)
function molloyreed = GCchecker(adjmat)

    % Set values for the 1st and 2nd moments to start with
    k1 = 0;
    k2 = 0;
    
    % Find the size of the matrix we have for the loop
    [N,~] = size(adjmat);
    
    % Create a vector made of the sums of the columns of the given matrix
    nodedegrees = sum(adjmat);
    
    % Loop over this, adding k and k^2 each time
    for i=1:N
        
        k1 = k1 + nodedegrees(i);
        k2 = k2 + nodedegrees(i)^2;
        
    end
    
    % If this value returned is greater than 2, then we do indeed have a
    % Giant Component
    molloyreed = k2/k1;

end