% Calculate the phase and amplitude time series
% 
% Parameters
% ----------
% lo : array-like, 1d
%     The low frequency time-series to use as the phase component
% hi : array-like, 1d
%     The high frequency time-series to use as the amplitude component
% f_lo : (low, high), Hz
%     The low frequency filtering range
% f_hi : (low, high), Hz
%     The low frequency filtering range
% fs : float
%     The sampling rate (default = 1000Hz)
% 
% Returns
% -------
% pha : array-like, 1d
%     Time series of phase
% amp : array-like, 1d
%     Time series of amplitude
function [pha, amp] = pa_series(lo, hi, f_lo, f_hi, fs)

% Set the python path
setpypath

% Convert inputs
lo = py.numpy.array(lo);
hi = py.numpy.array(hi);
f_lo = py.tuple(f_lo);
f_hi = py.tuple(f_hi);

% Call python
phaamp = py.pac.pa_series(lo, hi, f_lo, f_hi, fs);
pha = double(py.array.array('d',py.numpy.nditer(phaamp{1})));
amp = double(py.array.array('d',py.numpy.nditer(phaamp{2})));