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