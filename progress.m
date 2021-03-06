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
%   width [value]  (Used for CMD to determine width of progressbar)
%   title [value]  (Adds a title to the bar, both GUI and CMD)
%   ----------------------------------------------------------------------
%   example use:
%   progress(0.5)
%   progress(0.1, 'forceCMD', 'width', 80)
%   progress(0.4, 'forceGUI')


GUI = usejava('desktop');
p = min(p,1);
title = sprintf("Doing some loading for %s",  char(java.lang.System.getProperty('user.name')));


width = 70;
for i = 1:nargin-1
    if ischar(varargin{i}) && strcmp(varargin{i}, 'forceGUI')
        GUI = true;
    elseif ischar(varargin{i}) && strcmp(varargin{i},'forceCMD')
        GUI = false;
    elseif ischar(varargin{i}) && strcmp(varargin{i},'width')
        width = varargin{i+1};
    elseif ischar(varargin{i}) && strcmp(varargin{i},'title')
        title = varargin{i+1};
    end
end

if GUI
    global wait
    if isempty(wait) || ~isvalid(wait)
        wait = waitbar(p, title);
    else
        waitbar(p, wait, title);
    end
    if p>=1
        close(wait)
    end
else
    barLen  = round(width*p);
    space   = round(width*(1-p));
    fprintf("\033[A")
    fprintf("\033[2K")
    bar = ['|', char(kron('=', ones(1, barLen))), '>', char(kron(' ', ones(1, space))), '|', char(string(round(p*100,1))), '%%\n'];
    fprintf(bar)
end
end