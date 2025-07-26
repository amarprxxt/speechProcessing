clear; close all; clc;

[amarpreetMusic, Fs] = audioread('amarpreet.wav');

%We Plot the signal here
figure
plot(amarpreetMusic) 
grid on
title('Signal Time Domain Plot')

%I am Playing the speech at half the sampling frequency.
sound(amarpreetMusic,0.5*Fs)

%% here let us add Echoes to the Recorded Sound

NN = length(amarpreetMusic);

amarpreetMusic2 = zeros(2*NN,1);

amarpreetMusic2(NN/2:(NN/2 + NN - 1)) = 4*0.25*amarpreetMusic;

amarpreetMusic2((NN+1):2*NN) = amarpreetMusic2((NN+1):2*NN) + 4*0.25*amarpreetMusic;

amarpreetMusic2(1:NN) = amarpreetMusic2(1:NN) + amarpreetMusic;

% sound(amarpreetMusic2,Fs)                           
% Play signal at the default Fs

%% Limiting the Amplitude of the recorded sound

amarpreetMusic3 = amarpreetMusic;

for ii = 1:NN
    
    if amarpreetMusic3(ii) >= 0.2 || amarpreetMusic3(ii) <= -0.2%Acc_z(k) >= noise || Acc_z(k) <= -noise
        
        amarpreetMusic3(ii) = amarpreetMusic3(ii)*2;
        
    end
    
end

figure
plot(amarpreetMusic3) 
grid on
title('Signal after limiting the amplitude')

% sound(amarpreetMusic3,Fs)                           % Play the signal at the default Fs


%% Recording, playing and processing Recorded Audio

% Sound1 = audiorecorder(16000,16,1);     % Define an Audio Sound with Fs, Bits and channels
% record(Sound1);                         % Record the Audio until asked to stop
% stop(Sound1);                           % Stop recoding the audio
% play(Sound1);                           % Play the recorded audio
% Recording = getaudiodata(Sound1,'double');    % Store recorded audio in numerical array
