clear
close
clc
%% Objective Function ------> Minimizing 
syms x1 x2
f(x1,x2) = (x1-2)^2 + x2;

%% Domain Solutions
minVar = 0;
MaxVar = 10;

%% Simulated Annealing

%------------ Initial Parameter
InitTemp = 2;
CoolingFactor = 0.995;
MaxIter = 1000;

%------------ Start Algorithm
X = randi([minVar,MaxVar],2,1);
Temp = InitTemp;




for i = 1:MaxIter

    CostList(i) = f(X(1),X(1)); 
    TempList(i) = Temp;
    %-------- select Neighbor Variable
    while(1)
        X_Neighbor = X + [randi([-1,1]);randi([-1,1])];
        X_Neighbor = max(minVar , X_Neighbor);
        X_Neighbor = min(MaxVar, X_Neighbor);
        if X ~= X_Neighbor
            break
        end
    end 
    %-------------------------------------

    ValueX = double(f(X(1),X(2)));
    ValueX_Neighbor = double(f(X_Neighbor(1),X_Neighbor(2)));
    D = ValueX - ValueX_Neighbor;

    if ValueX > ValueX_Neighbor  % uphill move (good move)
        X = X_Neighbor;
    else % downhill move (bad move)
        P = exp(D/Temp);
        if rand() <= P
            X = X_Neighbor;
        end
    end

    %------------ Temperature Update
    Temp = CoolingFactor * Temp;
    
     %------------ Display
    outmsg = [ 'Iteration :' , num2str(i) ,'-------Temperature =  ', num2str(Temp) ...
                ,' -------Function Value = ' , num2str(double(f(X(1),X(2))))  ];
    disp(outmsg)

    %------------ Plot
    subplot(211)
    plot(CostList)
    xlabel('Iteration')
    ylabel('Cost')
    xlim([0,MaxIter])
    ylim([0,double(CostList(1))+5])

    %------------ Plot
    subplot(212)
    plot(TempList)
    xlabel('Iteration')
    ylabel('Temperature')
    xlim([0,MaxIter])
    ylim([0,InitTemp])

    drawnow()

end

    finalSolution = ['      X1 = ' num2str(X(1)), '       X2 = ', num2str(X(2)), '       cost =', num2str(double(f(X(1),X(2)))) ];
    disp("****************** Final Solution ******************")
    disp(finalSolution)
