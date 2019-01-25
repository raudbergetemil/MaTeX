function s = plot2subfig(figureHandler,names,name,folder, caption)
% Input:
% figureHandler takes the handle of the figure that should be converted to latex
% folder 
% name is the desired name for the picture and is also the label
% caption is pretty clear
% 
% Output:
% s, the string which is copied into latex

    if ~isfolder(folder)
        mkdir(folder)
    end
    
    figureHandler = figureHandler(:);
    s = "";
    
    s=sprintf("\\begin{figure}[h]");
    for i = 1:length(figureHandler)
        s = sprintf("%s\n%s", [s, fig(names(i),caption(i))]);
        saveas(figureHandler(i), folder + "/" + names(i), "png");
    end
    
    s = sprintf("%s\n\caption{}\n\\label{%s}\n\\end{figure}\n", [s,name]);
    
    

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