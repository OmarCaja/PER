function err = clasifier_for(ps0, ps, ph0, ph, te)  errors = 0;    for i = 1:1:rows(te)    gh = log(ph)*te(i,1:(end-1))' + log(ph0);    gs = log(ps)*te(i,1:(end-1))' + log(ps0);    if (gh > gs)      if (te(i,end) != 0)        errors++;      endif    else      if(te(i,end) != 1)        errors++;      endif    endif  endfor    err = errors / rows(te);
endfunction
