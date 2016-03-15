midi = readmidi('mountain_king.midi');
[f0, duration, starttime, amplitude] = analyze(midi);
fs = 44100;
song = zeros([1, round((starttime(end) + duration(end)+25)*fs)]);

tones = []
freq = []
lens = []
maxtones = 0
found = 0;ss
for i = 1:length(f0)
    pos=round(starttime(i)*fs);
    pos = pos+1

    nok = 0;
    id = 1;
    while (nok == 0) && (id <= maxtones)
        if (lens(id) == duration(i)) && (freq(id) == f0(i))
            nok = id;
        end
        id = id + 1;
    end
    size(tones);
    if nok == 0
        chord = Bass(duration(i), fs, f0(i))';
        tones = [tones; chord];
        freq = [freq f0(i)];
        lens = [lens duration(i)];
        maxtones = maxtones + 1;
    else
        found = found + 1
        chord = tones(nok,:);
    end
    
    dur = length(chord)-1;
    song(1,pos:(pos+dur)) = song(1,pos:(pos+dur)) + chord;
end
plot(song)
sound(song, fs)