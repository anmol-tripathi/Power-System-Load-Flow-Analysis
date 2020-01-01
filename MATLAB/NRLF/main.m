clear all
clc
eps=1e-10;
input7
sl=find(bus_spec(:,2)==0);
if (length(sl)~=1)
    disp('Execution terminated............Check Slack bus');
    return
end
busdata=bus_spec;
pv=find(bus_spec(:,2)==1);
pq=find(bus_spec(:,2)==2);lpq=length(pq);lpq1=lpq;
disp('...........PV and PQ Buses Sorted Out')
[Ybus,n]=formybus(linedata,bus_spec(:,10));
disp('...........YBUS Evaluated')
Ybus
 
Ain=[pv;pq];
Vmag=bus_spec(:,3);Ang=bus_spec(:,5);
for iter=1:41
     fprintf(1,'PV_Bus     Qgmin      Qgmax     Qg       P_st    f_st    Max    Min\n');
     [bus_spec,Ain,pq,lpq,Vmag,pv,LP]=Q_check(bus_spec,Vmag,Ang,n,Ybus,pv,pq);
     [S,S1]=calc(Vmag,Ang,Ybus,bus_spec);
     mis=[real(S1(Ain)); imag(S1(pq))];
     if(max(abs(mis))<eps)
         break;
     end
     J=gra_eq(pq,Ain,lpq,n,Ybus,Vmag,Ang,S,bus_spec(:,7),lpq1,LP,bus_spec,[]);
     del=-inv(J)*mis;
     Ang(Ain)=Ang(Ain)+del(1:n-1);
     Vmag(pq)=Vmag(pq)+del(n:end);
%      iter=iter+1;
     if iter>=40
         disp('.............diverence encountered.......');
         break
         return
     end
     fprintf(1,'Iteration -- %3d\n',iter);
 end
 disp('...........Iterations Completed')
 [bus_spec(:,1),Vmag, Ang]
