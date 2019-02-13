function template(fun)
%EXAMPLE - A reference function -
%   ----------------------------------------------------------------------
%   This function outputs a template function call of specified function
%   ----------------------------------------------------------------------
%   It takes the character array of the name of an funtion and outputs the
%   text on line two of the function script which soppusedly holds the
%   template for that function
%   ----------------------------------------------------------------------

if ~ (fun(end-1:end) == '.m')
    fun = [fun,'.m'];
end
content = textscan(fopen(fun), '%s', 'Delimiter', '\n');
content = content{1};

temp = char(content(1));
temp = temp(10:end);
disp(temp);
end