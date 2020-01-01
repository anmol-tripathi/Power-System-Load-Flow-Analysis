%% Inputfile for a 7 bus system
% All Data is in p.u. 'j' refers to imaginary operator. '_' refers to
% subsciprt. '^' refers to superscript.
%% BUS_SPEC consists of 14(Hex - E) columns. The column wise description is
% as follows:
% 1 -- Bus Number.
% 2 -- Bus Shunt Susceptance(b_sh)

%%         1        2              
bus_spec =[1      0     
           2      0
           3      0
           4      0];
%% LINEDATA consists of 5 columns. The column wise description is as
% follows:
% 1 -- Start Bus
% 2 -- End Bus
% 3 -- Line Impedance(R + jX)
% 4 -- Line charging admittance(b_l)/2. The data should be b_l/2.
% 5 -- tap ratio
%%         1  2      3          4    5
linedata =[1  2  0.000+0.2000j  0.000j 1+0j
           2  3  0+0.15j          0j  1+0j
           3  4  0+0.4j          0j  1+0j
           4  2  0+0.3j          0j  1+0j
           1  3  0+0.25j         0j    1+0j];
