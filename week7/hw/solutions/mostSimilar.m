function closest = mostSimilar(vectors, words, emb)
% Given an embedding, return the closest words to it
% Hint: see norm and vecnorm functions
%   mostSimilar(vectors, words, word2vec(vectors, words, 'cat'))

% How many words to return.
n = 10;

% Compute the cosine distances between this word and all others
num = emb * vectors';
den = norm(emb,2) .* vecnorm(vectors,2,2);
distances = 1 - (num(:) ./ den(:));

% Sort the distances
[~, ids] = sort(distances);

% Assign the closest words
closest = words(ids(1:n));

end

