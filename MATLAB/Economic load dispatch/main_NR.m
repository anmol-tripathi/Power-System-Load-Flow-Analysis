clear all
clc
eps=0.001;
input_eld
 pload=input('Enter the total load demand');
 pload
 pgen=0;
 lamda=max(generation(:,3));
 n=length(generation(:,1));
  for i=1:n
     pg(i,1)=(generation(i,5)+generation(i,6))/2;
     pgen=pgen+pg(i,1);
  end
  pg(n+1,1)=lamda;
  jaco=zeros(n+1,n+1)
 for i=1:n
     jaco(i,i)=2*generation(i,4);
     jaco(i,n+1)=-1;
     jaco(n+1,i)=-1;
 end
 jaco
 jac_inv=inv(jaco)
 pg
 for k=1:5
     pgen=0;
 for i=1:n
     gradpg(i)=generation(i,3)+(2*generation(i,4)*pg(i,1))-pg(n+1,1);
     pgen=pgen+pg(i,1);
 end
 gradpg(n+1)=pload-pgen;
 a=max(abs(gradpg));
 gradpg;
 pg
 if a < eps
     k
     break;
 end
 
 pg=pg-((inv(jaco))*transpose(gradpg));
 pg;
 end
 pg