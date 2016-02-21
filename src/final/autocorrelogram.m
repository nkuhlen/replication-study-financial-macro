%{ 
Programme to create graphs of the autocorrelation in the residual series.
%}

%% Path settings

% Use these paths when compiling the entire project with waf.
path_shocks = project_paths('OUT_ANALYSIS', 'series_of_shocks.mat');
path_out_figure_tfp = project_paths('OUT_FIGURES', 'autocorrelation_tfp.png');
path_out_figure_xi = project_paths('OUT_FIGURES', 'autocorrelation_xi.png');

% Use the relative paths below to execute the script using the Matlab IDE.
% path_shocks = '../../bld/out/analysis/series_of_shocks.mat';
% path_out_figure_tfp = '../../bld/out/figures/autocorrelation_tfp.png';
% path_out_figure_xi = '../../bld/out/figures/autocorrelation_xi.png';


%% Create the figures

% Load series of shocks
load(path_shocks);

% Create plots and save them
figure;
set(gcf, 'visible', 'off');
autocorr(ResidualTFP, 15);
saveas(gcf, path_out_figure_tfp);

figure;
set(gcf, 'visible', 'off');
autocorr(ResidualXi, 15);
saveas(gcf, path_out_figure_xi);
