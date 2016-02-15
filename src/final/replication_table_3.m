% Use output from the extended model estimation to create an update of table
% 3.

%% Path settings


%% Load results


%% Table of calibrated parameters


%% Table of estimated parameters

fid = fopen(path_out_table, 'w');
fprintf(fid,'%12.4f & %12.4f \\\\ \r\n', ar_mat(1,:));
fprintf(fid,'%12.4f & %12.4f \\\\ \r\n', ar_mat(2,:));
fclose(fid);