clc
clear
close all

arr1 = input('Araye 1 ra vared konid: ');
arr2 = input('Araye 2 ra vared konid: ');

common_count = sum(arr1 == arr2);

disp(['Tedad moghadir moshtarak: ', num2str(common_count)]);
