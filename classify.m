clc;
clear all;
close;
prompt={'Enter your type(all small letters):','Enter your picture number(1-150)'};
title='Classification of Images';
answer=inputdlg(prompt,title);
answert=strcat('D:\Classification proj\1000\',answer{1},'\',answer{2},'.jpg');
coastal=imread('D:\Classification proj\1000\39.jpg');%reference image
[mc nc k]=size(coastal);%converting reference image into array in form of [256 256 3]
coastal1=imread('D:\Classification proj\1000\148.jpg');%reference image
[mc1 nc1 k]=size(coastal1);
coastal2=imread('D:\Classification proj\1000\232.jpg');%reference image
[mc2 nc2 k]=size(coastal2);
metro=imread('D:\Classification proj\1000\37.jpg');%reference image
[mm nm k]=size(metro);
metro1=imread('D:\Classification proj\1000\45.jpg');%reference image
[mm1 nm1 k]=size(metro1);
forest=imread('D:\Classification proj\1000\96.jpg');%reference image
[mf nf k]=size(forest);
forest1=imread('D:\Classification proj\1000\250.jpg');%reference image
[mf1 nf1 k]=size(forest1);
desert=imread('D:\Classification proj\1000\186.jpg');%reference image
[md nd k]=size(desert);
desert1=imread('D:\Classification proj\1000\205.jpg');%reference image
[md1 nd1 k]=size(desert1);

hc=zeros(3,256);%initializing histogram for R G B for h-coastal
hm=zeros(3,256);
hf=zeros(3,256);
hd=zeros(3,256);
hc1=zeros(3,256);
hm1=zeros(3,256);
hf1=zeros(3,256);
hd1=zeros(3,256);
hc2=zeros(3,256);
for k=1:3
for i=1:mc
for j=1:nc
hc(k,1+coastal(i,j,k))=hc(k,1+coastal(i,j,k))+1;
end
end
end
for k=1:3
for i=1:mc1
for j=1:nc1
hc1(k,1+coastal1(i,j,k))=hc1(k,1+coastal1(i,j,k))+1;
end
end
end
for k=1:3
for i=1:mc2
for j=1:nc2
hc2(k,1+coastal2(i,j,k))=hc2(k,1+coastal2(i,j,k))+1;
end
end
end
for k=1:3
for i=1:mm
for j=1:nm
hm(k,1+metro(i,j,k))=hm(k,1+metro(i,j,k))+1;
end
end
end
for k=1:3
for i=1:mm1
for j=1:nm1
hm1(k,1+metro1(i,j,k))=hm1(k,1+metro1(i,j,k))+1;
end
end
end
for k=1:3
for i=1:mf
for j=1:nf
hf(k,1+forest(i,j,k))=hf(k,1+forest(i,j,k))+1;
end
end
end
for k=1:3
for i=1:mf1
for j=1:nf1
hf1(k,1+forest1(i,j,k))=hf1(k,1+forest1(i,j,k))+1;
end
end
end
for k=1:3
for i=1:md
for j=1:nd
hd(k,1+desert(i,j,k))=hd(k,1+desert(i,j,k))+1;
end
end
end
for k=1:3
for i=1:md1
for j=1:nd1
hd1(k,1+desert1(i,j,k))=hd1(k,1+desert1(i,j,k))+1;
end
end
end
hc=hc/mc/nc;
hm=hm/mm/nm;
hf=hf/mf/nf;
hd=hd/md/nd;

hc1=hc1/mc1/nc1;
hm1=hm1/mm1/nm1;
hf1=hf1/mf1/nf1;
hd1=hd1/md1/nd1;
hc2=hc2/mc2/nc2;
answer='D:\Classification proj\1000\desert\';

   
test=imread(answert);%test image
[mt nt k]=size(test);
ht=zeros(3,256);
for k=1:3
for i=1:mt
for j=1:nt
ht(k,1+test(i,j,k))=ht(k,1+test(i,j,k))+1;
end
end
end
ht=ht/mt/nt;
diff(1)=sum(sum(abs(ht-hc)));
diff(2)=sum(sum(abs(ht-hm)));
diff(3)=sum(sum(abs(ht-hf)));
diff(4)=sum(sum(abs(ht-hd)));

diff(5)=sum(sum(abs(ht-hc1)));
diff(6)=sum(sum(abs(ht-hm1)));
diff(7)=sum(sum(abs(ht-hf1)));
diff(8)=sum(sum(abs(ht-hd1)));
diff(9)=sum(sum(abs(ht-hc2)));

[dmin n]=min(diff);

if(n==1||n==5||n==9)
disp('Coastal ');
[X1,map1]=imread('D:\Classification proj\1000\39.jpg');
[X2,map2]=imread('D:\Classification proj\1000\148.jpg');
[X4,map3]=imread('D:\Classification proj\1000\232.jpg');
[X3,map4]=imread(answert);
subplot(1,4,1), imshow(X1,map2)
text(100,-100,'reference image');
subplot(1,4,2), imshow(X2,map2)
text(100,-100,'reference image');
subplot(1,4,3), imshow(X3,map2)
text(100,-100,'reference image');
subplot(2,4,4), imshow(X4,map2)
text(200,-100,'test image');
elseif(n==2||n==6)
disp('Metro ');
[X1,map1]=imread('D:\Classification proj\1000\37.jpg');
[X2,map2]=imread('D:\Classification proj\1000\45.jpg');
[X3,map3]=imread(answert);
subplot(1,3,1), imshow(X1,map2)
text(100,-100,'reference image');
subplot(1,3,2), imshow(X2,map2)
text(100,-100,'reference image');
subplot(2,3,3), imshow(X3,map2)
text(200,-100,'test image');
elseif(n==3||n==7)
disp('Forest ');
[X1,map1]=imread('D:\Classification proj\1000\96.jpg');
[X2,map2]=imread('D:\Classification proj\1000\250.jpg');
[X3,map3]=imread(answert);
subplot(1,3,1), imshow(X1,map2)
text(100,-100,'reference image');
subplot(1,3,2), imshow(X2,map2)
text(100,-100,'reference image');
subplot(2,3,3), imshow(X3,map2)
text(200,-100,'test image');
elseif(n==4||n==8)
disp('Desert ');
[X1,map1]=imread('D:\Classification proj\1000\186.jpg');
[X2,map2]=imread('D:\Classification proj\1000\205.jpg');
[X3,map3]=imread(answert);
subplot(1,3,1), imshow(X1,map2)
text(200,-100,'reference image');
subplot(1,3,2), imshow(X2,map2)
text(100,-100,'reference image');
subplot(2,3,3), imshow(X3,map2)
text(200,-100,'test image');

end
