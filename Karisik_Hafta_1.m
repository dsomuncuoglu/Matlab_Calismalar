% Yapay 1
x=zeros(80,50);
x(:,30:40)=1;
x(1:10,20:30)=1
x(11:20,10:20)=1
x(21:30,1:10)=1
x=im2bw(x);
imshow(x);

% RGB matris (Gök yüzü mavisi)
x=zeros(400,400,3);
red=0;
x(:,:,2)=200;
for i=1:40:361
    x(i:i+40,:,3)=red;
    red=red+25;
end
imshow(uint8(x))


% Çember oluşturulması x^2+y^2=r^2
x=uint8(255*ones(400,400,3));
imshow(x)

for i=1:400;
for j=1:400
if(i-200).^2+(j-200)^2<200.^2
x(i,j,1)=0;
x(i,j,2)=225;
end
end
end
imshow(x)

%Rastgele resim oluşturma

I=255*ones(400,400,3);
n=input('Rastgele daire sayısı');
for i=1:n
kx=fix(rand*400);
ky=fix(rand*400);
R=fix(rand*60);
r=fix(rand*256); g=fix(rand*256); b=fix(rand*256);
for i=1:400
for j=1:400
if(i-kx)^2+(j-ky)^2<R^2
I(i,j,1)=r;
I(i,j,2)=g;
I(i,j,3)=b;
end
end
end
end
imshow(uint8(I))
%
[a,b,c]=size(A);
imshow(A);figure
R=A(:,:,1);%Kırmızı
G=A(:,:,2);%yesil
B=A(:,:,3);%mavi bilesenleri
R=255-R;%Tümleyenleri
G=255-G;
B=255-B;
A(:,:,1)=R;%tümleyen değerlerden renkli resmin yeniden eldesi
A(:,:,2)=G;
A(:,:,3)=B;
imshow(A);figure
subplot(1,3,1)
imshow(R);title('R')
subplot(1,3,2)
imshow(G);title('G')
subplot(1,3,3)
imshow(B);title('B')
imshow(B);figure
A1R=uint8(ones(a,b,c));
A1R(:,:,1)=R;
A1R(:,:,2)=0;
A1R(:,:,3)=0;
subplot(1,3,1)
imshow(A1R)
A1G=uint8(ones(a,b,c));
A1G(:,:,2)=G;
A1G(:,:,1)=0;
A1G(:,:,3)=0;
subplot(1,3,2)
imshow(A1G)

%Resim büyütme-küçültme
A=imread('cameraman.tif');
A=imresize(A,10);%10 kat büyütme
imshow(A);
B=imresize(A,0.1);%10 kat küçültme
figure;
imshow(B);