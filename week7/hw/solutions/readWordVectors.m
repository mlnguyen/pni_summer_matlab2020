function [words, vectors] = readWordVectors(vectors_file)
% Read the embeddings vector file and return two variables:
% - words: numberOfWords x 1 cell array
% - vectors: numberOfWords x embeddingDimensions

struct = load(vectors_file);
words = cellstr(struct.words);
W = struct.emb;
vectors = W;

end