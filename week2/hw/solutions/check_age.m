function eligible = check_age()
% function eligible = check_age()
%
% Prompts user to enter their age and checks if they are eligible to
% particpate in the study. First checks if the subject entered a number.
% Then checks that the entered number is a possible age, a number between
% 0-120 inclusive. Finally, checks that the participant is at least 18
% years old and therefore eligible to participate in the study.
%
% OUTPUTS:
%   -eligible: 1 or 0 indicating if subject is eligible (1) or ineligible
%              (0) to participate in the study
%
% EXAMPLE:
% >>check_age();

% Prompt user to enter their age
age = input('Enter your age: ');

% Check if subject entered a number
if ~isnumeric(age) 
    eligible = 0;
    disp('The value you entered is not a number.')
    
else 
    % Check if number is a valid age
    if age < 0 || age > 120
        eligible = 0;
        disp('The value you entered is not a valid age.');
        
    else
        % Check if at least 18 years old
       if age < 18
           eligible = 0;
           disp('Sorry, you must be at least 18 years old to participate.');
       else
           eligible = 1;
           disp('You are eligible to participate in this study.')
       end
    end
end