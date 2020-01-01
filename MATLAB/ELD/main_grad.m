clear all
clc
eps=0.001;
input_eld
 pload=input('Enter the total load demand');
 pload
 pgen=0;
 lamda=max(generation(:,3));
 n=length(generation(:,1));
 alpha=10;
  for i=1:n-1
     pg(i)=(generation(i,5)+generation(i,6))/2;
     pgen=pgen+pg(i);
  end
  pg(n)=pload-pgen;
 for k=1:500
     pgen=0;
 for i=1:n-1
     gradpg(i)=generation(i,3)+(2*generation(i,4)*pg(i))-generation(n,3)-(2*generation(n,4)*pg(n));
%      pgen=pgen+pg(i);
 end
 gradpg(n)=0;
 pg=pg-alpha*gradpg;
   for i=1:n-1
%      pg(i)=(generation(i,5)+generation(i,6))/2;
     pgen=pgen+pg(i);
  end
 pg(n)=pload-pgen;
 a=max(abs(gradpg));
 gradpg
 pg
 if a < eps
     k
     break;
 end
 end
 pg