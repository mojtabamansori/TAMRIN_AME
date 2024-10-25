clc

random_matrix = rand(2, 2);

zero_matrix = zeros(2, 2);

combined_matrix = [random_matrix, zero_matrix];

disp('ماتریس ترکیبی 2x4 از ماتریس تصادفی و ماتریس صفر:')
disp(combined_matrix);

zero_matrix = zeros(2, 2);

combined_matrix = cat(2, random_matrix, zero_matrix); 

disp('ماتریس ترکیبی 2x4 از ماتریس تصادفی و ماتریس صفر با استفاده از تابع cat:')
disp(combined_matrix);
