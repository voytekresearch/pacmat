%% Load data
load('/Users/SP/code/pacmat/test/exampledata.mat')
data = py.numpy.array(data);
fs = 1000;

%% Test to see if PAC functions return values consistent with python

myplv = plv(data,data,py.tuple([13,30]),py.tuple([80,200]),fs);
assert(round(myplv,5) == 0.23778)

myglm = glm(data,data,py.tuple([13,30]),py.tuple([80,200]),fs);
assert(round(myglm,5) == 0.03191)

mymi_tort = mi_tort(data,data,py.tuple([13,30]),py.tuple([80,200]),fs);
assert(round(mymi_tort,5) == 0.00366)

mymi_canolty = mi_canolty(data,data,py.tuple([13,30]),py.tuple([80,200]),fs);
assert(round(mymi_canolty,5) == 1.10063)

myozkurt = ozkurt(data,data,py.tuple([13,30]),py.tuple([80,200]),fs);
assert(round(myozkurt,5) == 0.07548)
%%
%[myotc, ~, ~, ~] = otc(data,py.tuple([80,200]),4,fs,7,95,py.tuple([-.5,.5]),0.01)
%no method found???
% Try other functions

% comod = comodulogram(lo, hi, p_range, a_range, dp, da, fs, pac_method)
% [pac, tf, a_events, mod_sig] = otc(x, ...
%     f_hi, f_step, fs, w, event_prc, t_modsig, t_buffer)
% 
% [pha, amp] = pa_series(lo, hi, f_lo, f_hi, fs)
% 
% dist = pa_dist(pha, amp, Nbins)
% 
% 
% 
% assert(sum(angles) == 180)