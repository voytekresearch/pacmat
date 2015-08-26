function setpypath()
% Add pacpy to the python path
[filepath,~,~] = fileparts(mfilename('fullpath'));
P = py.sys.path;
append(P,filepath)
%Temporarily add statsmodels to pythonpath
append(P,'/Users/SP/anaconda/lib/python2.7/site-packages')