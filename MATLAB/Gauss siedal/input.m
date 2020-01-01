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
%%         1   2    3       4    5           6                7            8      9       A        B       C       D        E  
bus_spec =[1   0   1.060	1   0.00	  0.500+0.000j	 0.000+0.000j	0.500  -0.100	 0.00     1.00    0.00    0.00    1.00;
           2   1   1.045	1   0.00	  0.400+0.000j	 0.217+0.127j	0.500  -0.400 	 0.00     1.00    0.00    0.00    0.00;
           3   1   1.010	1   0.00	  0.100+0.000j	 0.942+0.190j	0.400   0.000	 0.00     1.00    0.00    0.00    0.00;
           4   2   1.000	1   0.00	  0.000+0.000j	 0.478-0.039j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000;
           5   2   1.000	1   0.00	  0.000+0.000j	 0.076+0.016j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000;
           6   1   1.070	1   0.00	  0.200+0.000j	 0.112+0.075j	0.240  -0.060	 0.00     1.00    0.00    0.00    0.00;
           7   2   1.000	1   0.00	  0.000+0.000j	 0.000+0.000j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000;
           8   1   1.090	1   0.00	  0.000+0.000j	 0.000+0.000j	0.240  -0.060	 0.00     1.00    0.00    0.00    0.00;
           9   2   1.000	1   0.00	  0.000+0.000j	 0.295+0.166j	0.000	0.000	 0.19     1.00    0.00    0.00    0.000;
           10  2   1.000	1   0.00	  0.000+0.000j	 0.090+0.058j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000;
           11  2   1.000	1   0.00	  0.000+0.000j	 0.035+0.018j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000;
           12  2   1.000	1   0.00	  0.000+0.000j	 0.061+0.016j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000;
           13  2   1.000	1   0.00	  0.000+0.000j	 0.135+0.058j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000;
           14  2   1.000	1   0.00	  0.000+0.000j	 0.149+0.050j	0.000	0.000	 0.00     1.00    0.00    0.00    0.000];
%% LINEDATA consists of 5 columns. The column wise description is as
% follows:
% 1 -- Start Bus
% 2 -- End Bus
% 3 -- Line Impedance(R + jX)
% 4 -- Line charging admittance(b_l)/2. The data should be b_l/2.
% 5 -- tap ratio
%%        1     2            3             4            5
linedata=[1     2	 0.017442+0.05917j	0.0264j	    1.000+0.000j
          1	    5	 0.05403+0.22304j	0.0246j	    1.000+0.000j
          2	    3	 0.04699+0.19797j	0.0219j	    1.000+0.000j
          2	    4	 0.063921+0.17632j	0.0170j	    1.000+0.000j
          2	    5	 0.05695+0.156492j	0.0173j	    1.000+0.000j
          3	    4	 0.06701+0.17103j	0.0064j	    1.000+0.000j
          4	    5	 0.012015+0.04211j	0.0000j	    1.000+0.000j
          4	    7	 0.00000+0.20912j	0.0000j	    0.978+0.000j
          4	    9	 0.00000+0.55618j	0.0000j	    0.969+0.000j
          5	    6	 0.00000+0.25202j	0.0000j	    0.932+0.000j
          6	    11	 0.09498+0.218790j	0.0000j	    1.000+0.000j
          6	    12	 0.135201+0.25581j	0.0000j	    1.000+0.000j
          6	    13	 0.06615+0.13027j	0.0000j	    1.000+0.000j
          7	    8	 0.00000+0.17615j	0.0000j	    1.000+0.000j
          7	    9	 0.00000+0.11001j	0.0000j	    1.000+0.000j
          9	    10	 0.03181+0.076050j	0.0000j	    1.000+0.000j
          9	    14	 0.114399+0.27038j	0.0000j	    1.000+0.000j
          10	11	 0.08205+0.211277j	0.0000j	    1.000+0.000j
          12	13	 0.22092+0.19988j	0.0000j	    1.000+0.000j
          13	14	 0.188023+0.34802j	0.0000j	    1.000+0.000j];
%% Parameters for evaluating voltage dependent Q limits is defined as 
% follows:
% I_a_max -- Maximum allowable stator current.
% X_d -- Direct axis reactance for cylindrical pole rotor. Machine resistance is neglected. 
% E_f_max and E_f_min -- Maximum and minimum excitation 
% voltage. In pu, these are same as I_f_max and I_f_min.
% del_max -- maximum allowable rotor angle.
% E_ext -- external voltage magnitude of infinite bus.
% X_ext -- external reactance.
I_a_max=1.05;
X_d=0.5;
E_f_max=1.20;
E_f_min=0.05;
del_max=82;
E_ext=1;
X_ext=0.4;
par=[I_a_max X_d E_f_max E_f_min del_max E_ext X_ext];