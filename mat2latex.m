function s = mat2latex(matrix, name, decimals)
% 'matrix' the matrix itself
% 'name' Name of matrix
% 'decimals' number of decimal points

    s = sprintf("\\begin{equation}" + " \n" + ...
        "\t\\centering" + "\n" + ...
        "\t%s=%s" + "\n" + ...
        "\t\\label{%s}" +  "\n" + ...
        "\\end{equation}", [name, latex(vpa(sym(matrix),decimals)), name]);
    
    comment_1 = sprintf("\n%%====== Creating Matrix %s ======%%\n",name);
   
    comment_2 = sprintf("\n%%======== End of Matrix ========%%\n");
    
    s = comment_1 + s + comment_2;
end
