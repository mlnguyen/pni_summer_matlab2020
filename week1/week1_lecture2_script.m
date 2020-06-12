
%% 1. Navigating matlab
% cd, ls, pwd, makedir
% make week_1 folder, cd into it, create new script with edit

%% 2. More on variables
% back to keynote

%% 3. Data types
% back to keynote

%% 4. Arrays and selection
% Give some examples

% Exercises for vector selection:
%  1. Create a vector with values 1-10
vec = [1 2 3 4 5 6 7 8 9 10];

%  2. Get the length of the vector
length(vec)

%  3. Return the value at index position 5
vec(5)

%  4. Return all the even numbers
vec(2:2:10)

%  5. Return values in decreasing order from 9 to 4 inclusive
vec(9:-1:4)


%% Exercises for matrix selection:
%  1. Create a 3x4 matrix (3 rows, 4 columns). The first row should contain
%     values 1-4, the second 5-9, etc. Print the matrix

mat = [1 2 3 4; 5 6 7 8; 9 10 11 12];

%  2. Get the length and size of the matrix
length(mat)
size(mat)

%  3. Select the number 4 using indexing. Repeat but use row/column selection
mat(10)
mat(1, 4)

%  4. Print all the numbers in order (1-12)
mat(1,:)
mat(2,:)
mat(3,:)

%  5. Print all the numbers in row 2. Print all the numbers in col 3. 
mat(2,:)
mat(:, 3);

%  6. Print all the numbers in row 1 and row 2
mat(1:2, :)

%% 5. Creating and modifying matrices
%  1. Use the colon operator to create a 2x5 matrix with numbers 1-5 in 
%     row1 and 6-10 in row 2

mat = [1:5; 6:10]

%  2. Replace the value at index 3 with 100.
mat(3) = 100;

%  3. Replace all the values in row 2 with -10.
mat(2,:) = -10;

%  4. Multiple all the values by 0.5
mat = mat *.5;

%% 6. Matrix operations
%  1. Create a 3x2 matrix A of 3s. Create a second 3x2 matrix B with the 
%     numbers 1-6. Add the two matrices together. Multiple the two matrices 
%     by elements.

matA = ones(3,2) * 3;
matB = [1:2; 3:4; 5:6];

mat_add = matA + matB;
mat_multe = matA .* matB;

%  2. Try multiplying matrix A by matrix B. Why didn't it work? Use 
%     transpose to modify one of the matrices and try again.

%mat_mult = matA * matB; % doesn't work because #rows in matA aren't same as #cols in matB

% transpose to do matrix mult
mat_mult = matA * matB';

%  3. Create a 2x2 matrix of ones, a 2x2 matrix of twos, and a 2x2 matrix 
%     of threes. Concatenate the three matrices in order vertically and 
%     then horizontally using square brackets and commas/semicolons. 
%     Repeat using the horzcat and vertcat functions.
matA = ones(2,2);
matB = ones(2,2) * 2;
matC = ones(2,2) * 3;

% concat vert
mat_vertcat1 = [matA; matB; matC];
mat_vertcat2 = vertcat(matA, matB, matC);

% concat horz
mat_horzcat1 = [matA matB matC];
mat_horzcat2 = horzcat(matA, matB, matC);

%  4.  Catenate the matrices from (3) in a 2x2x3 matrix
mat_3d = cat(3, matA, matB, matC);





