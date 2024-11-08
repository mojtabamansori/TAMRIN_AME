clc
clear
close all

adad = input('adad ra vared konid: ');

reverse_num = 0;
temp = abs(adad);

while temp > 0
    reverse_num = reverse_num * 10 + mod(temp, 10);
    temp = floor(temp / 10);
end

if adad < 0
    reverse_num = -reverse_num;
end

disp(['adad baraks: ', num2str(reverse_num)]);
