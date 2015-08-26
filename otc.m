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