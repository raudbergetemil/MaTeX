function section(str, reinit)
    % SECTION  -
    %   ----------------------------------------------------------------------
    %   This function prints a section in latex code to an output file
    %   ----------------------------------------------------------------------
    %   The function takes a string as first input and a boolean as second.
    %   The boolean determines if the output should be appended to the output 
    %   file or if it should overwrite its content.
    %   ----------------------------------------------------------------------

    if ~islogical(reinit)
        error("The second argument must be a logical, \'%s\' is not a logical", reinit);
    end
    
    str = string(str);
    if reinit
        fprintf(fopen("output.tex", 'w'), "\\section*{%s}", str);
    else
        fprintf(fopen("output.tex", 'a'), "\\section*{%s}", str);
    end

    end