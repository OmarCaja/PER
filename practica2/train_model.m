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
