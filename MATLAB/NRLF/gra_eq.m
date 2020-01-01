function [a]=gra_eq(pq,Ain,lpq,n,Ybus,V,A,S,Sb,lpq1,tem,bus_spec,cpv)
a=zeros(n-1+lpq);
R=real(Ybus);I=imag(Ybus);P=real(S);Q=imag(S);Pd=real(Sb);Qd=imag(Sb);
%% P
for k=1:n-1
    b=Ain(k);
    for l=1:n-1%%%%%%Ang
        c=Ain(l);
        if (b==c)
            a(k,l)=-Q(b)-V(b)^2*I(b,b);
        else
            a(k,l)=-V(b)*V(c)*(R(b,c)*sin(A(c)-A(b))+I(b,c)*cos(A(c)-A(b)));
        end
    end
    for l=1:lpq%%%%%%Vmag
        c=pq(l);
        if (b==c)
            a(k,n-1+l)=P(b)/V(b)+V(b)*R(b,b);
        else
            a(k,n-1+l)=V(b)*(R(b,c)*cos(A(c)-A(b))-I(b,c)*sin(A(c)-A(b)));
        end
    end
end
%% Q
for k=1:lpq
    b=pq(k);
    for l=1:n-1%%%%%%Ang
        c=Ain(l);
        if (b==c)
            a(n-1+k,l)=P(b)-V(b)^2*R(b,b);
        else
            a(n-1+k,l)=-V(b)*V(c)*(R(b,c)*cos(A(c)-A(b))-I(b,c)*sin(A(c)-A(b)));
        end
    end
    for l=1:lpq%%%%%%Vmag
        c=pq(l);
        if (b==c)
            a(n-1+k,n-1+l)=Q(b)/V(b)-V(b)*I(b,b);
        else
            a(n-1+k,n-1+l)=-V(b)*(R(b,c)*sin(A(c)-A(b))+I(b,c)*cos(A(c)-A(b)));
        end
    end
end
return