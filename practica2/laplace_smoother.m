function [ps1, ph1] = laplace_smoother(ps, ph, epsilon)
  ps1 = (ps + epsilon)/sum(ps + epsilon); #obtiene ps tras aplicarle el suavizado de laplace a todas las componentes
  ph1 = (ph + epsilon)/sum(ph + epsilon); #igual que el paso anterior pero sobre ph
endfunction