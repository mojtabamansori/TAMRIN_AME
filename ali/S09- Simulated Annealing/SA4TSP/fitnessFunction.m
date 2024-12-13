% Author: Seyedali Mirjalili
% www.alimirjalili.com
% https://scholar.google.com/citations?user=TJHmrREAAAAJ&hl=en

function [ fitness ] = fitnessFunction ( tour , graph)


fitness = 0;

for i = 1 : length(tour) -1
    
    currentNode = tour(i);
    nextNode = tour(i+1);
    
    fitness = fitness + graph.edges( currentNode ,  nextNode );
    
end
 fitness = -fitness; % SA is for maximization so multiple my -1 to change 
                     % the minimization problem to a maximization problem 
end