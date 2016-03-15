function [ tone ] = AucusticGuitarr(sign, duration, fs, chord, amplitude )
%AucusticGuitarr Creates a bass tone

signal=sign;
signal2=sin(exp(-100.*linspace(0,round(duration.*fs),4*fs)));
signTot = signal.*signal2';
signTot=amplitude.*signTot; 
filter = zeros([1, length(signTot)]);
N = 50;
filter(1:N) = 1;
filter = filter./N;
signTot = conv(filter, signTot);
tone = GenerateTone(signTot, fs, chord,0.99992);
tone = tone .* amplitude;
tone = tone * 2;
end

