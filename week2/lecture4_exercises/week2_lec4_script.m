
%% 1. logical statements
% in keynote

%% 2. Practice evaluating logicals
%
% True or false? Write down your answer and then test in MATLAB
%  - 2+2 == 4
%  - isempty([])
%  - isempty(5)
%  - isempty([]) && (2+2 == 4)
%  - ~isempty([]) && (2+2 == 4)
%  - ~isempty([]) || (2+2 == 4)

%% 3. Logical selection
% back to keynote

%% 4. Practice logical selection
%
% 1. Using the randi function, create a 3x4 matrix of values from 1-10 
mat = randi(10, 3, 4)

% 2. Return a matrix of logicals indicating values that are greater than or
%    equal to 8
inds = (mat >= 8);

% 3. Find the values that are greater than or equal to 8
val = mat(inds)

% 4. Find the indices of values that are greater than or equal to 8
find(inds)
find(mat >=8) % these are equiv

% 5. Find the values that are greater than or equal to 8 OR less than 3
inds = (mat >= 8) | (mat < 3);
mat(inds)

% 6. Replace all the values less than 5 with nans
mat(mat<5) = nan;

% or
mat = randi(10, 3, 4)
inds = mat < 5
mat(inds) = nan

% 7. Find the indices of the nans
find(isnan(mat))

inds = isnan(mat);
find(inds)
%% 5. If/else statements
% in keynote

%% 6. If/else statements practice
% Write a function pass_test(score) that checks if the input value is at 
% least a passing score of 0.65. The function has one argument, score
%   - If the score is between 0.65 and 1, the student passes! Print a 
%     message saying so.
%   - If the score is between 0 and 0.64, the student fails. Print a 
%     message saying so.
%   - If the score is not between 0 and 1 inclusive, it is invalid. Print a
%     message saying so
%
% Test your function
%   - pass_test(.96)
%   - pass_test(.65)
%   - pass_test(.5)
%   - pass_test(-.1)
%   - pass_test(1.5)

%% 7. Switch statements
% in keynote

%% 8. Switch statements practice
% Write a function that gives feedback on grades, grade_feedback(letterGrade). 
%   - If the grade is an A, print ?outstanding?
%   - If the grade is a B, print ?very good?
%   - If the grade is a C, print ?average?
%   - If the grade is a D, print ?passed?
%   - If the grade is an F, print ?failed?
%   - If the input value is not one of the above, print ?invalid input?
%
% Test your function
%   - grade_feedback(?A?) %repeat for all letter grades
%   - grade_feedback(100)




