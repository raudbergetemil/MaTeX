function s = mat2latex(matrix, name, decimals, varargin)
% m the matrix itself
% n Name of matrix
% d number of decimal points
    s = sprintf("$$%s= %s $$", [name, latex(vpa(sym(matrix),decimals))]);
    
    comment_1 = sprintf("\n%%====== Creating Matrix %s======%%\n",name);
   
    comment_2 = sprintf("\n%%======== End of Matrix ========%%\n");
    
    s = comment_1 + s + comment_2;
end
