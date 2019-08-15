% A function that is a modified version of the compfindall function. The
% goal is to get the sizes of all of the components, and then return to me
% the size of the largest one
function GCsize = GCsize(netmat)

    % Firstly call compfindall to get the components of the network
    comps = compfindall(netmat);
    
    % Now remove all ter entries of -1 corresponding to disconnected nodes
    comps = comps(comps~=-1);
    
    % Take the mode of the components to see which one occurs the most and
    % so is the largest
    mostfrequent = mode(comps);
    
    % Now find the number of times this appears, corresponding to its size
    % in the network
    commoncomp = comps(comps == mostfrequent);
    
    % Find the size of this and it should be the number of nodes in the
    % largest connected component
    GCsize = numel(commoncomp);
    
    end