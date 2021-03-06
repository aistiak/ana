clc
clear all
 fs = 1000 ;
 n = 1001;
 
wn=0.02;
[b,a]=butter(2,wn);
 
 msa = input('enter message amplitude : ');
 csa = input('enter carrier amplitude : ');
 fm =  input('enter message frequency : '); 
 fc =  input('enter carrier frequency : ');
 
 m = msa/csa ;
 t = 0:0.001:1 ;
 w1 =(2  * pi * fm *  t);
 w2 = ( 2 * pi * fc * t ) ;
 
 %---------------------------------
 
 ms = msa * sin(w1) ; % message signal 
 %plotting message signal 
 subplot(5,1,1);
 plot(t,ms);
 title('message signal');
 %plotting carrier signal 
 cs = sin(w2) ;
 subplot(5,1,2);
 plot(t,cs);
 title('carrier signal');
 
 %--------------------------------s
 
 dsbsc = csa  * m.*  sin(w1).*sin(w2);
 
 subplot(5,1,3);
 plot(t,dsbsc);
 title('modulated');
 %noise 
 noise=randn(1,n) ;
 scale=(var(dsbsc)/var0(noise))*3.16;
 %scale=(var(vsig)/var(noise))*3.16;
 dsbsc = dsbsc+ noise*scale ;
 subplot(5,1,4);
 plot(t,dsbsc);
 title('noise');
 
v1=cs.*dsbsc;
vout=filter(b,a,v1);
subplot(5,1,5);
plot(t,vout,'c');
 

 