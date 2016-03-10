%% Load data
clear
clc
load('C:/gh/bv/pacmat/test/exampledata.mat')
fs = 1000;

%% Test to see if PAC functions return values consistent with python

% Set tolerance level
a_tol = 0.00001;

plvval = pac_plv(data,data,[13,30],[80,200],fs);
assert(abs(plvval - 0.25114) < a_tol)

glmval = pac_glm(data,data,[13,30],[80,200],fs);
assert(abs(glmval - 0.03243) < a_tol)

tmival = pac_tmi(data,data,[13,30],[80,200],fs,20);
assert(abs(tmival - 0.00363) < a_tol)

cmival = pac_cmi(data,data,[13,30],[80,200],fs);
assert(abs(cmival - 22.08946) < a_tol)

ozkurtval = pac_ozkurt(data,data,[13,30],[80,200],fs);
assert(abs(ozkurtval - 0.07658) < a_tol)

otcval = pac_otc(data,[80,200],4,fs,3,95,[-.5,.5],0.01);
assert(abs(otcval - 235.02888) < a_tol)

comod = comodulogram(data, data, [10,21],[50,150], 5, 50, fs, 'mi_tort');
assert(abs(comod(1,1) - 0.00315) < a_tol)

[pha, amp] = pa_series(data, data,[13,30],[80,200],fs);
assert(abs(pha(1) + 1.83601) < a_tol)

[bins, dist] = pa_dist(pha, amp, 10);
assert(abs(dist(1) - 9.90227) < a_tol)