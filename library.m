function [  ] = library(  )
iSampleRate=44100; 
fFreqs = [440 466.16 493.88 523.25 554.37 587.33 622.25 659.26 698.46 739.99 783.99 830.66 880]; 
iNotes = length(fFreqs);
iInstruments = 2;
iToneLength = iSampleRate;
iMusicLength = 3*60;
vBaseSignal=randn(iSampleRate*4,1); 

pTones = [];
for id=1:length(fFreqs)
    %for iType = 0:(iInstruments - 1)
        %vBaseSignal = GenerateSignal(iType, iSampleRate, 0.0068);
        f = fFreqs(id).*2^(-3);
        tTone = Bass(vBaseSignal,0.3, iSampleRate, f,.5);
        pTones = [pTones  tTone(1:iSampleRate)'];
        %subplot(1,2,1),plot(vBaseSignal);
        %subplot(1,2,2),plot(tTone);
        %sound(tTone, iSampleRate);
        %pause(1);
    %end
end

%pTones = [];
for id=1:length(fFreqs)
    %for iType = 0:(iInstruments - 1)
        %vBaseSignal = GenerateSignal(iType, iSampleRate, 0.0068);
        f = fFreqs(id).*2^(-1);
        tTone = AucusticGuitarr(vBaseSignal,0.2, iSampleRate, f,.5);
        pTones = [pTones  tTone(1:iSampleRate)'];
        %subplot(1,2,1),plot(vBaseSignal);
        %subplot(1,2,2),plot(tTone);
        %sound(tTone,iSampleRate);
        %pause(1);
    %end
end

sound(pTones,44100);
audiowrite('Tonbibliotek.wav', pTones,iSampleRate);
end

