%muestreo 
fs = 300;
%tiempo
t = 0:1/fs:1;
f = 100;
x = sin(2*pi*f*t);
%fourier
xf = fft(x);
n = length(x);
%corte
fcutoff = 50;
h = ones(n,1);
h(round(n*fcutoff/fs)+1:end) = 0;
xf_filtered = xf .* h;
x_filtered = ifft(xf_filtered);
figure;
%generación grafica
subplot(2,1,1);
plot(t,x);
title('Señal original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
subplot(2,1,2);
plot(t,real(x_filtered));
title('Señal filtrada');
xlabel('Tiempo (s)');
ylabel('Amplitud');