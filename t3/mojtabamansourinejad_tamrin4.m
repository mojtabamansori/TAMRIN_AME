clc
clear
close all

num = input('Yek adad vared konid: ');

even_count = 0;
odd_count = 0;

for i = 1:num
    if mod(i, 2) == 0
        even_count = even_count + 1;
    else
        odd_count = odd_count + 1;
    end
end

disp(['Tedad adad zouj: ', num2str(even_count)]);
disp(['Tedad adad fard: ', num2str(odd_count)]);
