
%% Cell array exercises

% Exercise 1.1: 
% -Create a 2x3 cell array. The cells in the first row should contain the 
%  strings ?a?, ?b?, and ?c?. The cells in the second row should contain the
%  numbers 1, 2, and 3.

my_cell = {'a', 'b', 'c'; 1, 2, 3 };

% -Print all the values in row 1. Print all the values in column 2.
my_cell{1,:}
my_cell{:, 2}

% -Replace the values in row 2 with the numbers written out (?one?, ?two?,
%  ?three?)
my_cell{2,1} = 'one';
my_cell{2,2} = 'two';
my_cell{2,3} = 'three';


% Exercise 1.2: 
% -Create a cell array containing the 3 ToM ROI names, rTPJ, lTPJ, and 
%  precuneous. Write a for loop that iterates through the ROIs and prints them.
rois = {'rTPJ', 'lTPJ', 'precuneous'};
for i = 1:length(rois)
   disp(rois{i}); 
end



% Exercise 1.3: on your own
% -Create a cell array containing subj ids: s01, s02, s03, s04. 
% -Using a for loop, open a new figure for each subject. Name each figure 
%  by the corresponding subject id (you don't need to actually plot 
%  anything). 
% -Bonus: repeat but make a 2x2 subplot instead of a new figure for each 
%  subject


subs = {'s01', 's02', 's03', 's04'};
figure('color', 'w', 'name', 'subject examples');

for i = 1:length(subs)
   
    subplot(2,2, i); 
    title(subs{i}, 'fontsize', 12);
   
end




%% Struct exercises

% Exercise 2.1: on your own
% -Create a struct with fields for your name, university, class year, 
%  graduation year, and major(s). Display your struct. 
% -Display your class year and graduation year
% -Update your class year for next year. If you will have graduated next 
%  year, replace it with ?graduated'


edu.name = 'mai nguyen';
edu.uni = 'princeton';
edu.class_year = 'graduated';
edu.grad_year = 2020;
edu.field = 'psychology';














