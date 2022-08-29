%%Paraları bulma
rgb = imread('coins.png');
imshow(rgb)
% Detect circular objects
imshow(rgb)
d = drawline;
figure
pos = d.Position;
diffPos = diff(pos);
diameter = hypot(diffPos(1),diffPos(2))
[centers,radii] = imfindcircles(rgb,[fix(diameter-diameter*0.50) fix(diameter+diameter*0.5)])
imshow(rgb)
h = viscircles(centers,radii);