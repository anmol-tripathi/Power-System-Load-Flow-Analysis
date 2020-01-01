clear all
clc
eps=0.1;
input_eld
 pload=input('Enter the total load demand');
 pload
 lamda=max(generation(:,3));
 n=length(generation(:,1));
 for k=1:100000
     pgen=0;
 for i=1:n
     pg(i)=(lamda-generation(i,3))/(2*generation(i,4));
     pgen=pgen+pg(i);
 end
 pgen-pload
 if ((pgen-pload)) > eps
     lamda=lamda-0.002*(pgen-pload);
  elseif (pload-pgen)>eps
      lamda=lamda+0.002*(pload-pgen);
 else
     k
     break;
 end
 end
 pg