% A function to sample random graphs from the Erdos-Renyi model A
function adjmat = ERmodA(N, K)
    
    % Create the vectors needed to store edges
    ii = zeros(1,K);
    jj = zeros(1,K);
    
    % Initialise the count of edges to 0
    edges = 0;
    
    % Use a while loop to continuously add edges until we have enough
    while edges < K
        
        % Start with values of i and j that will fail to trigger the while
        % loop
        i = 0;
        j = 0;
        uniqueCombo = false;
        
        % Another while loop to determine when the i,j values are
        % acceptable, so they dont represent a self-loop or multiple edge
        while i == j || uniqueCombo == false
            
            % Pick new values of i and j
            i = randi(N);
            j = randi(N);
            
            % check they arent the same
            if i ~= j
                uniqueCombo = true;
            end
            
            % See if the current i is in the ii vector already
            if ismember(i,ii) == 1
                
                % Get a list of booleans where i is in ii
                positions = ismember(ii,i);
                
                % loop over these and see if j is also there
                for q=1:K
                    
                    if positions(q) == 1
                        
                        % Now at this position, we have this i already, so
                        % check if the corresponding j at this place is the
                        % current j we have chosen
                        if jj(q) == j
                            uniqueCombo = false;
                        end
                    end
                end
            end
            
            % Now repeat this code but checking the other way around 
            if ismember(j,ii) == 1
                
                % Get a list of booleans where j is in jj
                positions = ismember(ii,j);
                
                % loop over these and see if j is also there
                for q=1:K
                    
                    if positions(q) == 1
                        
                        % Now at this position, we have this i already, so
                        % check if the corresponding j at this place is the
                        % current j we have chosen
                        if jj(q) == i
                            uniqueCombo = false;
                        end
                    end
                end
            end
        end
        
        % Increment edges by 1 and add them to the vectors
        edges = edges + 1;
        ii(edges) = i;
        jj(edges) = j;

    end
    
    % Now create the sparse matrix using the vectors
    adjmat = sparse(ii, jj, 1, N, N);
    
    % Add the matrix to its transpose to get the full adjacency matrix
    adjmat = adjmat + adjmat';

end