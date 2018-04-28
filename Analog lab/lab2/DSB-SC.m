clc
clear all

 msa = input ('message amplitude');
 csa = input ('carrier amplitude');
 fm = input ('message frequency'); 
 fc = input ('carrier frequency');
 m = msa/csa ;
 t = 0:0.001:1 ;
 
 
 %---------------------------------
 
 ms = msa * sin (2  * pi * fm *  t) ;
 
 subplot(3,1,1);
 plot(t,ms);
 cs = sin ( 2 * pi * fc * t );
 subplot(3,1,2);
 plot(t,cs);