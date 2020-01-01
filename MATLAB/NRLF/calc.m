function [S,S1,V]=calc(Vmag,Ang,Ybus,bus_spec)
[E,F]=pol2cart(Ang,Vmag);
V=complex(E,F);
S=V.*conj(Ybus*V);
S1=S+bus_spec(:,7)-bus_spec(:,6);
return