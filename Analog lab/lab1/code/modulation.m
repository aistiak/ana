clear all;
clc;
fs=2000;
fm=5;
fc=250;
n=2000;
t=(1:n)/fs;
wn=0.02;
[b,a]=butter(2,wn);
w=(1:n)*2*pi*fc/fs;%normalization
w1=(1:n)*2*pi*fm/fs;
vc=sin(w); % carrier
vsig=sawtooth(w1,0.5);%meaasge %0.5 is filter coefficient
vm=(1+0.5*vsig).*vc; % modulated sig 
%msg signal
subplot(5,1,1);
plot(t,vsig,'k');
title('Maasge Signal');
%carrier signal 
subplot(5,1,2);
plot(t,vc,'g');
title('Carrer Signal');
%modulated 
subplot(5,1,3);
plot(t,vm,'m');
title('modulate');
%adding noise 
noise=randn(1,n); % noise signal 
scale=(var(vsig)/var(noise))*3.16;
vm=vm+noise*scale;%adding noise signal
%noise
subplot(5,1,4);
plot(t,vm,'r');
title('noisesignal');
ishift=fix(0.125*fs/fc);
vc=[vc(ishift:n) vc(1:ishift-1)];
v1=vc.*vm;
vout=filter(b,a,v1);
%recovered
subplot(5,1,5);
plot(t,vout,'c');


