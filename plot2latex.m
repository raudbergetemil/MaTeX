function s = plot2latex(figureHandler, name,folder, caption)
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
    

    s = sprintf("\\begin{figure}[h]" + " \n" + ...
            "\t\\centering" + "\n" + ...
            "\t\\includegraphics[scale=0.5]{%s.png}\n" + ...
            "\t\\caption{%s}" +  "\n" + ...
            "\t\\label{%s}" +  "\n" + ...
            "\\end{figure}", [name, caption, name]);

    saveas(figureHandler, folder + "/" + name, "png");

    

    comment_1 = sprintf("\n%%====== Creating Figure %s ======%%\n",name);
    
    comment_2 = sprintf("\n%%======== End of Figure ========%%\n");
    
    s = comment_1 + s + comment_2;

        
end