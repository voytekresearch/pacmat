function dist = pa_dist(pha, amp, Nbins)

% Set the python path
setpypath

% Convert inputs
pha = py.numpy.array(pha);
amp = py.numpy.array(amp);

% Call python
dist = py.pac.pa_dist(pha, amp, Nbins);

% Convert outputs
dist = double(py.array.array('d',py.numpy.nditer(dist)));