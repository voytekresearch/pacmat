%PAC_OTC Calculate phase-amplitude coupling (PAC) using the modulation
%index method (see Dvorak, 2014)
%   pac = PAC_OTC(x, f_hi, f_step, fs, w, event_prc, t_modsig, t_buffer)
%   calculates PAC within the time series x. High frequency activity events
%   are calculated for each frequency band between the limits set in f_hi
%   (Hz) and with the width set in f_step (Hz). fs is the sampling rate
%   (Hz). w is the length of the filter in terms of the number of cycles of
%   the oscillation whose frequency is the center of the bandpass filter.
%   event_prc (between 0 and 100) is the percentile threshold of the power 
%   signal of an oscillation for a high-frequency event to be declared. The
%   modulation signal is extracted in the time range defined in t_modsig
%   (seconds). t_buffer defines the minimum time (seconds) between
%   consecutive high-frequency events
function pac = pac_otc(x, f_hi, f_step, fs, w, event_prc, t_modsig, t_buffer)

% Set the python path
setpypath

% Convert inputs
xpy = py.numpy.array(x);
f_hipy = py.tuple(f_hi);
t_modsigpy = py.tuple(t_modsig);

% Call python
otcout = py.pac.otc(xpy, f_hipy, f_step, fs, w, event_prc, t_modsigpy, t_buffer);

% Separate outputs
pac = otcout{1};

%tf = otcout{2}; User can calculate this in matlab.
% Run into error in conversion: Python Error: can't convert complex to float

% a_events = otcout{3};
% Unclear how to convert this to a cell array in MATLAB

% mod_sig = otcout{4};
% mod_sig = double(py.array.array('d',py.numpy.nditer(mod_sig)));
% mod_sig = reshape(mod_sig,[Tmod,Nfreqs])';