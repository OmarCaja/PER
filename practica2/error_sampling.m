#este script realiza un barrido para diferentes sets de entrenamiento y pruebas para obtener
# una muestra del error estadisticamente significativa y dar un dato de error con un intervalo de confianza del 95%

if (nargin != 1)
    printf("Usage: train_model.m <data_filename>");
end

arglist = argv();
datafile = arglist{1};
disp("Loading data...");
load(datafile);
disp("Data load complete");
errorlist = [0.1,0.01,0.001,0.0001,0.00001,.000001,.0000001,.00000001,.000000001,.0000000001,.00000000001,.000000000001,.0000000000001,.00000000000001,.000000000000001,.0000000000000001,.00000000000000001,.000000000000000001,.0000000000000000001,.00000000000000000001];

for i = 1:1:20 #bucle para cada valor del hiperparametro epsilon
  x = [];
  for j = 1:1:30 #se calcula una muestra de tamaño 30
    [te, tr] = shuffle(data, 0.9, j + i); #se obtiene una particion de los datos
    [ps0, ps, ph0, ph] = train_model(tr); # se obtienen los parametros del entrenamiento del modelo
    [ps1, ph1] = laplace_smoother(ps, ph, errorlist(1,i)); # se aplica suavizado de laplace
    x(1,j) = full(clasifier_matrix(ps0,ps1,ph0,ph1,te)); # se computa el error obtenido por el clasificador
  endfor
  mean(x) #para cada muestra del error obtenemos la media
  std(x) #para cada muestra del error obtenemos la desviacion estandar
endfor


