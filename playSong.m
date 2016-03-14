midi = readmidi('mountain_king.midi');
[f0, duration, starttime, amplitude] = analyze(midi);
fs = 44100;
song = zeros([1, round((starttime(end) + duration(end))*fs)]);

for i = 1:length(f0)
    pos=round(starttime(i)*fs);
    pos = pos+1
    dur = round(duration(i)*fs);
    chord = AucusticGuitarr(round(duration(i)), fs, f0(i))';
    size(chord)
    size(song(1,pos:(pos+dur)))
    song(1,pos:(pos+dur)) = (song(1,pos:(pos+dur)) + chord);
end

plot(song)
sound(song, fs)