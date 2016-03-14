function [ signal ] = Bassdrum( samplingsfrekvens )
%fs fungerar bra med värdet 22500
fs=samplingsfrekvens; 
signal=randn(fs ,1);
signal2=exp(-100.*linspace(0,1,fs));
signal = signal.* signal2';

%Skapar en överföringsfunktion
z=tf('z'); 
%Överföringsfunktion för Lågpassfiltret
HLow= 0.5*(1+z^-1);
[Numerator,Denominator]=tfdata(HLow);
signal = filter(Numerator{:},Denominator{:}, signal);

end

