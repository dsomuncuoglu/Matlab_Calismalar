%%psnr_deneme
ref = imread('pout.tif');
imshow(ref)
[en,boy]=size(ref);
A=zeros(en,boy);
for i=1:en
    for j=1:boy
        g=10*randn;
        A(i,j)=ref(i,j)+g;
    end
end
psnr(A,double(ref))
figure;
imshow(uint8(A))