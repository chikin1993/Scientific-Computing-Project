% A function to damage nodes of a network over time but removing nodes of
% the highest degree first
function newnetmat = targetdamage(netmat, nodestogo)
    
    newnetmat = netmat;

    % To simulate the removal of nodes, we will remove the column and row 
    % from the sparse matrix
    for i=1:nodestogo
        
        % Create a list of the indices of the nodes with the highest degree
        highestnodes = find(sum(newnetmat) == max(sum(newnetmat)));
        
        % Choose randomly from this list and assign it
        togo = datasample(highestnodes,1);
        
        % Set this column to be empty (remove it)
        newnetmat(:,togo) = [];
        
        % Set this row to be empty (remove it)
        newnetmat(togo,:) = [];
        
    end

end