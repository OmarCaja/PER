function [te, tr] = shuffle(data, partition, seed)
  [nrows, ncols] = size(data); #se obtiene la dimension de los datos
  rand("seed", seed); #inicializa la semilla
  perm = randperm(nrows); #obtiene una permutacion aleatoria de los distintos correos 
  pdata = data(perm, :); #aplica la permutacion sobre los datos de forma que cambia la posicion de los correos en la matriz
  
  ntr = floor(nrows*partition); #obtiene el tamaño de la particion de entrenamiento
  nte = nrows - ntr; #igual que el anterior pero de test
  te = pdata((ntr + 1):nrows,:); #extrae el set de test desde data
  tr = pdata(1:ntr, :); #extrae el set de training
endfunction
