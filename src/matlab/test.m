[b,a] = sos2tf(SOS,G);
%[z, p, k] = tf2zpk(b,a); % 求极零点，z为零点向量，p为极点向量，k为系数

Fs = 1e7; % 
f1 = 1e5; % 
f2 = 2*1e6; % 
f3 = 5*1e6; % 
t = 0 : 1/Fs : 0.001; 
s1 = cos((2 * pi * f1) .* t); 
s2 = cos((2 * pi * f2) .* t); 
s3 = cos((2 * pi * f3) .* t);
s = (s1 + s2 + s3) ./ 3;


figure(1); % plot
subplot(2,1,1); stem(s(1:300)); grid; % plot original 
title('Original signal in time-domain'); 
xlabel('k');
ylabel('s(k)'); 
% FFT on signal s
len = 4096; % FFT length
f = Fs .* (0 : len/2 - 1) ./ len; 
y = fft(s, len); % do len-points FFT transform on the signal s
subplot(2,1,2);
plot(f, abs(y(1:len/2))); grid; % plot original signal s on the frequency domain
title('Original signal spectrum in frequency domain') 
xlabel('f (Hz)');
ylabel('S(f)');
s_bp=filter(b,a,s);
B=A';
y_bp=fft(B, len);


figure(2); 
subplot(2,1,1);
s2 = s2 ./ 3;
plot(t(100:200), s2(100:200), 'blue', t(100:200), B(100:200), 'red'); grid; xlim([0.00001 0.00002])
legend('Original 2MHz signal','Filtered 2MHz signal'); 
title('Comparison of signal before and after filtering'); 
xlabel('t (s)');ylabel('s(t)'); 
subplot(2,1,2);
plot(f, abs(y_bp(1:len/2)));grid; 
title('Filtered signal spectrum in frequency domain'); 
xlabel('f (Hz)');ylabel('S(f)');