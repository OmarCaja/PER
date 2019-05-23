function err = clasifier_matrix(ps0, ps, ph0, ph, te)
  gh = log(ph)*te(:,1:(end -1))' + log(ph0); #calculamos las componentes del vector gh correspondientes al vector ph obtenido del entrenamiento
  gs = log(ps)*te(:,1:(end -1))' + log(ps0); #al igual que en el paso anterior pero desde el vector ps
  
  aux = [gh;gs]; #se crea una matriz auxiliar en la que cada columna es la componente i-esima de gh y gs
  [_, maxIndex] = max(aux); #buscamos el maximo de cada columna 
  maxIndex--; #como maxIndex contiene los numeros de fila 1 y 2 le restamos uno para que se correspondan con 0 ham y 1 spam obteniendo asi la clasificacion
  errors = sum(te(:,end) != maxIndex'); #comparamos la clasificacion calculada con la esperada y contamos las que difieren como error

  err = errors / rows(te); #normalizamos el numero de errores
endfunction
