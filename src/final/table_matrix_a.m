%{
Programme to update matrix A in Jermann and Quadrini (2012). 
%}

%Load data
load(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'));

% Create table
fid = fopen(project_paths('OUT_TABLES', 'table_matrix_a.txt')','w');
fprintf(fid,'%12.4f & %12.4f \\\\  \r\n', ARmx(1,:));
fprintf(fid,'%12.4f & %12.4f \\\\  \r\n', ARmx(2,:));
fclose(fid);
