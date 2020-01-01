clear all
clc
eps=1e-4;
input3
sl=find(bus_spec(:,2)==0);
if (length(sl)~=1)
    disp('Execution terminated............Check Slack bus');
    return
end
busdata=bus_spec;
% lda=input('Load Multiplier (1 is implicit in this i.e. for e.g. 1.2 loading, specify 0.2) -- ');
% bus_spec(:,6)=complex(real(bus_spec(:,6))*(1+lda),imag(bus_spec(:,6)));
% bus_spec(:,7)=bus_spec(:,7)*(1+lda);
pv=find(bus_spec(:,2)==1);
pq=find(bus_spec(:,2)==2);
lpq=length(pq);lpq1=lpq;
lpv=length(pv)
disp('...........PV and PQ Buses Sorted Out')
Cp=bus_spec(:,11);Cc=bus_spec(:,12);Ci=bus_spec(:,13);
[Ybus,n]=formybus(linedata,bus_spec(:,10));
disp('...........YBUS Evaluated')
Ybus
s=bus_spec(:,6)-bus_spec(:,7)
Vn=bus_spec(:,4);
v1=zeros(lpq+lpv+1);
Ain=[pv;pq];
Vmag=bus_spec(:,3);
Ang=bus_spec(:,5);
[vx vy]=pol2cart(Ang,Vmag);
v=complex(vx,vy)
for u=1:10000
    Vmax=0;
for m=1:lpq
    x=0+0i;
    for r=1:n
        if r~=pq(m)
            x=x+v(r)*Ybus(r,pq(m));
        end
    end
    x;
    ((conj(s(pq(m)))/conj(v(pq(m))))-x);
    vpq(pq(m))= (((conj(s(pq(m)))/conj(v(pq(m))))-x)/Ybus(pq(m),pq(m)));
    Vchange(pq(m))=abs(abs(v(pq(m)))-abs(vpq(pq(m))));
    achange(pq(m))=abs(angle(v(pq(m)))-(angle(vpq(pq(m)))));
    v(pq(m))=vpq(pq(m));
    
end
vpq;
m=0;
for m=1:lpv
    x=0+0i;
    for r=1:n
            x=x+v(r)*Ybus(r,pv(m));
    end
    Q=-imag(x*conj(v(pv(m))));
    x=0+0i;
        for r=1:n
        if r~=pv(m)
            x=x+v(r)*Ybus(r,pv(m));
        end
        end

    if Q>bus_spec(pv(m),8)
        Q=bus_spec(pv(m),8)
        pv(m)
        spv(pv(m))=s(pv(m))+complex(0,Q);
        vpv(pv(m))= (((conj(spv(pv(m)))/conj(v(pv(m))))-x)/Ybus(pv(m),pv(m)));
    Vchange(pv(m))=abs((v(pv(m)))-(vpv(pv(m))));
    achange(pv(m))=abs(angle(v(pv(m)))-(angle(vpv(pv(m)))));
    v(pv(m))=vpv(pv(m));
        
    elseif Q<bus_spec(pv(m),9)
        Q=bus_spec(pv(m),9)
        pv(m)
        spv(pv(m))=s(pv(m))+complex(0,Q);
vpv(pv(m))= (((conj(spv(pv(m)))/conj(v(pv(m))))-x)/Ybus(pv(m),pv(m)));
    Vchange(pv(m))=abs((v(pv(m)))-(vpv(pv(m))));
    achange(pv(m))=abs(angle(v(pv(m)))-(angle(vpv(pv(m)))));
    v(pv(m))=vpv(pv(m));
        
    else
        spv(pv(m))=s(pv(m))+complex(0,Q);
vpv(pv(m))= (((conj(spv(pv(m))))/conj(v(pv(m))))-x)/Ybus(pv(m),pv(m));
   Vchange(pv(m))=abs((v1(pv(m)))-(vpv(pv(m))));
    achange(pv(m))=abs(angle(v1(pv(m)))-(angle(vpv(pv(m)))));
    v1(pv(m))=vpv(pv(m));
vpv(pv(m))= bus_spec(pv(m),3)*(vpv(pv(m))/abs(vpv(pv(m))));
 
    v(pv(m))=vpv(pv(m));
    
        
        
    end
end
Vchange;
achange;
Vmax=max(max(Vchange),max(achange));
 Vmax=max(Vchange)
    if(Vmax<eps)
        u
        break;
    end
end
abs(v)
[x y]=cart2pol(real(v),imag(v))
