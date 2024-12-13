clc
clear
%% Enter Problem by User
% disp('Please Enter The Coefficients of objective Function ');
% disp('Exmaple: -2x-3y -------> Enter: [-2;3]')
% OF = input('Enter: ');
% fprintf("\n");



% disp('Please Enter The Coefficients of inequality constraints');
% disp('Exmaple: 2x+y <= 8 & x+y <= 4 -------> Enter: [2 1;1 1]');
% Constraint_L = input('Enter: ');
% fprintf("\n");


% disp('Please Enter The right  of inequality constraints');
% disp('Exmaple: 2x+y <= 8 & x+y <= 4 -------> Enter: [8;4]');
% Constraint_R = input('Enter: ');
% fprintf("\n");

%% Enter Problem

% The Coefficients of objective Function
OF = [-3;-4];

% The Coefficients of objective Function
Constraint_L = [1 1;2 1];

% The right  of inequality constraints
Constraint_R = [4;5];
%% Simplex Algorithm
% Add slacks
Constraint_L = [Constraint_L eye(size(Constraint_L,1))];
Constraint = [Constraint_L Constraint_R];

% Table Generating
Table = zeros(size(Constraint_R,1)+1, size(OF,1)+size(Constraint_R,1)+1);
Table(1,1:size(OF,1)) = OF;
Table(2:2+size(Constraint,1)-1,1:size(Constraint,2)) = Constraint;

% Start
while sum(Table(1,1:end-1) < 0) ~= 0
    
    P_Col = find(Table(1,1:end-1) == min(Table(1,1:end-1)),1); 

    P_ratio =[];
    for i = 2:size(Table,1)
        P_ratio =  [P_ratio Table(i,end)/Table(i,P_Col)]; 
    end

    P_Row = 1 + find(P_ratio == min(P_ratio));

    P_element = Table(P_Row,P_Col);

    Table(P_Row,:) = Table(P_Row,1:end)/P_element;
    for i = 1:size(Table,1)
        if i ~= P_Row
             Table(i,:) = -Table(i,P_Col)*Table(P_Row,:) + Table(i,:);
        end
    end


end
%% Extract the Values
Cost = Table(1,end);

Var = zeros(size(OF));
P_Indexs=[];
for i = 1:size(size(OF),2)
    for j = 1:size(Table,1)
        if size(find(Table(:,i)==1),1) == 1 && sum(Table(:,i)) == 1
            index = find(Table(:,i) == 1);
            Var(i) = Table(index,end); 
            P_Indexs = [P_Indexs,index];
            break
        end
        
    end
end

Slacks = zeros(size(Constraint_L,1),1);
for i = 1:size(size(OF),2)
    if size(find(Table(:,i)==1),1) ~= 1 
        for j = 2:size(Table,1)
            if sum(j==P_Indexs) == 0
                Slacks(j-1) = Table(j,end);
            end
        end
    end
end

%% Display
disp('******************************')
disp('*****      Results      ******')
disp('******************************')
disp('Variables:')
disp(Var);
disp('Slacks: ')
disp(Slacks);
disp('Cost: ')
disp(Cost);






