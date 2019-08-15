% A function to calculate the first and second moments of a network given
% its adjacent matrix, useful in showing if there would be a GC and how
% many nodes we need to remove to dissolve it.
function critfract = criticalfraction(adjmat)

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
    
    % Now calculate the fraction needed to remove the GC
    critfract = 1 - (1/((k2/k1)-1));
    
end