function [  ] = library(  )
iSampleRate=44100; 
fFreqs = [440 466.16 493.88 523.25 554.37 587.33 622.25 659.26 698.46 739.99 783.99 830.66 880]; 
iNotes = length(fFreqs);
iInstruments = 2;
iToneLength = iSampleRate;
iMusicLength = 3*60;


pTones = [];
for id=iNotes:-4:1
    for iType = 0:(iInstruments - 1)
        vBaseSignal = GenerateSignal(iType, iSampleRate, 0.0068);
        tTone = GenerateTone(vBaseSignal, iSampleRate, fFreqs(id));
        pTones = [pTones; tTone'];
        subplot(1,2,1),plot(vBaseSignal);
        subplot(1,2,2),plot(tTone);
        sound(tTone);
        pause(3);
    end
end

fMusic = zeros(iMusicLength * iSampleRate,1);


for iType = 0:2
    for id=1:3
        tTone = pTones(id + iType * iNotes,:);
        
        %sound(tTone);
        %plot(tTone);
        %pause(3);
    end
end

end

