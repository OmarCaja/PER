function [m,W]=pca(X)
  m = mean(X')'; % Calculamos la media
  A = X - m;     % Restamos la media al vector dato
  Cov = 1/columns(X)*A*A'; %Obtenemos la matriz de covarianzas
  [eigV, eigVal] = eig(Cov); %Obtenemos autovalores y autovectores de Cov
  [_, I] = sort(diag(eigVal), "descend"); %Obtenemos el vector de indices de sort
  W = eigV(:,I); %obtenemos los autovectores ordendos segun su autovalor desec.
endfunction