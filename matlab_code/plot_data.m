clear all;
close all;
clc;

data = csvread('data_100m.csv');
time = data(:, 1);
amplitude = data(:, 2);

amplitude_decimal = [];

for i=1:length(amplitude)
    amplitude_decimal(i) = bin2dec(num2str(amplitude(i)));
end

amplitude_data = [];
time_data = [];
index = 1;
for i=1:length(amplitude_decimal)
    if amplitude_decimal(i)~=0
        amplitude_data(index) = amplitude_decimal(i);
        time_data(index) = time(i);
        index = index+1;
    end
end

figure;
subplot(4, 1, 1);
stem(time_data, amplitude_data)

N = length(amplitude_data);
Ts = time(N)-time(1);
disp(Ts);
Fs = 1/Ts;

% y_fft = abs(fft(amplitude_data' .* blackmanharris(N)));
% y_fft = y_fft(1:N/2);
% f = Fs*(0:N/2-1)/N; 
% 
% subplot(2, 1, 2);
% plot(f, y_fft);
% xlabel('Frequency');
% ylabel('Amplitude');
% title('FFT');

n = length(amplitude_data); 
Ts = time(n)-time(1);
disp(Ts);
Fs = 1/Ts;
NFFT = 2^nextpow2(n);
Y = fft(amplitude_data,NFFT)/n;
han = fft(amplitude_data' .* hanning(n), NFFT)/n;
bhw = fft(amplitude_data' .* blackmanharris(n), NFFT)/n;
f = Fs/2*linspace(0,1,NFFT/2+1);

subplot(4, 1, 2);
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Normal FFT')
xlabel('Frequency (Hz)')
ylabel('Y(f)');

subplot(4, 1, 3);
plot(f,2*abs(han(1:NFFT/2+1))) 
title('Hanning window - FFT')
xlabel('Frequency (Hz)')
ylabel('Y(f)');

subplot(4, 1, 4);
plot(f,2*abs(bhw(1:NFFT/2+1))) 
title('Blackmanharris window - FFT')
xlabel('Frequency (Hz)')
ylabel('Y(f)');


