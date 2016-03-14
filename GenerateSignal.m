function [ signal ] = GenerateSignal( type, fs, part )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%skapar en signal att använda:Ändra signalen för att få olika ljud, exponential, börja från 0 ... 
signal=randn(fs ,1);
signal2 = zeros(1,fs);

if type == 0
    
    signal2=exp(-80*linspace(0,1,fs));
elseif type==1
    signal2=exp(-8*linspace(0,1,fs));
elseif type == 2
%    t=1:round(fs*part); 
%    signal2=sin(linspace(0,2*pi,fs));
else
    signal2(1:round(fs*part))=ones(1,round(fs*part));
end
signal = signal.* signal2';
%Normaliserar signalen så att den bara innehåller värden mellan -1 och 1
signal_normalized=signal/max(abs(signal));


end

