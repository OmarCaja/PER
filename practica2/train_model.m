function [ps0, ps, ph0, ph] = train_model(tr)
  spamIndex = find(full(tr(:,end))); #busca aquellos correos marcados como spam
  spam = tr(spamIndex, 1:(end - 1)); #extrae los marcados como spam

  hamIndex = find(~full(tr(:,end))); #busca los correos marcados como ham
  ham = tr(hamIndex, 1:(end - 1)); #extrae los correos marcados como ham

  ps0 = rows(spam) / rows(tr); #calcula el parametro ps0 del clasificador multinomial prob. a priori
  ph0 = rows(ham) / rows(tr); #igual que anterior pero sobre ph

  ph = sum(ham)/sum(sum(ham')); #calcula la probabilidad condicionada ph del clasificador multinomial (minimo error)
  ps = sum(spam)/sum(sum(spam')); #igual que anterior pero con ps
endfunction