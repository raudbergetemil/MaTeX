function progress(p, varargin)
%PROGRESS -
%   ----------------------------------------------------------------------
%   This function displays a progress bar provided a percentage. It checks
%   wheter the user used -desktop or -nodesktop and uses that as basis for
%   GUI or not. To override this, provide the function with -forceGUI or
%   -forceCMD depending on wanted result. When using GUI, provide the 
%   figurehandle of a waitbar When using CMD provide the
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
%   progress(0.4, 'forceGUI', waitbar_handler)

GUI = usejava('desktop');
wait = [];
width = 70;
for i = 1:nargin-1
    if varargin{i} == "forceGUI"
        GUI = true;
        wait = varargin{i+1};
    elseif varargin{i} == "forceCMD"
        GUI = false;
    elseif varargin{i} == "-width"
        width = varargin{i+1};
    end
end

if GUI
    waitbar(p, wait);
else
    barLen  = round(width*p);
    space   = round(width*(1-p));
    fprintf("\033[A")
    fprintf("\033[2K")
    bar = ['|', char(kron('=', ones(1, barLen))), '>', char(kron(' ', ones(1, space))), '|', char(string(p*100)), '%%\n'];
    fprintf(bar)
end
end