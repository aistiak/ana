clear all
clc 
fs = 2000 ;
fm = 5 ;
fc = 250 ;
n = 2000;
t = (1:n)/fs ;
wn = 0.02 ;
[b,a] = butter(2,wn);
w = (1:n)*2*pi*fm/fs ;
vc = sin(w);
vsig = sawtooh(w1,0.5);
%vm = (1+0.5,);
