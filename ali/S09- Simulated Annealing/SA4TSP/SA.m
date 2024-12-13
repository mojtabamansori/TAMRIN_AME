% Author: Seyedali Mirjalili
% www.alimirjalili.com
% https://scholar.google.com/citations?user=TJHmrREAAAAJ&hl=en

clear all
close all
clc

%% Problem preparation 

% Create the graph 
graphNo = 1; 
[ graph ]  = createGraph(1);
nVar = graph.n;

A.position = randperm(nVar);
A.cost = fitnessFunction ( [A.position,  A.position(1)]  , graph);


% Draw the graph 
figure 
set(gcf,'position' , [50,50,700,700])
subplot(2,2,1)
drawGraph( graph); 


%% SA algorithm 

%% Initial parameters of ACO 
T0=1;       % Initial Temp.
T=T0;

alphaa=0.995;     % Cooling factor
maxIteration = 100;


%% Main loop of SA 

bestFitness = inf;
bestTour = [];
fitness_hist = 0;

for t = 1 : maxIteration
    
    fitness_hist(t) = A.cost;
    TT(t) = T;
    B.position=createNeighbour(A.position);
    B.cost = fitnessFunction ( [B.position,  B.position(1)] , graph);
    
    Delta = A.cost - B.cost;

    if Delta < 0  % uphill move (good move)
        A.cost = B.cost;
        A.position = B.position;
    else % downhill move (bad move)
        P=exp(-Delta/T);
        if rand<=P
            A.cost = B.cost;
            A.position = B.position;
        end
    end

    
    % Update Temp.
    T=alphaa*T;
    
    % Display the results 
    
    outmsg = [ 'Iteration #' , num2str(t) , ' Shortest length = ' , num2str(A.cost)  ];
    disp(outmsg)
    subplot(2,2,2)
    title(['Iteration #' , num2str(t) ])
    % Visualize best tour and phromone concentration
    % cla
    drawBestTour( A.position, graph );
    
    
    subplot(2,2,3);
    plot(fitness_hist)
    xlabel('Iteration')
    ylabel('-Best tour length')
    subplot(2,2,4);
    plot(TT)
    xlabel('Iteration')
    ylabel('Temperature')
    
   drawnow
end









