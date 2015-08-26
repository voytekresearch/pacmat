% Calculate the oscillation-triggered coupling measure of phase-amplitude
% coupling from Dvorak, 2014.
% 
% Parameters
% ----------
% x : array-like, 1d
%     The time series
% f_hi : (low, high), Hz
%     The low frequency filtering range
% f_step : float, Hz
%     The width of each frequency bin in the time-frequency representation
% fs : float
%     Sampling rate
% w : float
%     Length of the filter in terms of the number of cycles of the
%     oscillation whose frequency is the center of the bandpass filter
% event_prc : float (in range 0-100)
%     The percentile threshold of the power signal of an oscillation
%     for an event to be declared
% t_modsig : (min, max)
%     Time (seconds) around an event to extract to define the modulation
%     signal
% t_buffer : float
%     Minimum time (seconds) in between high frequency events
% 
% Returns
% -------
% pac : float
%     phase-amplitude coupling value
function pac = otc(x, f_hi, f_step, fs, w, event_prc, t_modsig, t_buffer)

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