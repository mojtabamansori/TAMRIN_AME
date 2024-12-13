clear
clc
%% Initialization
% x is argument of Cosine function ( cos(x) )
x  = 120; %degre  
x = x*pi/180;

% number of iteration of Taylor serie
N = 50; 

% My Cosine variable
COS = 1;

%% Serie Calculation
for n = 1:N

    % satrat of Factorial
    f = 2*n;
    fact2N = 1;
    while f
        fact2N = fact2N*f;
        f = f-1;
    end
    % end of Factorial
   term = ( x^(2*n) * (-1)^n )/ fact2N;
   COS = COS + term;
end

%% Display
disp ("My Csoine Function:")
disp(COS)
disp("Valdiation")
disp(cos(x))
