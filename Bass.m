function [ tone ] = Bass( sign, duration, samplingsfrekvens, chord, amplitude )

fs=samplingsfrekvens; 
signal=sign;
signal2=exp(-50.*linspace(0,round(duration.*fs),4*fs));
signal = signal.* signal2';
%signal=amplitud.*signal; 
%Skapar en överföringsfunktion
%z=tf('z'); 
wn=0.05;
%Dämpningen 
m=50;
%Längden på filtret
N=2*m;
%Ett Högpassfilter 
LOW = fir1(N,wn,'low'); 
%[Numerator,Denominator]=tfdata(LOW);
%signal = filter(Numerator{:},Denominator{:}, signal);
signal=conv(LOW, signal); 
%chord = chord.*2^(-3);
tone = GenerateTone(signal, fs, chord,0.999971);
tone = tone .* amplitude;
tone = tone * 2;
end

