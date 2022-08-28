% Sobel operatoru ile Kenar belirleme
I=imread('cameraman.tif');
subplot(2,2,1)
imshow(I);
title('cameraman')
K=[1 2 1;0 0 0;-1 -2 -1];
I1=conv2(K,I);
I1=uint8(I1);
subplot(2,2,2)
imshow(I1)
title('Sobel satır maskesi sonucu')
K=K';
I2=conv2(K,I);
I2=uint8(I2);
subplot(2,2,3)
imshow(I2)
title('Sobel sütun maskesi sonucu')
In=I1.^2+I2.^2;
subplot(2,2,4)
imshow(In)
title('Sobel sonucu');