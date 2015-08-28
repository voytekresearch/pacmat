%PA_DIST Calculate distribution of amplitude over a cycle of phases
%   dist = PA_DIST(pha, amp, Nbins) returns the distribution of mean
%   amplitude across a cycle. The phase time series, pha, is binned into
%   Nbins of equal size. The mean value in the amplitude time series, amp,
%   is then calculated for each bin. The boundaries of the phase bins are
%   given by linspace(-pi, pi, Nbins+1).
function dist = pa_dist(pha, amp, Nbins)

    % Convert inputs
    pha = py.numpy.array(pha);
    amp = py.numpy.array(amp);

    % Call python
    dist = py.pacpy.pac.pa_dist(pha, amp, Nbins);

    % Convert outputs
    dist = double(py.array.array('d',py.numpy.nditer(dist)));
end