% A script to generate an Erdos Renyi model B graph and subject it to
% targeted damage, calculating the size of the GC after
% each iteration of damage

% Create a network to damage
testnet = ERmodBnetwork;

% Create arrays for the information to be plotted
GCsizes = zeros(1,101);
nodesdamaged = linspace(0,1000,101);

% Add the original GCsize to the list
GCsizes(1) = GCsize(testnet);

% Loop over and damage the network, recording the GCsizes as you go
for i=1:100
   
    testnet = targetdamage(testnet,10);
    GCsizes(i+1) = GCsize(testnet);
    
end

% Now plot the results
plot(nodesdamaged, GCsizes)
title("A Plot To Show An ER Model B Network Under Targeted Damage")
xlabel('Number Of Nodes Damaged')
ylabel('Number Of Nodes In The GC')