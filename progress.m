function progress(p, varargin)
%PROGRESS -
%   ----------------------------------------------------------------------
%   This function displays a progress bar provided a percentage. It checks
%   wheter the user used -desktop or -nodesktop and uses that as basis for
%   GUI or not. To override this, provide the function with -forceGUI or
%   -forceCMD depending on wanted result. When using CMD provide the
%   function with a width if not standard works for the current size of
%   terminal.
%
%   Do not print anything else while using the CMD version of the function
%   ----------------------------------------------------------------------
%   INPUT:
%   p
%   OPTIONAL:
%   forceGUI or forceCMD
%   -width [value]  (Used for CMD to determine width of progressbar)
%   ----------------------------------------------------------------------
%   example use:
%   progress(0.5)
%   progress(0.1, 'forceCMD', -width, 80)
%   progress(0.4, 'forceGUI')

GUI = usejava('desktop');
width = 70;
for i = 1:nargin
    if string(varargin{i}) == "forceGUI"
        GUI = true;
    elseif string(varargin{i}) == "forceCMD"
        GUI = false;
    elseif string(varargin{i}) == "-width"
        width = cell2mat(varargin{i+1});
    end
end

if GUI
    waitbar(p, 'Progress')
else
    barLen  = round(width*p);
    space   = round(width*(1-p));
    bar = ['|', char(kron('=', ones(1, barLen))), '>', char(kron(' ', ones(1, space))), '|', char(string(p*100)), '%%\n'];
    clc;
    fprintf(bar)
end
end