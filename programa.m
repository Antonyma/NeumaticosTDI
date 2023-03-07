I = imread("2.jpg");
BE = rgb2gray(I);
BW = imbinarize(BE,"adaptive");

figure;
subplot(1,2,1);
imshow(I);
title('Imagen original');
subplot(1,2,2);
imshow(BE);
title('Imagen en escala de grises');

figure;
subplot(1,2,1);
imshow(I);
title('Imagen original');
subplot(1,2,2);
imshow(BW);
title('Imagen binarizada');

