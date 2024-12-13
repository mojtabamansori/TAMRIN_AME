clear
clc
%% Initialization
% x is argument of Sine function ( cos(x) )
x  = 90; %degre  
x = x*pi/180;

% number of iteration of Taylor serie
N = 50; 

% My Cosine variable
SIN = 0;

%% Serie Calculation
for n = 0:N

    % satrat of Factorial
    f = 2*n +1;
    fact2N1 = 1;
    while f
        fact2N1 = fact2N1*f;
        f = f-1;
    end
    % end of Factorial
   term = ( x^(2*n+1) * (-1)^n )/ fact2N1;
   SIN = SIN + term;
end

%% Display
disp ("My Csoine Function:")
disp(SIN)
disp("Valdiation")
disp(sin(x))
