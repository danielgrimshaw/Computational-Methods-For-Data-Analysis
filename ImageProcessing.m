clear all; close all; clc;

A = imread('water', 'jpg');
Abw = rgb2gray(A);
A3 = Abw;

Abw = double(Abw);%(426:-1:1,:));
A2 = double(A);

Abwn = Abw+50*randn(426, 568);
A2n = A2+50*randn(426, 568, 3);
A1 = uint8(Abwn);

%A2ni = uint8(A2n);
%imshow(A2ni);
%break;

%Abwni = uint8(Abwn);
%imshow(Abwni);

figure(1);
pcolor(Abwn), shading interp;

figure(2);
Abwt = fftshift(fft2(Abwn));
pcolor(log(abs(Abwt))), shading interp, colormap(hot);

% FILTER
kx=1:568; ky=1:426;
[KX, KY] = meshgrid(kx,ky);
sigma = 0.0005;
F = exp(-sigma*(KX-285).^2 - sigma*(KY-214).^2);

Abwtf = Abwt.*F;
surfl(F), shading interp;

Abwf = ifft2(fftshift(Abwtf));

A2 = uint8(Abwf);
%subplot(2,2,1), 
imshow(A1);
figure(3);
% subplot(2,1,1),
imshow(A2);
% subplot(2,1,2), imshow(A3);