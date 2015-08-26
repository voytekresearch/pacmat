function setpypath()
% Add pacpy to the python path
[filepath,~,~] = fileparts(mfilename('fullpath'));
[filepath2,~,~] = fileparts(filepath);
P = py.sys.path;
if count(P,filepath) == 0
    insert(P,int32(0),filepath);
end
if count(P,filepath2) == 0
    insert(P,int32(0),filepath2);
end
%Temporarily add statsmodels to pythonpath
if count(P,'/Users/SP/anaconda/lib/python2.7/site-packages') == 0
    insert(P,int32(0),'/Users/SP/anaconda/lib/python2.7/site-packages');
end