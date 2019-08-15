% Function used to generate graphs from the Erdos-Renyi Model Model B
function adjmat = ERmodB(N, p)
    
    % Create empty vectors to the edges to live
    iedges = [];
    jedges = [];
    
    % Loop over the columns for each node
    for i=1:N
        
        % Loop again inside this for the rows, one higher to not check
        % itself
        for j=i+1:N
           
            % Sample a random number to compare to p
            newp = rand();
            
            % See if this is less than p, and add the edge if so
            if newp < p
                iedges = [iedges; i];
                jedges = [jedges; j];
            end  
        end
    end

    % Now use these edgelist vectors to form a sparse matrix
    adjmat = sparse(iedges, jedges, 1, N, N);
    
    % Add this matrix to its transpose to give the symetric adjacency
    % matrix and return this to the user
    adjmat = adjmat + adjmat';
    
end 