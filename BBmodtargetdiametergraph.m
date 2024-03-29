% A script to take a Bianconi-Barab�si network and subject it to
% targeted damage, calculating the network diameter after
% each iteration of damage

% Create a network to damage
testnet = BBnetworksmall;

% Create arrays for the information to be plotted
diameters = zeros(1,21);
nodesdamaged = linspace(0,100,21);

% Add the original diameter to the list
diameters(1) = diameter(testnet);

% Loop over and damage the network, recording the diamters as you go
for i=1:20
   
    testnet = targetdamage(testnet,5);
    diameters(i+1) = diameter(testnet);
    
end

% Now plot the results
plot(nodesdamaged, diameters)
title("A Plot To Show A Bianconi-Barab�si Network Under Targeted Damage")
xlabel('Number Of Nodes Damaged')
ylabel('Network Diameter')