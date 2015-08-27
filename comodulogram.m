%COMODULOGRAM Calculate PAC between many frequency band combinations
%   comod = comodulogram(lo, hi, p_range, a_range, dp, da, fs, pac_method)
%   returns the comodulogram matrix for which the rows span the phase
%   frequencies and the columns span the amplitude frequencies. The phase
%   is obtained from the time series, lo, from each non-overlapping
%   frequency bin in p_range of width dp. Similarly, the amplitude is
%   obtained from the time series, hi, from each non-overlapping frequency
%   bin in a_range of width da. fs is the samping rate (Hz). pac_method is
%   a string the defines the PAC metric used as one of the following:
%     'mi_tort' - See Tort, 2008
%     'plv' - See Penny, 2008
%     'glm' - See Penny, 2008
%     'mi_canolty' - See Canolty, 2006
%     'ozkurt' - See Ozkurt & Schnitzler, 2011 
function comod = comodulogram(lo, hi, p_range, a_range, dp, da, fs, pac_method)

    % Set the python path
    setpypath

    % Convert inputs from MATLAB to Python variables
    lo = py.numpy.array(lo);
    hi = py.numpy.array(hi);
    p_rangepy = py.tuple(p_range);
    a_rangepy = py.tuple(a_range);

    % need to calculate two dimensions and make sure the output makes sense
    comod = py.pac.comodulogram(lo, hi, p_rangepy, a_rangepy, dp, da, fs, pac_method);

    % Convert outputs from Python to MATLAB variables
    d1 = ceil((p_range(2)-p_range(1)) / dp);
    d2 = ceil((a_range(2)-a_range(1)) / da);
    comod = double(py.array.array('d',py.numpy.nditer(comod)));
    comod = reshape(comod,[d2,d1])';
end