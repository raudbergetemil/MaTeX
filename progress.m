function progress(p, width)
%PROGRESS -
%   ----------------------------------------------------------------------
%   This function displays a progress bar provided a percentage.
%   Do not print anything else while using this function.
%   ----------------------------------------------------------------------
%   INPUT:
%   P in percent
%   ----------------------------------------------------------------------

barLen  = round(width*p);
space   = round(width*(1-p));
bar = ['|', char(kron('=', ones(1, barLen))), '>', char(kron(' ', ones(1, space))), '|', char(string(p*100)), '%%\n'];
clc;
fprintf(bar)

end