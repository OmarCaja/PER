if (nargin != 1)
    printf("Usage: train_model.m <data_filename>");
end

arglist = argv();
datafile = arglist{1};
disp("Loading data...");
load(datafile);
disp("Data load complete");
errorlist = [0.1,0.01,0.001,0.0001,0.00001,.000001,.0000001,.00000001,.000000001,.0000000001,.00000000001,.000000000001,.0000000000001,.00000000000001,.000000000000001,.0000000000000001,.00000000000000001,.000000000000000001,.0000000000000000001,.00000000000000000001];
errormat = [];

for i = 1:1:20
  for j = 1:1:30
    [te, tr] = shuffle(data, 0.9, j + i);
    [ps0, ps, ph0, ph] = train_model(tr);
    [ps1, ph1] = laplace_smoother(ps, ph, errorlist(1,i));
    errormat(j, i) = clasifier_matrix(ps0,ps1,ph0,ph1,te);
  endfor
endfor

save errormat