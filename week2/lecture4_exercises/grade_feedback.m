function grade_feedback(letterGrade)
% function grade_feedback(letterGrade)
%
% Gives feedback on letter grade
%
% ARGUMENTS:
% -letterGrade: string, valid grades A-D and F only.
%
% EXAMPLE:
% >> grade_feedback('B')


    switch letterGrade
        case 'A'
            disp('outstanding!')
        case 'B'
            disp('very good')
        case 'C'
            disp('average')
        case 'D'
            disp('passed')
        case 'F'
            disp('failed')
        otherwise
            disp('invalid grade')
    end
    
end