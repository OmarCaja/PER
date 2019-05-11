#!/usr/local/bin/octave -qf

if (nargin != 2)
    printf("Usage: train_model.m <data_filename> <training_partition>");
end

arglist = argv();
datafile = arglist{1};
partition = str2num(arglist{2});
disp("Loading data...");
load(datafile);
disp("Data load complete");

[te, tr] = shuffle(data, partition);

spamIndex = find(full(tr(:,end)));
spam = tr(spamIndex, 1:(end - 1));

hamIndex = find(~full(tr(:,end)));
ham = tr(hamIndex, 1:(end - 1));

spamAPriori = size(spam(:,1))(1,1) / size(tr(:,1))(1,1);
hamAPriori = size(ham(:,1))(1,1) / size(tr(:,1))(1,1);

hamCondProb = sum(ham)/sum(sum(ham'));
spamCondProb = sum(spam)/sum(sum(spam'));