% A function to deactivate a number of nodes in a network at random, takes
% the current matrix and number of nodes to deactivate and returns a matrix
% with the given number of nodes deactivated
function newnetmat = randomdamage(netmat, nodestogo)
    
    newnetmat = netmat;

    % To simulate the removal of nodes, we will remove the column and row from the
    % sparse matrix, to avoid picking randomly and potentially repicking
    % some, so the matrix will essentially "shrink" but we can still make
    % any measures such as the GC size using this
    for i=1:nodestogo
        
        % Find the current size of the matrix
        [~,m] = size(newnetmat);
        
        % Pick a random integer within the size interval
        togo = randi(m);
        
        % Set this column to be empty (remove it)
        newnetmat(:,togo) = [];
        
        % Set this row to be empty (remove it)
        newnetmat(togo,:) = [];
        
    end

end