n = input('یک عدد صحیح وارد کنید: ');

if n > 0
    sum_total = sum(1:n);
    
    fprintf('مجموع اعداد صحیح مثبت تا %d برابر است با: %d\n', n, sum_total);
else
    disp('لطفاً یک عدد صحیح مثبت وارد کنید.');
end
