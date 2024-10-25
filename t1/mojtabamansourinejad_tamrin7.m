clc
identity_matrix = eye(4);

disp('ماتریس همانی 4x4:')
disp(identity_matrix);

random_matrix = rand(4, 4);

disp('ماتریس تصادفی 4x4:')
disp(random_matrix);

result_matrix = identity_matrix * random_matrix;

disp('ماتریس جدید حاصل از ضرب ماتریس همانی با ماتریس تصادفی:')
disp(result_matrix);
