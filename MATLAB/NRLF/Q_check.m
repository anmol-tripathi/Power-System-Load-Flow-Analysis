
function [bus_spec1,Ain,pq,lpq,Vmag,pv,l]=Q_check(bus_spec,Vmag,Ang,n,Ybus,pv,pq)
Vmag1=Vmag;l=[];bus_spec1=bus_spec;
for ct=1:n
    if (bus_spec(ct,2)==1)
        Vmag(ct)=bus_spec(ct,3);
        [E,F]=pol2cart(Ang,Vmag);
        V=E+F*j;
        S=V.*conj(Ybus*V);
        
            Qmax=bus_spec(ct,8);
            Qmin=bus_spec(ct,9);
            fprintf(1,'%3d       %-6.4f     %-6.4f   %-6.4f',ct,Qmin,Qmax,imag(S(ct)));
            if (imag(S(ct))<Qmin)
                a=find(pv==ct);
                pq=[pq; pv(a)];
                bus_spec1(pv(a),6)=complex(real(bus_spec(pv(a),6)),Qmin);
                pv(a)=[];
                Vmag(ct)=Vmag1(ct);

            elseif (imag(S(ct))>Qmax)
                a=find(pv==ct);
                pq=[pq; pv(a)];
                bus_spec1(pv(a),6)=complex(real(bus_spec(pv(a),6)),Qmax);
                pv(a)=[];
                Vmag(ct)=Vmag1(ct);
            else
                a=find(pq==ct);
                pv=[pv; pq(a)];
                bus_spec1(pq(a),6)=complex(real(bus_spec(pq(a),6)),0);
                pq(a)=[];

            end
    end
end
lpq=length(pq);
Ain=[pv; pq];
return