%%MSE
imshow(gece);figure
I=imresize(gece,30);
J=imresize(I,0.03333);
imshow(J)
%MSE
gece=double(gece);
J=double(J);
E=sqrt(sum((gece(:)-J(:)).^2))/(size(gece,1)*size(gece,2))
psnr(gece,J)

