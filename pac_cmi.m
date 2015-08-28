%PAC_CMI Calculate phase-amplitude coupling (PAC) using the modulation
%index method (see Canolty, 2006)
%   pac = PAC_CMI(lo, hi, f_lo, f_hi, fs) calculates PAC between the phase of a
%   low-frequency oscillation in the time series, lo, and the amplitude of
%   a high-frequency oscillation in the time series, hi. The cutoff
%   frequencies for the low-frequecy and high-frequency bands are defined
%   in f_lo and f_hi (Hz), respectively. fs is the sampling rate (Hz).
function pac = pac_cmi(lo, hi, f_lo, f_hi, fs)

    % Convert inputs
    lo = py.numpy.array(lo);
    hi = py.numpy.array(hi);
    f_lo = py.tuple(f_lo);
    f_hi = py.tuple(f_hi);

    % Call python
    pac = py.pacpy.pac.mi_canolty(lo, hi, f_lo, f_hi, fs);
end