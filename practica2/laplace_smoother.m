function [ps1, ph1] = laplace_smoother(ps, ph, epsilon)
  ps1 = (ps + epsilon)/sum(ps + epsilon);
  ph1 = (ph + epsilon)/sum(ph + epsilon);
endfunction