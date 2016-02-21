%{ 
Programme to create graphs of the autocorrelation in the shock series.
%}

%% Path settings

% Use these paths when compiling the entire project with waf.
path_shocks = project_paths('OUT_ANALYSIS', 'series_of_shocks.mat');
path_out_figure_tfp = project_paths('OUT_FIGURES', 'autocorrelation_tfp.pdf');
path_out_figure_xi = project_paths('OUT_FIGURES', 'autocorrelation_xi.pdf');

% Use the relative paths below to execute the script using the Matlab IDE.
% path_shocks = '../../bld/out/analysis/series_of_shocks.mat';
% path_out_figure_tfp = '../../bld/out/figures/autocorrelation_tfp.png';
% path_out_figure_xi = '../../bld/out/figures/autocorrelation_xi.png';

%% Load series of shocks
load(path_shocks);

%% Create plots

% Define plot properties
FontSizeAxis = 21;

% Create aurocorrelogram for tfp shock series
figure;
set(gcf, 'visible', 'off');
autocorr(ResidualTFP, 15);
set(gca,'FontSize',FontSizeAxis);

% Get rid of whitespace
set(gcf, 'PaperSize', [10 6.25]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 6.25]);
set(gcf, 'PaperUnits', 'inches');

% Save plot as pdf
saveas(gcf, path_out_figure_tfp);


% Create aurocorrelogram for financial shock series
figure;
set(gcf, 'visible', 'off');
autocorr(ResidualXi, 15);
set(gca,'FontSize',FontSizeAxis);

% Get rid of whitespace
set(gcf, 'PaperSize', [10 6.25]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 6.25]);
set(gcf, 'PaperUnits', 'inches');

% Save plot as pdf
saveas(gcf, path_out_figure_xi);
