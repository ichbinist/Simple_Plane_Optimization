%Baþlangýç populasyonu oluþtur
%Test et
%Sonuçlara göre bir fitness deðeri elde et
%Maksimum Ýterasyon sayýsýna ulaþýldý mý ?
%Evet ise sonucu "Optimal sonuç [sonuç]" þeklinde yazdýr.
%bitir
%Hayýr ise populasyondaki fitness'in altýnda kalanlarý ele
%Kalanlarýn arasýndaki özellikleri birbirine takaslayarak yeni populasyon
%oluþtur.
%Rastgele mutasyonlar ile yeni populasyon yarat
%baþa dön
format long
%_________________________%
%Sabit Deðerler%
MotorM = 50;
GovdeY = 100;
GovdeG = 20;
V = 7000;
%Sabit Deðerler%
%_________________________%

FKALDIRMA =0;
TAGIRLIK =0;

%__________________________________________________________%
%Multidimensional Array => A(:,:,n) = [...; ...; ...]
%Max-Min => max(A(m,n,f))
%f = Tür
%m = 1(Satýr Sayýsý)
%n = 11(Tüm Randi'ler ve her türün kendine ait ortalama açý deðeri)
Jenerasyon = 1;
Populasyon(1,10,10) = zeros;
%3 randi üst kanat, 3 randi alt kanat, 2 randi motor, 2 randi açý, son ORT

n = 1;
while(n ~= 11)
    %UKG UKY UKU AKG AKY AKU MotorY MotorX AC1 FitnessPUANI
Populasyon(:,:,n) =[randi(30),randi([50,100 - int32(Populasyon(1,1,n)/2)]),randi(150),randi(30),randi([0, 50 - int32(Populasyon(1,4,n)/2)]),randi(150),randi([Populasyon(1,2,n)-int32(Populasyon(1,1,n)/2),Populasyon(1,2,n)+int32(Populasyon(1,1,n)/2)]),randi([0,Populasyon(1,3,n)]),0,0];
n = n +1;
end

while(Jenerasyon ~= 5000)
%UKA AKA MotorG FKALDIRMA
f = 1;
while (f ~= 11)
    kanatalani = (Populasyon(1,1,f) * Populasyon(1,3,f)) + (Populasyon(1,4,f) * Populasyon(1,6,f));
    kanatdegerorani = kanatalani * 0.8;
    UKA2 = (Populasyon(1,1,f) * 0.08 * Populasyon(1,3,f) *int32(sqrt(Populasyon(1,3,f)/2*Populasyon(1,3,f)/2 + (Populasyon(1,2,f)-50) * (Populasyon(1,2,f) - 50))));
    AKA2 = (Populasyon(1,4,f) * 0.08 * Populasyon(1,6,f) *int32(sqrt(Populasyon(1,6,f)/2*Populasyon(1,6,f)/2 + (Populasyon(1,5,f)-50) * (Populasyon(1,5,f) - 50))));
    MotorG2 = MotorM * sqrt((Populasyon(1,7,f)-50) * (Populasyon(1,7,f)-50) + (Populasyon(1,8,f))*(Populasyon(1,8,f)));
    TAGIRLIK = 1000 + UKA2 + AKA2 + int32(MotorG2);
    %AÇI HESAPLARI
    
    acijenerasyon = 1;
    aciPop = [randi(60) , randi(60) , randi(60) , randi(60) , randi(60) , randi(60), randi(60) , randi(60) , randi(60) , randi(60)];
    while acijenerasyon ~= 100
    fitnessT = 0;
    fitnessDizisi = [1,11];
    a = 1;
    while a ~= 11
    FKALDIRMA = 0.08 * (V * sin(deg2rad(aciPop(1,a)))) *Populasyon(1,4,f)*Populasyon(1,6,f)* int32(sqrt(Populasyon(1,6,f)/2*Populasyon(1,6,f)/2 + (50 - Populasyon(1,5,f))*(50 -Populasyon(1,5,f))))/AKA2 +  0.08*(V * sin(deg2rad(aciPop(1,a)))) *Populasyon(1,1,f)*Populasyon(1,3,f)* int32(sqrt(Populasyon(1,3,f)/2*Populasyon(1,3,f)/2 + (Populasyon(1,2,f) - 50)*(Populasyon(1,2,f)-50)))/AKA2;
    fitnessT = fitnessT + (abs(FKALDIRMA - TAGIRLIK)) + kanatdegerorani;
    fitnessDizisi(1,a) = (abs(FKALDIRMA - TAGIRLIK)) + kanatdegerorani;
    a = a+1;
    end
    fitnessO = fitnessT / 10;
    a = 1;
    
fitnessTest = double(fitnessDizisi) - double(fitnessO);
popn = aciPop;
   while a < 11
    if fitnessTest(1,a) < 0 
        popn(1,a) = randi(60);
    elseif fitnessTest(1,a) ~= max(fitnessTest) && fitnessTest(1,a) > 0
        popn(1,a) = aciPop(1,a) + randi(6) -3;
    elseif fitnessTest(1,a) == max(fitnessTest)
        popn(1,a) = aciPop(1,a);
    end
    a = a+1;
   end
     aciPop = popn;
   popn = 0;
   acijenerasyon = acijenerasyon +1;
    end
     % AÇI HESAPLARI
     Populasyon(1,10,f) = (abs(FKALDIRMA - TAGIRLIK));
    f = f+1;
    aciort = mean2(aciPop);
end
%Tür eleme
TurFitnessT = 0;
xPopulasyon = Populasyon;
x = 1;
while x ~= 11
    TurFitnessT =TurFitnessT + Populasyon(1,10,x);
    x = x+1;
end
TurFitnessO = TurFitnessT / 10;

xfitnessTest = double(Populasyon(1,10,:)) - double(TurFitnessO);
x = 1;
while x ~= 11
     if xfitnessTest(1,1,x) < 0 
         xPopulasyon(:,:,x) =[randi(30),randi([50,100 - int32(xPopulasyon(1,1,x)/2)]),randi(150),randi(30),randi([0, 50 - int32(xPopulasyon(1,4,x)/2)]),randi(150),randi([xPopulasyon(1,2,x)-int32(xPopulasyon(1,1,x)/2),xPopulasyon(1,2,x)+int32(xPopulasyon(1,1,x)/2)]),randi([0,xPopulasyon(1,3,x)]),0,0];
     elseif xfitnessTest(1,1,x) ~= max(xfitnessTest(1,1,:)) && xfitnessTest(1,1,x) > 0
         xPopulasyon(1,10,x) = Populasyon(1,10,x) + randi(20) -10;
     elseif xfitnessTest(1,1,x) == max(xfitnessTest(1,1,:))
         xPopulasyon(1,10,x) = Populasyon(1,10,x);
     end
     x = x+1;
end

if aciort > 30
    n = 1;
while(n ~= 11)
    %UKG UKY UKU AKG AKY AKU MotorY MotorX AC1 FitnessPUANI
Populasyon(:,:,n) =[randi(30),randi([50,100 - int32(Populasyon(1,1,n)/2)]),randi(150),randi(30),randi([0, 50 - int32(Populasyon(1,4,n)/2)]),randi(150),randi([Populasyon(1,2,n)-int32(Populasyon(1,1,n)/2),Populasyon(1,2,n)+int32(Populasyon(1,1,n)/2)]),randi([0,Populasyon(1,3,n)]),0,0];
n = n +1;
end
xPopulasyon = 0;
else
    Populasyon = xPopulasyon;
    xPopulasyon = 0;
end
%Tür eleme
Jenerasyon = Jenerasyon +1;

if aciort < 30 && abs(FKALDIRMA - TAGIRLIK) < 500
    break
end
end

