function rplot(x,varargin)
%RPLOT: Gives fancier plots than regular 'plot()'
%Wraps around usual 'plot()' to give a more esthetic look
%without supplying many options
% Usage:
%   rplot(x,y)
%   rplot(x,y,title)
%   rplot(x);
%   rplot(x,'title',title)

linew = 2;
switch nargin 
    case 1
        plot(x,'linewidth',linew);
    case 2
        if varargin{1} == 'all'
            hold on
            for i = 1:size(x,1)
                plot(x(i,:),'linewidth',linew)
            end
            hold off
        else
            y = varargin{1};
            plot(x,y,'linewidth',linew);
        end
    case 3
        if varargin{1} == 'title'
            plottitle = varargin{2};
            hold on
            for i = 1:size(x,1)
                plot(x(i,:),'linewidth',linew)
            end
            hold off
        else
            y = varargin{1};
            plottitle = varargin{2};
            plot(x,y,'linewidth',linew);
        end
    
    title(plottitle)
end

end

