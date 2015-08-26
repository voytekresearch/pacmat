% Calculate PAC using Tort's modulation index method from prefiltered
% signals (see Tort, 2008)
% 
% Parameters
% ----------
% lo : array-like, 1d
%     The low frequency time-series to use as the phase component
% hi : array-like, 1d
%     The high frequency time-series to ue as the amplitude component
% f_lo : (low, high), Hz
%     The low frequency filtering ranges
% f_hi : (low, high), Hz
%     The low frequency filtering range
% fs : float
%     The sampling rate (default = 1000Hz)
% Nbins : int
%     Number of bins to split up the low frequency oscillation cycle
% 
% Returns
% -------
% pac : scalar
%     PAC value
function pac = mi_tort(lo, hi, f_lo, f_hi, fs)

% Set the python path
setpypath

% Convert inputs
lo = py.numpy.array(lo);
hi = py.numpy.array(hi);
f_lo = py.tuple(f_lo);
f_hi = py.tuple(f_hi);

% Call python
pac = py.pac.mi_tort(lo, hi, f_lo, f_hi, fs);