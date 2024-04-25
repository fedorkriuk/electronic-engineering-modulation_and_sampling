clear
N=14400; % number of points
n=0:N-1; % n index

fs1=16e3; % sampling frequency 1 (16 kHz)
x1 = 6*cos(6*pi*1000*n/fs1)+9*cos(24*pi*1000*n/fs1)+11*cos(36*pi*1000*n/fs1);
f1=[-N/2:N/2-1]*(fs1/N); % frequency index for x1

fs2=72e3; % sampling frequency 2 (72 kHz)
x2 = 6*cos(6*pi*1000*n/fs2)+9*cos(24*pi*1000*n/fs2)+11*cos(36*pi*1000*n/fs2); % x is sampled using fs2 = x2[n]
f2=[-N/2:N/2-1]*(fs2/N); % frequency index for x2

figure(3)
subplot(211); plot(f1, abs(fftshift(fft(x1))/length(x1))); % plot magnitude spectrum of x1
grid; ylabel('|X1|'); xlabel('freuqency (Hz)');

subplot(212); plot(f2, abs(fftshift(fft(x2))/length(x2))); % plot magnitude spectrum of x2
grid; ylabel('|X2|'); xlabel('freuqency (Hz)');
