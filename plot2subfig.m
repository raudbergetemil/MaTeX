function s = plot2subfig(figureHandler,names,name,folder, caption)
% Input:
% figureHandler is a list of figure handles of pictures to print
% names is a list of names of each figure
% name is the desired name for the group of / all pictures
% folder is the folder to put the images inte, use "" if none
% caption is a list of captions for each picture
% 
% Output:
% s, the string which is copied into latex

    if ~isfolder(folder)
        mkdir(folder)
    end
    
    n = length(figureHandler);
    if ~ n == length(names) == length(caption)
        error("figureHandler, names and caption needs to be of same length")
    end
    
    if iscell(figureHandler) | iscell(names) | iscell(caption)
        error("Use array and not cell arrays for figureHandler, names and caption")
    end
    
    names = string(names);
    name = string(name);
    folder = string(folder);
    caption = string(folder);
    
    figureHandler = figureHandler(:);
    s = "";
    
    s=sprintf("\\begin{figure}[h]");
    for i = 1:length(figureHandler)
        s = sprintf("%s\n%s", [s, fig(names(i),caption(i))]);
        saveas(figureHandler(i), folder + "/" + names(i), "png");
    end
    
    s = sprintf("%s\n\\caption{}\n\\label{%s}\n\\end{figure}\n", [s,name]);
    
    

    comment_1 = sprintf("\n%%====== Creating Figure %s ======%%\n",name);
    
    comment_2 = sprintf("%%======== End of Figure ========%%\n");
    
    s = comment_1 + s + comment_2;

    function s = fig(name, caption)
        s = sprintf("\t\\begin{subfigure}{.49\\linewidth}" + " \n" + ...
            "\t\t\\centering" + "\n" + ...
            "\t\t\\includegraphics[scale=0.5]{%s.png}" + "\n" + ...
            "\t\t\\caption{%s}" +  "\n" + ...
            "\t\t\\label{%s}" +  "\n" + ...
            "\t\\end{subfigure}", [name, caption, name]);
    end
end