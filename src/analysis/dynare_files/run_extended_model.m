% Run the extended model

%% Path settings

% This path for waf...
% path_to_data = project_paths('OUT_DATA', 'estimation_data.mat');

% ... and this for matlab
path_to_data = '../../../bld/out/data/estimation_data.mat';

%% Copy dataset

% Copy the data created in the data management section to the same directory
% as the dynare model file. 
copyfile(path_to_data, 'estimation_data.mat');

%% Run dynare file
dynare extended_model.mod

% Create Trace plots and autocorrelogram for convergence diagnostics
options_.trace_plot_ma = 300000;
trace_plot(options_,M_,estim_params_,'StructuralShock',1,'eps_z');
trace_plot(options_,M_,estim_params_,'StructuralShock',1,'eps_xi');

mh_autocorrelation_function(options_,M_,estim_params_, 'StructuralShock',1, ...
                            'eps_z');
mh_autocorrelation_function(options_,M_,estim_params_, 'StructuralShock',1, ...
                            'eps_xi');

%% Move desired output

% The output path settings have to be defined after the dynare command,
% otherwise matlab will throw an error at this point.
output_path = project_paths('OUT_ANALYSIS');
dynare_figure = project_paths('DYNARE_FILES', 'extended_model/graphs/');
figure_output = project_paths('OUT_FIGURES');

% output_path = '../../../bld/out/analysis/';
% dynare_figure = 'extended_model/graphs/';
% figure_output = '../../../bld/out/figures/';

if ~exist(output_path, 'dir')
    mkdir(output_path)
end

if ~exist(figure_output, 'dir')
    mkdir(figure_output)
end

copyfile('extended_model_results.mat', output_path)
copyfile(strcat(dynare_figure, 'TracePlot_SE_eps_xi.eps'), figure_output)
copyfile(strcat(dynare_figure, 'TracePlot_SE_eps_z.eps'), figure_output)
copyfile(strcat(dynare_figure, 'MH_Autocorrelation_SE_eps_xi.eps'), ...
         figure_output)
copyfile(strcat(dynare_figure, 'MH_Autocorrelation_SE_eps_z.eps'), ...
         figure_output)
