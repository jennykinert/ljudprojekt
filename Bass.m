function [ tone ] = Bass( sign, duration, samplingsfrekvens, chord, amplitude )

fs=samplingsfrekvens; 
signal=sign;
signal2=exp(-50.*linspace(0,round(duration.*fs),4*fs));
signal = signal.* signal2';
%signal=amplitud.*signal; 
%Skapar en �verf�ringsfunktion
%z=tf('z'); 
wn=0.05;
%D�mpningen 
m=50;
%L�ngden p� filtret
N=2*m;
%Ett H�gpassfilter 
LOW = fir1(N,wn,'low'); 
%[Numerator,Denominator]=tfdata(LOW);
%signal = filter(Numerator{:},Denominator{:}, signal);
signal=conv(LOW, signal); 
%chord = chord.*2^(-3);
tone = GenerateTone(signal, fs, chord,0.999971);
tone = tone .* amplitude;
tone = tone * 2;
end

