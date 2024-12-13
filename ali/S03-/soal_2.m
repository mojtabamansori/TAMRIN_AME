function output = soal_2(input)
output=0;
while input
    output = output+1;
    input = floor(input / 10); 
end
end