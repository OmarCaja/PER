function err = clasifier_matrix(ps0, ps, ph0, ph, te)  gh = log(ph)*te(:,1:(end -1))' + log(ph0);  gs = log(ps)*te(:,1:(end -1))' + log(ps0);    aux = [gh;gs];  [_, maxIndex] = max(aux);  maxIndex--;  errors = sum(te(:,end) != maxIndex');    disp(errors);  err = errors / rows(te);
endfunction
