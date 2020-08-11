function plotMostSimilar(vectors, words, word, n)

% Use PCA to find principal components (see help pca)
[~,scores] = pca(vectors);

% Get embedding of `word`
emb = word2vec(vectors, words, word);

% Find the closest `n` embeddings/words
% Hint: the sort function can return two variables (see `help sort`)
distances = 1 - (emb * vectors');
[~, ids] = sort(distances);
most_similar = ids(1:n+1);

% Extract the words we care about from the PCA and only their first
% and second principal components
proj2d = scores(most_similar,1:2);
x = proj2d(:,1);
y = proj2d(:,2);

% Plot the points and text
figure;
scatter(x,y);
text(x+.01,y+.01,words(most_similar));

end

