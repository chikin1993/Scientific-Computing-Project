% A function that is a mostly a loop of compfind that keeps calling it
% until all the different components have been found
function allcomps = compfindall(netmat)

    % Initialise the vector to start with by looking at the size of the
    % matrix
    netsize = size(netmat);
    N = netsize(1);
    allcomps = zeros(1,N);
    
    % Starting value of the component to look for
    compnum = 1;

    % Initiaise the size of the vector saying if there zeros
    indices = find(allcomps == 0);
    sizeindices = size(indices);

    % Use a while loop and keep calling the compfind function until there are
    % no more zero elements in the vector, indicated by the second value of
    % this array being 0
    while sizeindices(2) ~= 0

        allcomps = compfind(netmat, allcomps, indices(1), compnum);
        compnum = compnum + 1;
        indices = find(allcomps == 0);
        sizeindices = size(indices);

    end