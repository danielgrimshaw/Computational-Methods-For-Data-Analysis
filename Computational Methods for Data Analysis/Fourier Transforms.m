clear all; close all; clc;

L=4;#20;
n=128;

x2=linspace(-L/2,L/2,n+1); x=x2(1:n);

# Frequencies
k=(2*pi/L)*[0:n/2-1 -n/2:-1];

u=sech(x); #function
ud=-sech(x).*tanh(x); #first deriv (exact)
u2d=sech(x)-2*sech(x).^3;#second deriv (exact)

ut=fft(u); # Fourier Transform

uds=ifft( (i*k).*ut ); # Approximate first deriv
u2ds=ifft( (i*k).^2.*ut ); # Approximate second deriv

ks=fftshift(k);
# X axis is Frequencies
#plot(ks,abs(fftshift(ut)))
plot(x,ud,'r', x,uds,'mo');
# ^^^ Plots the strength of each frequency

