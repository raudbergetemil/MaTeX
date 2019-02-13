function s = mat2latex(matrix, name, decimals)
% MAT2LATEX  -
%   ----------------------------------------------------------------------
%   This function outputs a string that is latex friendly
%   ----------------------------------------------------------------------
%   It takes an arbitrary matrix (MATRIX), a desired name (NAME) and the
%   number of decimals (DECIMAL) the entries in the matrix should 
%   be rounded to.
%   ----------------------------------------------------------------------
    
    name = string(name);
    s = sprintf("\\begin{equation}" + " \n" + ...
        "\t\\centering" + "\n" + ...
        "\t%s=%s" + "\n" + ...
        "\t\\label{%s}" +  "\n" + ...
        "\\end{equation}", [name, latex(vpa(sym(matrix), decimals)), name]);
    
    comment_1 = sprintf("\n%%====== Creating Matrix %s ======%%\n",name);
   
    comment_2 = sprintf("\n%%======== End of Matrix ========%%\n");
    
    s = comment_1 + s + comment_2;
end
