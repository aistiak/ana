clc;
close all;
clear all;
m1=input('amplitude of m1 :');
m2=input('amplitude of m2 :');
fm1=input('frequency of m1 :');
fm2=input('frequency of m1 :');
fc=input('frequency of carrier :');
 
t=0:.001:1
ms1=m1*sin(2*pi*fm1*t);
subplot(6,2,1);
plot(t,ms1,'b');
 
ms2=m2*sin(2*pi*fm2*t);
subplot(6,2,2);
plot(t,ms2,'b');
 
c1=cos(2*pi*fc*t);
c2=sin(2*pi*fc*t);
 
qam=(ms1.*c1)+(ms2.*c2);    %modulated signal


 	subplot(6,2,3);
plot(t,qam,'r');
 
noise=sin(2*pi*t);
noise=noise+0.5*randn(size(t));
nms=noise+qam;
subplot(6,2,4);
plot(t,nms,'g');
 
ws = 50;
b = (1/ws)*ones(1,ws);
a = 1;
 
nms2=2*nms.*c1;     % demodulated m1 msg signal
vout=filter(b,a,nms2);
subplot(6,2,5);
plot(t,vout,'r');
 
nms1=2*nms.*c2;     %demodulated m2 msg signal
vout1=filter(b,a,nms1);
subplot(6,2,6);
plot(t,vout1,'r');


