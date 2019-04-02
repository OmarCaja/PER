load trdata.mat.gz
load trlabels.mat.gz
m = mean(X')'; % Calculamos la media

for c = unique(xl)
  ic = find (xl == c);
  xc = X(:, ic);

