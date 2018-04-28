clc;
clear all;
ma=input('enter message amplitude: ');
ca=input('enetr carrier amplitude: ');
fm=input('enter messege frequency: ');
fc=input('enter carrier frequency: ');

t=0:0.001:1;
m1=ma*sin(2*pi*fm*t);
c1=ca*sin(2*pi*fc*t);
%mh = sin((2*pi*fm*t)-90);
%using hilbert transform
s1 = m1.*cos(2*pi*fc*t) + (hilbert(m1).*sin(2*pi*fc*t)); % for upper modulation
s2 = m1.*cos(2*pi*fc*t) -( hilbert(m1).*sin(2*pi*fc*t)); % for lower modulation
su=s1.*c1;
sl=s2.*c1;
%s=fdesign.bandpass(s1);
subplot(4,2,1)
plot(t,m1,'k');
title('message signal');
subplot(4,2,2);
plot(t,c1,'b');
title('carrier signal');
subplot(4,2,3);
plot(t,su,'g');
title('SSB-SC  upper modulation signal');
subplot(4,2,4);
plot(t,sl,'g');
title('SSB-SC  lower modulation signal');

noise=randn(size(t));
subplot(4,2,5);
plot(t,noise,'r');
title('noise signal');
adnoise=s1+noise;
adnoise=adnoise.*cos(2*pi*fc*t);
%adnoise=adnoise.*m1;
%adnoise=ms+noise;
%b = (1/100)*ones(1,100);
%a = 1;

wn=0.02;
[b,a]=butter(2,wn);
vout=filter(b,a,adnoise);
subplot(4,2,6);
plot(t,vout,'c');
title('upper demodulated signal');
adnoise1=s2+noise;
adnoise1=adnoise1.*cos(2*pi*fc*t);
%adnoise=adnoise.*m1;
%adnoise=ms+noise;
%b = (1/100)*ones(1,100);
%a = 1;

wn=0.02;
[b,a]=butter(2,wn);
vout=filter(b,a,adnoise);
subplot(4,2,7);
plot(t,vout,'c');
title('lower demodulated signal');


