%% Inputfile for a 7 bus system
% All Data is in p.u. 'j' refers to imaginary operator. '_' refers to
% subsciprt. '^' refers to superscript.
%% BUS_SPEC consists of 14(Hex - E) columns. The column wise description is
% as follows:
% 1 -- Bus Numer.
% 2 -- Type of Bus, 0 == slack, 1 == PV, 2 == PQ
% 3 -- Initial Choice for Voltage(V)
% 4 -- Nominal Bus Voltage(V_n)
% 5 -- Initial Choice for Angle(A)
% 6 -- Generation Specification(P_g + jQ_g)
% 7 -- Nominal Load Specification(P_dn + jQ_dn)
% 8 -- Reactive 7Generation Maximum(Q_g^max)
% 9 -- Reactive Generation Minimum(Q_g^min)
% A -- Bus Shunt Susceptance(b_sh)
% B -- Constant Power Load Coefficient(C_p)
% C -- Constant Current Load Coefficient(C_c)
% D -- Constant Impedance Load Coefficient(C_i)
% E -- Generator participation factor(alp)
%%         1   2    3       4       5           6                7            8         9       A        B       C       D        E          
bus_spec =[1   0   1.050   1.00   0.00    0.0000+0.0000j   0.0000+0.0000j   10.000   -10.000   0.00     1.00    0.00    0.00    1.000
           2   1   1.050   1.00   0.00    0.5000+0.0000j   0.0000+0.0000j   1.0000  -0.500   0.00     1.00    0.00    0.00    0.000
           3   1   1.070   1.00   0.00    0.6000+0.0000j   0.0000+0.0000j   1.5000  -0.500   0.00     1.00    0.00    0.00    0.000
           4   2   1.000   1.00   0.00    0.0000+0.0000j   0.7000+0.7000j   10.000   -10.000   0.00     1.00    0.00    0.00    0.000
           5   2   1.000   1.00   0.00    0.0000+0.0000j   0.7000+0.7000j   10.000   -10.000   0.00     1.00    0.00    0.00    0.000
           6   2   1.000   1.00   0.00    0.0000+0.0000j   0.7000+0.7000j   10.000   -10.000   0.00     1.00    0.00    0.00    0.000];bus_spec(:,end)=[];
%% LINEDATA consists of 5 columns. The column wise description is as
% follows:
% 1 -- Start Bus
% 2 -- End Bus
% 3 -- Line Impedance(R + jX)
% 4 -- Line charging admittance(b_l)/2. The data should be b_l/2.
% 5 -- tap ratio
%%         1  2      3          4    5
linedata =[1  2   0.10+0.20j   0.02   1+0j;
             1      4       0.05+0.20j     0.02 1+0j;
             1      5       0.08+0.30j     0.03 1+0j;
             2      3       0.05+0.25j     0.03 1+0j;
             2      4       0.05+0.10j     0.01 1+0j;
             2      5       0.10+0.30j     0.02 1+0j;
             2      6       0.07+0.20j     0.025 1+0j;
             3      5       0.12+0.26j     0.025 1+0j;
             3      6       0.02+0.10j     0.01 1+0j;
             4      5       0.20+0.40j     0.04 1+0j;
             5      6       0.10+0.30j     0.03 1+0j];
%% No Voltage Dependent reactive limits in this system. All Q Limits are
% constant limits.
% par=[];
%% Parameters for evaluating voltage dependent Q limits is defined as 
% follows:
% I_a_max -- Maximum allowable stator current.
% X_d -- Direct axis reactance for cylindrical pole rotor. Machine resistance is neglected. 
% E_f_max and E_f_min -- Maximum and minimum excitation 
% voltage. In pu, these are same as I_f_max and I_f_min.
% del_max -- maximum allowable rotor angle.
% E_ext -- external voltage magnitude of infinite bus.
% X_ext -- external reactance.
% I_a_max=1.05;
% X_d=0.5;
% E_f_max=1.20;
% E_f_min=0.05;
% del_max=82;
% E_ext=1;
% X_ext=0.4;
% par=[I_a_max X_d E_f_max E_f_min del_max E_ext X_ext];
par=[];