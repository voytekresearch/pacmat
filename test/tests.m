%% Load data
clear
clc
load('/Users/SP/code/pacmat/test/exampledata.mat')
fs = 1000;

%% Test to see if PAC functions return values consistent with python

myplv = plv(data,data,[13,30],[80,200],fs);
assert(round(myplv,5) == 0.23778)

myglm = glm(data,data,[13,30],[80,200],fs);
assert(round(myglm,5) == 0.03191)

mymi_tort = mi_tort(data,data,[13,30],[80,200],fs);
assert(round(mymi_tort,5) == 0.00366)

mymi_canolty = mi_canolty(data,data,[13,30],[80,200],fs);
assert(round(mymi_canolty,5) == 1.10063)

myozkurt = ozkurt(data,data,[13,30],[80,200],fs);
assert(round(myozkurt,5) == 0.07548)

comod = comodulogram(data, data, [10,21],[50,150], 5, 50, fs, 'mi_tort');
assert(round(comod(1,1),5) == 0.00287)

[pha, amp] = pa_series(data, data,[13,30],[80,200],fs);
assert(round(pha(1),5) == 1.57119)

dist = pa_dist(pha, amp, 10);
assert(round(dist(1),5) == 12.13961)

myotc = otc(data,[80,200],4,fs,7,95,[-.5,.5],0.01);
assert(round(myotc,5) == 220.32563)