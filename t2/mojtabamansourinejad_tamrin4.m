clc
clear
close all

% دریافت ضرایب ماتریس A و بردار B از کاربر
disp('Dastgah ra be sorat ax + by + cz = d vared konid:');

a1 = input('Zarib a1 ra vared konid: ');
b1 = input('Zarib b1 ra vared konid: ');
c1 = input('Zarib c1 ra vared konid: ');
d1 = input('Adad mosavi aval ra vared konid: ');

a2 = input('Zarib a2 ra vared konid: ');
b2 = input('Zarib b2 ra vared konid: ');
c2 = input('Zarib c2 ra vared konid: ');
d2 = input('Adad mosavi dovom ra vared konid: ');

a3 = input('Zarib a3 ra vared konid: ');
b3 = input('Zarib b3 ra vared konid: ');
c3 = input('Zarib c3 ra vared konid: ');
d3 = input('Adad mosavi sevom ra vared konid: ');

% ساخت ماتریس A و بردار B
A = [a1, b1, c1; a2, b2, c2; a3, b3, c3];
B = [d1; d2; d3];

% حل دستگاه معادلات با استفاده از ضرب ماتریس معکوس
if det(A) ~= 0
    X = inv(A) * B;
    disp('Moqadir [x; y; z] barabar ast ba:');
    disp(X);
else
    disp('In dastgah meghdar monhaser be fard nadarad (Mojmuaaye Mortez).');
end
