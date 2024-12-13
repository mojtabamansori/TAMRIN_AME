function output = soal_4(input)
    number = 0:input;
    even = mod(number,2)==0;
    odd = 1-even;
    output = [sum(even)];
    output = [output sum(odd)];
end