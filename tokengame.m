% A function to implement a BFS search on a network and return a list of
% distances from a given node
function distances = tokengame(adjmat, startnode)

    % Get the number of nodes
    [N,~] = size(adjmat);
    
    % Find number of edges
    edges = sum(sum(adjmat))/2;
    
    % Create a vector for the distances to live, and set all of them to N,
    % akin to infinte in a network
    distances = ones(1,N) * N;
    
    % Create a vector for a "first in - first out" queue and give all
    % entries a starting value of 1
    queue = zeros(1, edges) + 1;
    
    % Using the need we start from, put it at the front of the queue and
    % set its distance from itself to be 0
    queue(1) = startnode;
    distances(startnode) = 0;
    
    % Create values for the front and back of the queue
    front = 1;
    back = 2;
    
    % A while loop to go over the queue and give out the tokens while we
    % still have people standing in line
    while back > front
    
        % Assign the node that is currently being checked, beingserved in
        % this example as a queue makes me think of a fastfood line, and
        % then increase front by one to move on in the next execution of
        % this code
        beingserved = queue(front);
        front = front + 1;
        
        % Loop over all the nodes in the network
        for i=1:N
           
            % See if a node is directly connected to the one beingserved
            if adjmat(beingserved, i) > 0
               
                % Now check to see if the distance we have for this node
                % already exists as a non-trivial value and set it to be
                % one greater than that of beingserved, then put this node
                % at the back of the queue and increase back by 1
                if distances(i) > distances(beingserved)
                    
                    distances(i) = distances(beingserved) + 1;
                    queue(back) = i;
                    back = back + 1;
                    
                end
                
            end
            
        end
        
    end

end