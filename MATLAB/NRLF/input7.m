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
% 8 -- Reactive Generation Maximum(Q_g^max)
% 9 -- Reactive Generation Minimum(Q_g^min)
% A -- Bus Shunt Susceptance(b_sh)
% B -- Constant Power Load Coefficient(C_p)
% C -- Constant Current Load Coefficient(C_c)
% D -- Constant Impedance Load Coefficient(C_i)
% E -- Generator participation factor(alp)
%%         1   2    3       4       5           6                7            8         9       A        B       C       D        E          
bus_spec =[1   0   1.060   1.00   0.00    0.0000+0.0000j   0.0000+0.0000j   0.1000   -0.1000   0.00     1.00    0.00    0.00    1.000
           2   2   1.000   1.00   0.00    0.0000+0.0000j   0.0000+0.0000j   0.0000    0.0000   0.00     1.00    0.00    0.00    0.000
           3   2   1.000   1.00   0.00    0.0000+0.0000j   0.2000+0.1000j   0.0000    0.0000   0.00     1.00    0.00    0.00    0.000
           4   2   1.000   1.00   0.00    0.0000+0.0000j   0.4000+0.0500j   0.0000    0.0000   0.00     1.00    0.00    0.00    0.000
           5   2   1.000   1.00   0.00    0.0000+0.0000j   0.4500+0.1000j   0.0000    0.0000   0.00     1.00    0.00    0.00    0.000
           6   2   1.000   1.00   0.00    0.0000+0.0000j   0.6000+0.1000j   0.0000    0.0000   0.10     1.00    0.00    0.00    0.000
           7   1   1.040   1.00   0.00    0.8660+0.0000j   0.0000+0.0000j   10.000   -10.000   0.00     1.00    0.00    0.00    0.000];
%% LINEDATA consists of 5 columns. The column wise description is as
% follows:
% 1 -- Start Bus
% 2 -- End Bus
% 3 -- Line Impedance(R + jX)
% 4 -- Line charging admittance(b_l)/2. The data should be b_l/2.
% 5 -- tap ratio
%%         1  2      3          4    5
linedata =[1  2  0.0000+0.1000j  0.000j 1+0j
           6  2  0.0180+0.0555j  0.030j 1+0j
           6  5  0.0763+0.2054j  0.025j 1+0j
           2  5  0.0614+0.1505j  0.020j 1+0j
           2  4  0.0589+0.1991j  0.020j 1+0j
           2  3  0.0407+0.1057j  0.015j 1+0j
           5  4  0.0102+0.0330j  0.010j 1+0j
           4  3  0.0821+0.2059j  0.025j 1+0j
           6  7  0.0000+0.1000j  0.000j 1+0j];
%% No reactive limit is voltage dependent in this system. All Q Limits are
% constant limits.
par=[];