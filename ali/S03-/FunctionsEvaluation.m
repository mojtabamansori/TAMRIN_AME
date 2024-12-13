clear
clc
%******************************* Functions Evaluations %******************************* 
%% soal_1 ---> reverse number
disp("************** soal_1 : reverse number")
disp("Number:")
x1 = 234;
disp(x1)
disp("Reverse:")
disp(soal_1(x1))

%% soal_2 ---> Number of Digits
disp("************** soal_2 : Number of Digits")
disp("Number:")
x2 = 7434;
disp(x2)
disp("Number of Digits:")
disp(soal_2(x2))

%% soal_3 ---> Comparing the elements of two arrays one by one
disp("************** soal_3 : Comparing the elements of two arrays one by one")
disp("Arrays:")
a = [0 1 2 3 4];
b = [0 5 2 8 2];
disp(a)
disp(b)
disp("The number of Equal  elements (one to one):")
disp(soal_3(a,b))

%% soal_3 ---> The number of even and odd number from 0 to desirable number
disp("************** soal_4 : The number of even and odd number from 0 to desirable number")
disp("Notic: In this scenario, zero is considered an even number")
disp("Number:")
x4 = 9;
disp(x4)
disp("  even  ,  odd :")
disp(soal_4(x4))
