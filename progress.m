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
%   progress(0.1, 'forceCMD', 'width', 80)
%   progress(0.4, 'forceGUI', waitbar_handler)

% if ~exist('wait')    
%     global wait;
%     wait = waitbar(0);
% end

GUI = usejava('desktop');
p = min(p,1);


width = 70;
for i = 1:nargin-1
    if ischar(varargin{i}) && strcmp(varargin{i}, 'forceGUI')
        GUI = true;
    elseif ischar(varargin{i}) && strcmp(varargin{i},'forceCMD')
        GUI = false;
    elseif ischar(varargin{i}) && strcmp(varargin{i},'width')
        width = varargin{i+1};
    end
end

if GUI
    global wait
    if isempty(wait)
        wait = waitbar(p);
    else
        waitbar(p, wait);
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