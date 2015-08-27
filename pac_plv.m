%PAC_PLV Calculate phase-amplitude coupling (PAC) using the phase-locking 
% value (PLV) method (see Penny, 2008)
%   pac = PAC_PLV(lo, hi, f_lo, f_hi, fs) calculates PAC between the phase of a
%   low-frequency oscillation in the time series, lo, and the amplitude of
%   a high-frequency oscillation in the time series, hi. The cutoff
%   frequencies for the low-frequecy and high-frequency bands are defined
%   in f_lo and f_hi (Hz), respectively. fs is the sampling rate (Hz).
function pac = pac_plv(lo, hi, f_lo, f_hi, fs)

% Set the python path
setpypath

% Convert inputs
lo = py.numpy.array(lo);
hi = py.numpy.array(hi);
f_lo = py.tuple(f_lo);
f_hi = py.tuple(f_hi);

% Call python
pac = py.pac.plv(lo, hi, f_lo, f_hi, fs);