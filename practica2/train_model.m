function [ps0, ps, ph0, ph] = train_model(tr)
  spamIndex = find(full(tr(:,end)));
  spam = tr(spamIndex, 1:(end - 1));

  hamIndex = find(~full(tr(:,end)));
  ham = tr(hamIndex, 1:(end - 1));

  ps0 = size(spam(:,1))(1,1) / size(tr(:,1))(1,1);
  ph0 = size(ham(:,1))(1,1) / size(tr(:,1))(1,1);

  ph = sum(ham)/sum(sum(ham'));
  ps = sum(spam)/sum(sum(spam'));
endfunction