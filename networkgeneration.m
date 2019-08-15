% A script to generate the networks used in this report, note they will be
% simialr but different each time, but are generated here and called with
% these names by the other functions to allow the targeted and random
% damage to both work on the same network individually and not require the
% network to be created each time the damage script is run, as this is very
% time consuming, especially for the Bianconi-Barabási Model

% Erdos-Reyni Model B
ERmodBnetwork = ERmodB(1000,0.1);
ERmodBnetworksmall = ERmodB(100,0.1);

% Barabási-Albert Model
BAnetwork = BAmod(1000,3);
BAnetworksmall = BAmod(100,3);

% Bianconi-Barabási Model
BBnetwork = BBmod(1000,3);
BBnetworksmall = BBmod(100,3);