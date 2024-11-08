clc
clear
close all

adad = input('adad vard konid: ');

div = abs(adad);

if div == 0
    i = 1;
else
    i = 0;
    while div >= 1
        div = floor(div / 10);
        i = i + 1;
    end
end

disp(['Tedad arqam: ', num2str(i)]);
