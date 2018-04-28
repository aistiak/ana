clc
clear all

 msa = input ('enter message amplitude ');
 csa = input ('enter carrier amplitude ');
 fm = input ('enter message frequency '); 
 fc = input ('enter carrier frequency ');
 m = msa/csa ;
 t = 0:0.001:1 ;
 w1 = (2  * pi * fm *  t) ;
 w2 = ( 2 * pi * fc * t ) ;
 
 
 %---------------------------------
 
 ms = msa * sin (w1); % message signal 
 %plotting message signal 
 subplot(3,1,1);
 plot(t,ms);
 %plotting carrier signal 
 cs = sin (w2);
 subplot(3,1,2);
 plot(t,cs);
 
 %--------------------------------
 
 dsbsc = csa  * m.*  sin(w1).*sin( w2);
 
 subplot(3,1,3);
 plot(t,dsbsc);