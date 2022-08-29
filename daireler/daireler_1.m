% Detect circular objects in an image
[dosyaAdi, dosyaYolu] = uigetfile({'*.jpg';'*.png';'*.tiff';'*.bmp'; '*.gif'},'Bir yaprak resmi seçiniz');
I = imread(fullfile(dosyaYolu, dosyaAdi));
rgb=I;
imshow(rgb)
d = drawline;
figure
pos = d.Position;
diffPos = diff(pos);
diameter = hypot(diffPos(1),diffPos(2))
%gray_image = rgb2gray(rgb);
imshow(rgb)


[centers,radii] = imfindcircles(I,[fix(diameter-diameter*0.50) fix(diameter+diameter*0.5)])

h = viscircles(centers,radii);
%% Kırmızı segmentasyonu
r=rgb(:,:,1);
nColors = 15;
pixel_labels = imsegkmeans(r,nColors);
mask1 = pixel_labels==1;
cluster1 = rgb .* uint8(mask1);
imshow(cluster1)
figure
mask2 = pixel_labels==2;
cluster2 = rgb.* uint8(mask2);
imshow(cluster2)
mask3 = pixel_labels==3;
cluster3 = rgb.* uint8(mask3);
imshow(cluster3)
h = viscircles(centers,radii);