% A DFS function to find the connected components of a graph
function components = compfind(netmat, components, node, compnum)

    % Find the indices of the non-zero elements of the column of the node
    % we are examining, but first check if the node is disconnected and if
    % so skip it?
    discon = size(find(netmat(node,:) > 0));
    
    if discon(2) ~= 0
        
        connectednodes = find(netmat(node,:) > 0);

        % Find the number of indices we have from the pevious list,
        % corresponding to the degree of this node
        nodedegree = max(size(connectednodes));

        % Loop over the nodes connected to the current one and for each,
        % recursively call this function again, the red token game
        for i=1:nodedegree

            % Set the current connected node to be the first index to check
            thisnode = connectednodes(i);

            % Now see if this value is still a 0 and change it to the value we
            % are using for this current component
            if components(thisnode) == 0

                components(thisnode) = compnum;
                components = compfind(netmat, components, thisnode, compnum);

            end

        end
        
    else 
        
        components(node) = -1;
    end
end