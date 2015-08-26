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