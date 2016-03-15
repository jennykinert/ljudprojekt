function [ fTot ] = GenerateTone( signal, fs, f,R )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Skapar en �verf�ringsfunktion
z=tf('z'); 
%vad ska L vara f�r att 1 =fs/f0 -L-0.5 ska st�mma
L=round((fs/f)-1); 
%�verf�ringsfunktion Kam filtret
HKam=(R^L)*z^-L; 
%�verf�ringsfunktion f�r L�gpassfiltret
HLow= 0.5*(1+z^-1); 
%Tar fram �verf�ringsfunktion f�r allpassfiltret 
w=(2*pi*f)/fs; 
delta=(fs/f)-L-0.5; 
a=sin((1-delta)*w/2)/sin((1+delta)*w/2); 
HAll=(z^-1+a)/(1+a*z^-1);
%Tar fram den gemensamma �verf�ringsfunktionen
HTot=(HLow*HAll)/(1-HLow*HAll*HKam); 
%filtrerar signal med kamfilter 
[Numerator,Denominator]=tfdata(HTot); 
fTot = filter(Numerator{:},Denominator{:}, signal);

%figure 
%t=[0:length(fTot)-1]/fs; 
%plot(t,fTot)
%figure

%transform = fftshift(abs(fft(fTot))); 
%N=length(transform); 
%df=fs/N; 
%frekvens=[-N/2:N/2-1]*df; 
% plot(frekvens, transform)
% axis([-1000 1000 0 1500]);
 

end

