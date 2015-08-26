% Calculate distribution of amplitude over a cycle of phases
% 
% Parameters
% ----------
% pha : array
%     Phase time series
% amp : array
%     Amplitude time series
% Nbins : int
%     Number of phase bins in the distribution,
%     uniformly distributed between -pi and pi.
% 
% Returns
% -------
% dist : array
%     Average
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