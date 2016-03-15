midi = readmidi('mountain_king.midi');
[f0, duration, starttime, amplitude] = analyze(midi);
fs = 44100;
song = zeros([1, round((starttime(end) + duration(end)+15)*fs)]);
song2 = zeros([1, round((starttime(end) + duration(end)+15)*fs)]);

tones = [];
tones2 = [];
freq = [];
lens = [];
maxtones = 0;
sign1 = randn(4*fs ,1);
sign2 = randn(4*fs ,1);
found = 0;     
for i = 1:length(f0)
    pos=round(starttime(i)*fs)+1;
    [(pos / fs) found maxtones]
    nok = 0;
    id = 1;
    %if (duration(i) > 0.3)
        
    while (nok == 0) && (id <= maxtones)
        if (lens(id) == duration(i)) && (freq(id) == f0(i))
            nok = id;
        end
        id = id + 1;
    end
    if nok == 0
        %f = f0(i).*2^.5;
        chord = Bass(sign1, duration(i), fs, f0(i),amplitude(i))';
        chord2 = AucusticGuitarr(sign2, duration(i), fs, f0(i),amplitude(i))';
        tones = [tones; chord];
        tones2 = [tones2; chord2];
        freq = [freq f0(i)];
        lens = [lens duration(i)];
        maxtones = maxtones + 1;
    else
        found = found + 1;
        chord = tones(nok,:);
        chord2 = tones2(nok,:);
    end
    
    dur = length(chord)-1;
    dur2 = length(chord2)-1;
    song(1,pos:(pos+dur)) = song(1,pos:(pos+dur)) + chord;
    song2(1,pos:(pos+dur2)) = song(1,pos:(pos+dur2)) + chord2;
    %end
end
song_stereo = [(song+song2.*.3); (song2+song.*.4)];
%plot(song_stereo)
sound(song_stereo, fs)
%audiowrite('Gema_A_Musical_Masterpiece.wav',song_stereo', fs);
