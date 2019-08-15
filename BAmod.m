% A function used to generate graphs using the Barabasi-Albert Model, note,
% I am using the more inefficient implimentation which works in the same
% way as the described algorithm. This is as I did not want to just use the
% one from the course notes and can be reused with modification for the
% Bianconi-Barabasi model, and on current hardware, the netwroks are still
% generated within a reasonable time. 
% Note: to avoid loops, use a seed value of at least 3
function adjmat = BAmod(N,seed)
        
    % Create empty vectors to store the edges
    iedges = [];
    jedges = [];
    
    % Create a seed graph to grow from, a cycle where each node has degree
    % 2 to give a uniform starting position, first add all edges except the
    % last one needed
    for i=1:seed-1
        iedges = [iedges; i];
        jedges = [jedges; i+1];
    end
    
    % Now add the final edge, linking the last node back to the first
    iedges = [iedges; seed];
    jedges = [jedges; 1];
    
    % Now we begin growing the graph, adding a node at each time step and
    % connecting it to the existing nodes based on their share of the links
    % in the current network, repeating until we have N nodes in total
    for i=seed+1:N
        
        % Loop over all current nodes, for each we draw a random number,
        % calculate the probability of a link being created and compare
        % them
        for j=1:i-1
            
            % Sample the variable
            randp = rand();
            
            % Calculate the probability the new node is connected to a node
            % j in the network
            degree = numel(find(iedges==j)) + numel(find(jedges==j));
            sumdegree = 2*numel(iedges);
            edgeprob = degree/sumdegree;
            
            % compare and add if its passes
            if randp < edgeprob
                
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