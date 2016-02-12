% Run the extended model

%% Path settings

% This path for waf...
path_to_data = project_paths('OUT_DATA', 'estimation_data.mat');

% ... and this for matlab
% path_to_data = '../../../bld/out/data/estimation_data.mat';

%% Copy dataset

% Copy the data created in the data management section to the same directory
% as the dynare model file. 
copyfile(path_to_data, 'estimation_data.mat');

%% Run dynare file
dynare extended_model.mod

%% Move desired output
