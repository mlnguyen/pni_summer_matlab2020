function similarity = wordSimilarity(vectors, words, word1, word2)
% Compute cosine similarity between word1 and word2

% Get the embeddings of each word
vec1 = word2vec(vectors, words, word1);
vec2 = word2vec(vectors, words, word2);

% Compute cosine similarity
similarity = dot(vec1, vec2) / (norm(vec1) * norm(vec2));

end

