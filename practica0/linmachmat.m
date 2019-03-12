function cstar=linmachmat(w,m)
  for i=1:length(m)
    C=columns(w); cstar=zeros(length(m)); max=-inf;
    for c=1:C
      g=w(:,c)'*m([i,:]);
      if (g>max) max=g; cstar([i])=c; endif; end; end
endfunction