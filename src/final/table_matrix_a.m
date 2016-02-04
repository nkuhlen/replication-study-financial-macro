%{
Create table for matrix A. 
%}

%Load data
load(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'));


fid = fopen(project_paths('OUT_TABLES', 'table_matrix_a.txt')','w');
fprintf(fid,'%12.4f & %12.4f \\\\  \r\n', ARmx(1,:));
fprintf(fid,'%12.4f & %12.4f \\\\  \r\n', ARmx(2,:));
fclose(fid);