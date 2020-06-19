
function pass_test(score)
% function pass_test(score)
%
% Tells you whether you passed or failed the test.
%
% ARGUMENTS:
% -score: a number betwee 0 and 1 that is your score
%
% EXAMPLE:
% >>pass_test(.75)

if (score >= .65) && (score <= 1)
        fprintf('you passed!\n')
        
    elseif (score >= 0) && (score <= .64)
        fprintf('you failed :( \n')
        
    else
        fprintf('that''s not a real score!\n');
    end

end