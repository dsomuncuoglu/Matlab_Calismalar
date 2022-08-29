%% Renk bilgisi ile yuvarlak kırmızı nesne tesbiti
clear
clc
[dosyaAdi, dosyaYolu] = uigetfile({'*.jpg';'*.png';'*.tiff';'*.bmp'; '*.gif'},'Bir yaprak resmi seçiniz');
I = imread(fullfile(dosyaYolu, dosyaAdi));
[en,boy,r]=size(I);
hsvI = rgb2hsv(I);
 hueI = round(hsvI(:,:,1)*360);
 satI = hsvI(:,:,2);
 valI = hsvI(:,:,3);
red = ((hueI<=30)|(hueI>330));
Id1=double(I(:,:,1)).*red;
Id2=double(I(:,:,2)).*red;
Id3=double(I(:,:,3)).*red;
Id(:,:,1)=Id1;
Id(:,:,2)=Id2;
Id(:,:,3)=Id3;
Id=uint8(Id);
imshow(Id)
nColors =3;
[ind,C] = imsegkmeans(Id,nColors,'NumAttempts',3)
I=zeros(en,boy,3);
for i=1:nColors
    R=double((ind==i))*double(C(i,1));
    G=double((ind==i))*double(C(i,2));
    B=double((ind==i))*double(C(i,3));
 I(:,:,1)=I(:,:,1)+R;
 I(:,:,2)=I(:,:,2)+G;
 I(:,:,3)=I(:,:,3)+B;
end
R=medfilt2(I(:,:,1));
G=medfilt2(I(:,:,2));
B=medfilt2(I(:,:,3));
 I(:,:,1)=R;
 I(:,:,2)=G;
 I(:,:,3)=B;
I=uint8(I);
d = drawline;
 
pos = d.Position;
diffPos = diff(pos);
diameter = hypot(diffPos(1),diffPos(2))
%gray_image = rgb2gray(rgb);
%imshow(rgb)
imshow(I)

[centers,radii] = imfindcircles(I,[fix(diameter-diameter*0.50) fix(diameter+diameter*0.5)])

h = viscircles(centers,radii);


