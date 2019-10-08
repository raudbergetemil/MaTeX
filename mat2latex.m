function s = mat2latex(matrix, name, decimals, varargin)
% MAT2LATEX  -
%   ----------------------------------------------------------------------
%   This function outputs a string that is latex friendly
%   ----------------------------------------------------------------------
%   It takes an arbitrary matrix (MATRIX), a desired name (NAME) and the
%   number of decimals (DECIMALS) the entries in the matrix should 
%   be rounded to. Optional argumets are the fourth, an argument of 'true'
%   overwrites the file 'output' containing all matrices in latex form.
%   A value of false appends given matrix and if not any fourth argument
%   is provided the function will not write to any file.
%   ----------------------------------------------------------------------
    if nargin > 3
        reinit = varargin{1};
    end

    if ~isstring(name)
        error("Second argument NAME must be a string, \'%s\' is not a string", string(name));
    elseif isfloat(decimals)
        if int32(decimals) ~= decimals
            decimals = int32(decimals);
            fprintf("Third argument DECIMALS must be an integer, Using %.2f instead", int32(decimals));
        end
    elseif ~isfloat(decimals)
        error("Third argument DECIMALS must be an integer, \'%s\' is not an integer", string(decimals));
    elseif nargin > 3 && ~islogical(reinit)
        error("Fourth argument REINIT, if provided, must be a logical");
    end
    name = string(name);
    s = sprintf("\\begin{equation}" + " \n" + ...
        "\t\\centering" + "\n" + ...
        "\t%s=%s" + "\n" + ...
        "\t\\label{%s}" +  "\n" + ...
        "\\end{equation}", [name, latex(vpa(sym(matrix), decimals)), erase(name, "\")]);
    
    comment_1 = sprintf("\n%%====== Creating Matrix %s ======%%\n",name);
   
    comment_2 = sprintf("\n%%======== End of Matrix ========%%\n");
    
    s = comment_1 + s + comment_2;

    if nargin > 3 && reinit
        fprintf(fopen("output.tex", 'w'), "%s", s);
    elseif nargin > 3 && ~reinit
        fprintf(fopen("output.tex", 'a'), "%s", s);
    else
        return
    end
end
