% A second test script to create a graph of GC size over time under random
% attack

% Create a network to damage
testnet = testmat2;

% Create arrays for the information to be plotted
GCsizes = zeros(1,101);
nodesdamaged = linspace(0,1000,101);

% Add the original GCsize to the list
GCsizes(1) = GCsize(testnet);

% Loop over and damage the network, recording the GCsizes as you go
for i=1:100
   
    testnet = randomdamage(testnet,10);
    GCsizes(i+1) = GCsize(testnet);
    
end

% Now plot the results
plot(nodesdamaged, GCsizes)
title("A Plot To Show A Test Network Under Random Damage")
xlabel('Number Of Nodes Damaged')
ylabel('Number Of Nodes In The GC')