% Formation of Ybus.
function [Ybus,busno] = formybus(linedata,bus_shunt)
busa=linedata(:,1);
busb=linedata(:,2);
busno=max(max(busa),max(busb));
L=length(busa);
Z=linedata(:,3);
shunt=linedata(:,4);
t=linedata(:,5);

Y=ones(L,1)./Z;

Ybus=zeros(busno,busno);
for k=1:L
    n=busa(k);m=busb(k);
    Ybus(n,n)=Y(k)/abs(t(k))^2+Ybus(n,n)+shunt(k);
    Ybus(n,m)=-Y(k)/conj(t(k))+Ybus(n,m);
    Ybus(m,n)=-Y(k)/t(k)+Ybus(m,n);
    Ybus(m,m)=Y(k)+Ybus(m,m)+shunt(k);
end
for p=1:busno
    Ybus(p,p)=Ybus(p,p)+bus_shunt(p)*j;
end
return