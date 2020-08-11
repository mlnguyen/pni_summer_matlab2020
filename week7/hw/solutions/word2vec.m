function embedding = word2vec(vectors, words, word)
% Give a word, return the embedding associated with it
% or a vector of NaNs if it doesn't exist

id = find(ismember(words, word));
if isempty(id)
    embedding = nan(50,1);
else
    embedding = vectors(id,:);
end

end

