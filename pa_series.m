function [pha, amp] = pa_series(lo, hi, f_lo, f_hi, fs)
setpypath
[pha, amp] = py.pac.pa_series(lo, hi, f_lo, f_hi, fs);