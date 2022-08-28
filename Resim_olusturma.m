%Matlab ikili resim
A=rand(100);
A=A>0.5;
imshow(A);

%Parlak Resim
A=256*rand(100)
A=uint8(A);
imshow(A);

%Renkli resim
A=256*rand(5,5,3)
A=uint8(A);
imshow(A)

%Renkli resim kaydetme
A=256*rand(100,100,3)
A=uint8(A);
imwrite(A,'renkli.bmp')