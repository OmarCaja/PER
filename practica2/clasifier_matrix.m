function err = clasifier_matrix(ps0, ps, ph0, ph, te)  gh = log(ph)*te' + log(ph0);  gs = log(ps)*te' + log(ps0);  
endfunction
