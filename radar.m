clear all; close all; clc;

T=30;
n=512;

t2 = linspace(-T/2, T/2, n+1); t = t2(1:n);
k = (2*pi/T)*[0:n/2-1 -n/2:-1]; % rescale from 2 pi and split into frequency components.
ks = fftshift(k);

u = sech(t);
ut = fft(u);

noise = 20;
utn = ut+noise*(randn(1,n)+i*randn(1,n));
un = ifft(utn);

subplot(2,1,1), plot(t, u, 'k', t, abs(un), 'm'); % signal vs time
subplot(2,1,2), plot(ks, abs(fftshift(ut))/max(abs(fftshift(ut))), 'k', ...
    ks, abs(fftshift(utn))/max(abs(fftshift(utn))), 'm');
axis([-25,25,0,1]);