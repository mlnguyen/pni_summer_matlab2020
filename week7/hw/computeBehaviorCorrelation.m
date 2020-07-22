function r = computeBehaviorCorrelation(vectors, words)
% In this function we will compare embedding similarities with human
% similarity judgements for pairs of words using correlation.

% Use `readtable` to read in word-sim.csv 


% For each word pair, compute its similarity and store it in an array







% Extract only the human scores from the table


% Important: wordSimilarity can return a vector of NaNs if a word doesn't exist,
% so make sure to remove them from both human scores and cosine similarities 
% before computing correlation. See the function `isnan`.




% Compute and return Spearman correlation


end

