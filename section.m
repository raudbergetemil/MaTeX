function section(str, reinit)
    % SECTION  -
    %   ----------------------------------------------------------------------
    %   This function prints a section in latex code to an output file
    %   ----------------------------------------------------------------------
    %   The function takes a string as first input and a boolean as second.
    %   The boolean determines if the output should be appended to the output 
    %   file or if it should overwrite its content.
    %   ----------------------------------------------------------------------

    if ~isstring(str)
        error(sprintf("The first arguments has to be a string, \'%s'\ is not a string", str));
    elseif ~islogical(reinit)
        error(sprintf("The second argument must be a logical, \'%s\' is not a logical", reinit));
    end
    
    if reinit
        fprintf(fopen("output", 'w'), "\\section*{%s}", str);
    else
        fprintf(fopen("output", 'a'), "\\section*{%s}", str);
    end

    end