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
           4      0
           5      0];
%% LINEDATA consists of 5 columns. The column wise description is as
% follows:
% 1 -- Start Bus
% 2 -- End Bus
% 3 -- Line Impedance(R + jX)
% 4 -- Line charging admittance(b_l)/2. The data should be b_l/2.
% 5 -- tap ratio
%%         1  2      3          4    5
linedata =[1  2  0.01937+0.05916j  0.05279j 1+0j
           1  5  0.05402+0.22300j  0.04920j 1+0j
           2  3  0.04697+0.19794j  0.04380j 1+0j
           2  4  0.05810+0.17628j  0.03740j 1+0j
           3  4  0.06700+0.17099j  0.03460j 1+0j
           4  5  0.01335+0.04209j  0.01280j 1+0j];
