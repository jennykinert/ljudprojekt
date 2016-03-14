function [ tone ] = AucusticGuitarr( duration, fs, chord )
%AucusticGuitarr Creates a bass tone

signal=randn(fs ,1);
signal2=sin(exp(-100.*linspace(0,1,fs)));
signTot = signal.*signal2';
filter = zeros([1, length(signTot)]);
N = 20;
filter(1:N) = 1;
filter = filter./N;
signTot = conv(filter, signTot);
tone = GenerateTone(signTot, fs, chord);

end

