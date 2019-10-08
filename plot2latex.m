function s = plot2latex(figureHandler, name, folder, caption, varargin)
% Input:
% figureHandler, takes the handle of the figure that should be converted to latex 
% name, is the desired name for the picture and is also the label
% folder, desired folder to save image in
% caption, caption for the figure
% Optional argumets are the fourth, an argument of 'true'
% overwrites the file 'output' containing all matrices in latex form.
% A value of false appends given matrix and if not any fourth argument
% is provided the function will not write to any file.
% 
%
% Output:
% s, the string which is copied into latex

    if nargin > 4
        reinit = varargin{1};
    end

    if ~isfolder(folder)
        mkdir(folder)
    end

    if ~ishandle(figureHandler)
        error("First argument FIGUREHANDLER must be a handle to a figure")
    elseif ~isstring(name)
        error("Second argument NAME must be a string, \'%s\' is not a string", string(name));
    elseif ~isstring(folder)
        fprintf("Third argument FOLDER must be an string, \'%s\' is not a string", string(folder));
    elseif ~isstring(caption)
        fprintf("Forth argument caption must be an string, \'%s\' is not a string", string(caption));
    elseif nargin > 4 && ~islogical(reinit)
        error("Fourth argument REINIT, if provided, must be a logical");
    end
    

    s = sprintf("\\begin{figure}[H]" + " \n" + ...
            "\t\\centering" + "\n" + ...
            "\t\\includegraphics[scale=0.6]{%s.eps}\n" + ...
            "\t\\caption{%s}" +  "\n" + ...
            "\t\\label{%s}" +  "\n" + ...
            "\\end{figure}", [name, caption, name]);

    saveas(figureHandler, folder + "/" + name, "eps");

    

    comment_1 = sprintf("\n%%====== Creating Figure %s ======%%\n",name);
    
    comment_2 = sprintf("\n%%======== End of Figure ========%%\n");
    
    s = comment_1 + s + comment_2;

    if nargin > 4 && reinit
        fprintf(fopen("output", 'w'), "%s", s);
    elseif nargin > 4 && ~reinit
        fprintf(fopen("output", 'a'), "%s", s);
    else
        return
    end
        
end
