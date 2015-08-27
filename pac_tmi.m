%PAC_TMI Calculate phase-amplitude coupling (PAC) using the modulation
%index method (see Tort, 2008)
%   pac = PAC_TMI(lo, hi, f_lo, f_hi, fs) calculates PAC between the phase of a
%   low-frequency oscillation in the time series, lo, and the amplitude of
%   a high-frequency oscillation in the time series, hi. The cutoff
%   frequencies for the low-frequecy and high-frequency bands are defined
%   in f_lo and f_hi (Hz), respectively. fs is the sampling rate (Hz).
%   Nbins defines the number of bins that are used to separate the
%   low-frequency cycle (e.g. for 20 bins, each bin spans 18 degrees).
function pac = pac_tmi(lo, hi, f_lo, f_hi, fs, Nbins)

% Set the python path
setpypath

% Convert inputs
lo = py.numpy.array(lo);
hi = py.numpy.array(hi);
f_lo = py.tuple(f_lo);
f_hi = py.tuple(f_hi);

% Call python
pac = py.pac.mi_tort(lo, hi, f_lo, f_hi, fs, Nbins);