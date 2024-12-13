function output = soal_1(input)
output = 0;
while input
    output = output * 10 + mod(input, 10); 
    input = floor(input / 10);  
end
end
