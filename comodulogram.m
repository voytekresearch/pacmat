% Calculate PAC for many small frequency bands
% 
% Parameters
% ----------
% lo : array-like, 1d
%     The low frequency time-series to use as the phase component
% hi : array-like, 1d
%     The high frequency time-series to use as the amplitude component
% p_range : (low, high), Hz
%     The low frequency filtering range
% a_range : (low, high), Hz
%     The high frequency filtering range
% dp : float, Hz
%     Width of the low frequency filtering range for each PAC calculation
% da : float, Hz
%     Width of the high frequency filtering range for each PAC calculation
% fs : float
%     The sampling rate (default = 1000Hz)
% pac_method : string
%     Method to calculate PAC.
%     'mi_tort' - See Tort, 2008
%     'plv' - See Penny, 2008
%     'glm' - See Penny, 2008
%     'mi_canolty' - See Canolty, 2006
%     'ozkurt' - See Ozkurt & Schnitzler, 2011 
% 
% Returns
% -------
% comod : array-like, 2d
%     Matrix of phase-amplitude coupling values for each combination of the
%     phase frequency bin and the amplitude frequency bin
function comod = comodulogram(lo, hi, p_range, a_range, dp, da, fs, pac_method)

% Set the python path
setpypath

% Convert inputs
lo = py.numpy.array(lo);
hi = py.numpy.array(hi);
p_rangepy = py.tuple(p_range);
a_rangepy = py.tuple(a_range);

% need to calculate two dimensions and make sure the output makes sense
comod = py.pac.comodulogram(lo, hi, p_rangepy, a_rangepy, dp, da, fs, pac_method);

% Convert outputs
d1 = ceil((p_range(2)-p_range(1)) / dp);
d2 = ceil((a_range(2)-a_range(1)) / da);
comod = double(py.array.array('d',py.numpy.nditer(comod)));
comod = reshape(comod,[d2,d1])';