function [ signal ] = Bassdrum( samplingsfrekvens )
%fs fungerar bra med v�rdet 22500
fs=samplingsfrekvens; 
signal=randn(fs ,1);
signal2=exp(-100.*linspace(0,1,fs));
signal = signal.* signal2';

%Skapar en �verf�ringsfunktion
z=tf('z'); 
%�verf�ringsfunktion f�r L�gpassfiltret
HLow= 0.5*(1+z^-1);
[Numerator,Denominator]=tfdata(HLow);
signal = filter(Numerator{:},Denominator{:}, signal);

end

