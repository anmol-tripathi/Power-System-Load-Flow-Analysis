clear all
clc
eps=0.001;
input_eld
 pload=input('Enter the total load demand');
 pload
 pgen=0;
 lamda=max(generation(:,3));
 n=length(generation(:,1));
 alpha=1;
%  for i=1:n
%      pg(i)=(generation(i,5)+generation(i,6))/2;
%      pgen=pgen+pg(i);
%   end
pg(1)=300;
pg(2)=200;
pg(3)=300;
lamda=9.4484;
 for k=1:10
     
     pgen=0;
 for i=1:n
     gradpg(i)=generation(i,3)+(2*generation(i,4)*pg(i))-lamda;
     pgen=pgen+pg(i);
 end
 pg=pg-(gradpg*alpha);
 pg(n+1)=lamda;
 gradpg(n+1)=pload-pgen;
 pg(n+1)=pg(n+1)-0.2*gradpg(n+1);
 a=max(abs(gradpg));
 gradpg;
 pg
 if a < eps
     k
     break;
 end
 end
 pg