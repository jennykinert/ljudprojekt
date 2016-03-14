function [ signal ] = Bass( samplingsfrekvens )

fs=samplingsfrekvens; 
signal=randn(fs ,1);
signal2=exp(-50.*linspace(0,1,fs));
signal = signal.* signal2';

%Skapar en överföringsfunktion
%z=tf('z'); 
wn=0.1;
%Dämpningen 
m=40;
%Längden på filtret
N=2*m;
%Ett Högpassfilter 
LOW = fir1(N,wn,'low'); 
%[Numerator,Denominator]=tfdata(LOW);
%signal = filter(Numerator{:},Denominator{:}, signal);
signal=conv(LOW, signal); 

end

