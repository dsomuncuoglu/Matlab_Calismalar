I=255*ones(800,800,3);
n=input('Rastgele daire sayýsý');
for i=1:n
kx=fix(rand*700);
ky=fix(rand*700);
R1=fix(rand*100);
R2=fix(rand*100);
if R1>R2 
    eb=R1;ek=R2;
else
    eb=R2;ek=R1;
end
r=fix(rand*256); g=fix(rand*256); b=fix(rand*256);
for i=1:800
for j=1:800
if((i-kx)^2+(j-ky)^2<eb && (i-kx)^2+(j-ky)^2>ek) 
I(i,j,1)=r;
I(i,j,2)=g;
I(i,j,3)=b;
end
end
end
end
imshow(uint8(I))