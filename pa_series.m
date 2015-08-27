%PA_SERIES Calculate the phase and amplitude time serieses
%   [pha, amp] = PA_SERIES(lo, hi, f_lo, f_hi, fs) calculates the phase
%   time series of the low frequeny oscillation with cutoff frequencies,
%   f_lo, from the time series, lo. It also calculates the amplitude time
%   series of the high frequency oscillation with cutoff frequencies, f_hi,
%   from the time series, hi. fs is the sampling rate (Hz).
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

% Convert outputs to MATLAB variables
pha = double(py.array.array('d',py.numpy.nditer(phaamp{1})));
amp = double(py.array.array('d',py.numpy.nditer(phaamp{2})));