function word4 = analogy(vectors, words, word1, word2, word3)
% Look up the completion of the analogy:
%     word1 is to word2 as word3 is to word4
% Test with the following:
%   analogy(vectors, words, 'man', 'king', 'woman')

% Get the embedding of each the input word
emb1 = word2vec(vectors, words, word1);
emb2 = word2vec(vectors, words, word2);
emb3 = word2vec(vectors, words, word3);

% Compute the embedding of word4
emb4 = emb2 - emb1 + emb3;

% Find the closest word to the new embedding
closest = mostSimilar(vectors, words, emb4);
word4 = closest{1};

end
