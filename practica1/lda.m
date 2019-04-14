function [W]=lda(X, xl)
  m = mean(X')'; % Calculamos la media global

  Sb = 0;
  Sw = 0;

  for c = unique(xl)  
    ic = find (xl == c);
    xc = X(:, ic);
    
    xcm = mean(xc')'; % Calculamos la media de cada clase
    
    Sb = Sb + columns(ic)*(xcm - m)*(xcm - m)';
    
    A = xc - xcm;     % Restamos la media al vector dato
    Cov = 1/columns(A)*A*A'; %Obtenemos la matriz de covarianzas
    
    Sw = Sw + Cov; % Obtenemos Sw  
  end
  
  [eigV, eigVal] = eig(Sb,Sw); %Obtenemos autovalores y autovectores de Sb y Sw
  [_, I] = sort(diag(eigVal), "descend"); %Obtenemos el vector de indices de sort
  W = eigV(:,I); %obtenemos los autovectores ordendos segun su autovalor desec.
  
endfunction