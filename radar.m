clear all; close all; clc;

T=30; % range
n=512; % number of points
test = 0; % offset of filter

t2 = linspace(-T/2, T/2, n+1); t = t2(1:n); % t is time
k = (2*pi/T)*[0:n/2-1 -n/2:-1]; % rescale from 2 pi and split into frequency components.
ks = fftshift(k);

u = sech(t); % incoming signal
ut = fft(u); % transformed signal

noise = 10; % 20
utn = ut+noise*(randn(1,n)+i*randn(1,n)); % transform with added noise
un = ifft(utn); % noisy signal

filter = exp(-(k-test).^2); % test moves it away from our target signal.
utnf = filter.*utn; % filtered fourier transform (signal vs frequency)

unf = ifft(utnf); % filtered signal vs time

subplot(2,1,1), plot(...t, u, 'k', t, abs(un), 'm', ... % signal vs time (black = orig, magenta = noisy)
    t, abs(unf), 'g', ... % filtered noisy signal
    t, 0*t+0.5, 'k:'); % threshold line
subplot(2,1,2), plot(ks, abs(fftshift(ut))/max(abs(fftshift(ut))), 'k', ... % unit scaled fourier trans
    ks, abs(fftshift(utn))/max(abs(fftshift(utn))), 'm', ... % noisy fourier trans'd signal
    ks, fftshift(filter), 'b', ... % The filter
    ks, abs(fftshift(utnf))/max(abs(fftshift(utnf))), 'g'); % filtered transform
axis([-25,25,0,1]);
