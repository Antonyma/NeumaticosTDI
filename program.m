% Cargar la imagen del neumático
neumatico = imread('Imagenes\2.jpg');

% Convertir la imagen en escala de grises
neumatico_gris = rgb2gray(neumatico);

% Aplicar un filtro de mediana para suavizar la imagen y reducir el ruido
neumatico_filtrado = medfilt2(neumatico_gris, [3 3]);

% Aplicar un umbral para segmentar la imagen en áreas de neumático y áreas de fondo
umbral = graythresh(neumatico_filtrado);
neumatico_umbral = imbinarize(neumatico_filtrado, umbral);

% Calcular el área total del neumático
area_total = sum(neumatico_umbral(:));

% Calcular el área de las regiones con degradación
degradacion = imfill(neumatico_umbral, 'holes') - neumatico_umbral;
area_degradacion = sum(degradacion(:));

% Calcular el porcentaje de degradación
porcentaje_degradacion = area_degradacion / area_total * 100;

% Muestra comparacion escala de grises original-procesada
figure;
subplot(1,2,1);
imshow(neumatico);
title('Imagen original');
subplot(1,2,2);
imshow(neumatico_gris);
title('Imagen en escala de grises');

% Muestra comparacion filtro mediana original-procesada
figure;
subplot(1,2,1);
imshow(neumatico_gris);
title('Imagen original');
subplot(1,2,2);
imshow(neumatico_filtrado);
title('Imagen con filtro');

% Muestra comparacion filtro mediana original-procesada
figure;
subplot(1,2,1);
imshow(neumatico_filtrado);
title('Imagen original');
subplot(1,2,2);
imshow(neumatico_umbral);
title('Imagen binarizada');

% Detectar los bordes del neumático utilizando el operador Canny
bordes_neumatico = edge(neumatico_filtrado, 'Canny');

% Dilatar los bordes del neumático para cerrar posibles huecos
se = strel('disk', 3);
bordes_neumatico = imdilate(bordes_neumatico, se);

% Extraer los bordes externos del neumático
bordes_externos = bwperim(bordes_neumatico);

% Calcular el área total del neumático
area_total = sum(bordes_externos(:));

% Calcular el área de las regiones con degradación
degradacion = imfill(bordes_externos, 'holes') - bordes_externos;
area_degradacion = sum(degradacion(:));

% Calcular el porcentaje de degradación
porcentaje_degradacion = area_degradacion / area_total * 100;

% Muestra comparacion filtro mediana original-procesada
figure;
subplot(1,2,1);
imshow(bordes_neumatico);
title('Imagen original');
subplot(1,2,2);
imshow(bordes_externos);
title('Imagen bordes externos');