function testAnalogies(vectors, words)

analogies = {
'king:man:queen:woman'
'man:woman:son:daughter'
'bad:worst:big:biggest'
'do:did:go:went'
'paris:france:berlin:germany'
'berlin:germany:paris:france'
'paris:france:rome:italy'
'rome:italy:paris:france'
'german:germany:french:france'
'france:french:germany:german'
'italy:italian:france:french'
'japan:japanese:china:chinese'
'tall:tallest:long:longest'
};

n_correct = 0;
for i = 1:length(analogies)
    A = analogies{i};
    vals = split(A, ':');
    prediction = analogy(vectors, words, vals{1}, vals{2}, vals{3});
    fprintf('%s -- %s\n', A, prediction);
    if strcmp(prediction, vals{4})
        n_correct = n_correct + 1;
    end
end

fprintf('%d correct out of %d\n', n_correct, length(analogies));

end
