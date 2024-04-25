[s4,fs]=audioread('m1a.wav'); % read the audio file and sample rate
s4=s4'; % transpose

% Modulation
t=[0:length(s4)-1]/fs; % time index
h_carrier_f = 55000;
c=cos(2*pi*h_carrier_f*t); % carrier frequency is 10 kHz (10e3 = 10000)
x=s4.*c; % x is the modulated signal
f=[-length(s4)/2:length(s4)/2-1]*fs/length(s4); % frequency index (from − fs/2 to fs/2)
% Demodulation
e=x.*c; % frequency shifting (back to the baseband)

N=16;

W_n = 2 * 10000 / fs;
[B1, A1] = butter(N, W_n);

y = filter(B1, A1, x);
[H1, fh] = freqz(B1, A1, 1e3, fs);

figure(1);
subplot(311); plot(f, abs(fftshift(fft(s4)))); ylabel('S4'); grid; % spectrum of baseband signal
subplot(312); plot(f, abs(fftshift(fft(e)))); ylabel('E(f)'); grid; % after frequency shifting
subplot(313); plot(f, abs(fftshift(fft(y)))); ylabel('Y(f)'); grid; % after lowpass filtering
xlabel("f [Hz]");

figure(2);
subplot(211); plot(fh, abs(H1)); axis([0 fs/2 0 1.2]); grid; ylabel('abs H1');

soundsc(s4, fs);
soundsc(y, fs);
