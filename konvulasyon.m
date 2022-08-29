%% Matlab konvulasyon
I=imread('peppers.png');
tic
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
K=[-1 -2 -1;0 0 0;1 2 1];
R=conv2(R,K,'same');
G=conv2(G,K,'same');
B=conv2(B,K,'same');
J(:,:,1)=R;
J(:,:,2)=G;
J(:,:,3)=B;
sure1=toc
imshow(uint8(J))
figure
%% Kodla konvulasyon
tic
I=double(I);
[k,p,renk]=size(I);
[w,h]=size(K);
m=(w-1)/2;
n=(h-1)/2;
resim=double(zeros(k,p,renk));
for x=2:k-2
 for y=2:p-2
 for j=-n:n
 for i=-m:m
      resim(x,y,1)=resim(x,y,1)+K(i+m+1,j+n+1)*I(x-i,y-j,1);
      resim(x,y,2)=resim(x,y,2)+K(i+m+1,j+n+1)*I(x-i,y-j,2);
      resim(x,y,3)=resim(x,y,2)+K(i+m+1,j+n+1)*I(x-i,y-j,3);
 end
 end
 end
end
sure_2=toc
imshow(uint8(resim))

figure

%% Matlab konvulasyon
I=imread('peppers.png');
tic
K=[-1 -2 -1;0 0 0;1 2 1];
Kt=K(end:-1:1,end:-1:1);
[k,p,renk]=size(I);
[w,h]=size(K);
m=(w-1)/2;
n=(h-1)/2;
I=double(I);
resim=zeros(k,p,renk);
for x=m+1:k-m-1
 for y=n+1:p-n-1
     P_I=I(x-m:x+n,y-m:y+n,:);
     R=P_I(:,:,1);
     G=P_I(:,:,2);
     B=P_I(:,:,3);
     R_I=R.*Kt;
     G_I=G.*Kt;
     B_I=B.*Kt;
     R_I=sum(R_I(:));
     G_I=sum(G_I(:));
     B_I=sum(B_I(:));
      resim(x,y,1)=R_I;
      resim(x,y,2)=G_I;
      resim(x,y,3)=B_I;
  end
end
sure_3=toc
imshow(uint8(resim))

