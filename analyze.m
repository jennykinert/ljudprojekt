function [ f0, duration, starttime, amplitude ] = analyze( midi )
%ANALYZE Summary of this function goes here
%   Detailed explanation goes here

Notes = midiInfo(midi);
f0 = midi2freq(Notes(:,3));
duration = Notes(:,6)-Notes(:,5);
starttime = Notes(:,5);
amplitude = Notes(:,4)./127;


end

