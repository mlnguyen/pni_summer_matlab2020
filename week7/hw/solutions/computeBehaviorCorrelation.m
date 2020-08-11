function r = computeBehaviorCorrelation(vectors, words)
% In this function we will compare embedding similarities with human
% similarity judgements for pairs of words using correlation.

% Use `readtable` to read in word-sim.csv
wordsim = readtable('word-sim.csv');
n = height(wordsim);

% For each word pair, compute its similarity and store it in an array
sims = zeros(n,1);
for i = 1:height(wordsim)
    word1 = wordsim{i,1};
    word2 = wordsim{i,2};
    sims(i) = wordSimilarity(vectors, words, word1, word2);
end

% Extract only the human scores from the table
human_scores = table2array(wordsim(:,3));

% Important: wordSimilarity can return a vector of NaNs if a word doesn't exist,
% so make sure to remove them from both human scores and cosine similarities 
% before computing correlation. See the function `isnan`.
keep = ~ isnan(sims);
sims = sims(keep);
human_scores = human_scores(keep);

% Compute and return Spearman correlation
r = corr(sims, human_scores, 'Type', 'Spearman');

end

