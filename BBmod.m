% A function to generate networks based on the Bianconi-Barabasi model, for
% the fitness of each node, I will be using them sampled from the uniform
% distribution in [0,1]
function adjmat = BBmod(N,seed)
        
    % Create empty vectors to store the edges and fitness
    iedges = [];
    jedges = [];
    fitlist = [];
    
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
    
    % Create a fitness value for each node that already exists
    for i=1:seed
        fitness = rand();
        fitlist = [fitlist; fitness];
    end
    
    % Now we begin growing the graph, adding a node at each time step and
    % connecting it to the existing nodes based on the product of their
    % fitness and degree compared to that of the sum of thise for all
    % current nodes
    for i=seed+1:N
        
        % Create a fitness for this new node and add it to the list of them
        fitness = rand();
        fitlist = [fitlist; fitness];
        
        % Loop over all current nodes, for each we draw a random number,
        % calculate the probability of a link being created and compare
        % them
        for j=1:i-1
            
            % Sample the variable
            randp = rand();
            
            % Calculate the sum of fitness and degree
            sumdegreefit = 0;
            for k=1:i-1
                degree = numel(find(iedges==k)) + numel(find(jedges==k));
                fitness = fitlist(k);
                sumdegreefit = sumdegreefit + degree*fitness;
            end
            
            % Find the degreefit of the current node
            degree = numel(find(iedges==j)) + numel(find(jedges==j));
            fitness = fitlist(j);
            degreefit = degree*fitness;
            
            % Find the quotient of these to give the probability an edge
            % exists
            edgeprob = degreefit/sumdegreefit;
            
            % Compare and add if its passes
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