function [] = Ciz(birey,Populasyon)
clf
maksG = 300;%20+ Populasyon(1,3,birey)+Populasyon(1,6,birey)+20
maksY = 300;
birimG = (20/maksG)*10;
birimY =(100/maksY)*10;
Bukg = Populasyon(1,1,birey)*10/150;
Buky = Populasyon(1,2,birey)*birimY/100;
Buku = (Populasyon(1,3,birey)/maksG)*10;
Bakg = Populasyon(1,4,birey)*10/150;
Baky = Populasyon(1,5,birey)*birimY/100;
Baku = (Populasyon(1,6,birey)/maksG)*10;

GovdeMX = 5-birimG/2;
GovdeMY = 1;

BMX1 = GovdeMX+birimG + (Populasyon(1,8,birey)/maksG)*10;
BMX2 = GovdeMX-1 - (Populasyon(1,8,birey)/maksG)*10;
BMY = GovdeMY + Populasyon(1,7,birey)*birimY/100;
axis([0 10 0 10]);
rectangle('Position',[GovdeMX GovdeMY birimG birimY]);

rectangle('Position',[GovdeMX+birimG GovdeMY+Buky Buku Bukg]);
rectangle('Position',[GovdeMX-Buku GovdeMY+Buky Buku Bukg]);

rectangle('Position',[GovdeMX+birimG GovdeMY+Baky Baku Bakg]);
rectangle('Position',[GovdeMX-Baku GovdeMY+Baky Baku Bakg]);
rectangle('Position',[BMX1 BMY 1 1]);
rectangle('Position',[BMX2 BMY 1 1]);
end