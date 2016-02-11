% Compare the model simulation for output, working hours, equity payout and
% debt repurchases to its observed counterparts as done in figure 5 in the
% original paper.

%% Path settings

% Add path to subaxis
addpath ../library/subaxis/

% Paths for waf
path_out_simulation = project_paths('OUT_ANALYSIS', 'baseline_simulation.mat');
path_to_data = project_paths('OUT_DATA', 'estimation_sample.mat');
path_out_figure = project_paths('OUT_FIGURES', 'figure_5.pdf');

% Path for matlab IDE
% path_out_simulation = '../../bld/out/analysis/baseline_simulation.mat';
% path_to_data = '../../bld/out/data/estimation_sample.mat';
% path_out_figure = '../../bld/out/figures/figure_5.pdf';

%% Load and define data

% Read in the simulated series
load(path_out_simulation)

% Read in observed data from data management
load(path_to_data)

%% Plot comparison graphs
% Plot
figure;
set(gcf, 'visible', 'off');
    subaxis(2, 2, 1, 'Spacing', 0.08);
    plot(DatesEstimation, RealGdpLogDiff, 'color', [0 0.6 0])
    hold on
    plot(DatesEstimation, baseline_simul.yhat, '--b');
    axis tight;
    set(gca, 'XLimMode', 'manual', 'XLim', [1985 2015.25]);
    set(gca, 'YLimMode', 'manual', 'YLim', [-0.14 0.08]);
    h1 = legend('Data', 'Model');
    set(h1, 'fontsize', 4, 'Location', 'southwest');
    title('GDP');
    
    subaxis(2, 2, 2, 'Spacing', 0.08);
    plot(DatesEstimation, HoursEstimation, 'color', [0 0.6 0])
    hold on
    plot(DatesEstimation, baseline_simul.nhat, '--b')
    axis tight;
    set(gca, 'XLimMode', 'manual', 'XLim', [1985 2015.25]);
    set(gca, 'YLimMode', 'manual', 'YLim', [-0.14 0.08]);
    h2 = legend('Data', 'Model');
    set(h2, 'fontsize', 4, 'Location', 'southwest');
    title('Hours worked');
    
    subaxis(2, 2, 3, 'Spacing', 0.08);
    plot(DatesEstimation, DebtRepurchaseDetrended, 'color', [0 0.6 0])
    hold on
    plot(DatesEstimation, baseline_simul.byhat, '--b')
    axis tight;
    set(gca, 'XlimMode', 'manual', 'XLim', [1985 2015.25]);
    set(gca, 'YLimMode', 'manual', 'YLim', [-0.12 0.15]);
    h3 = legend('Data', 'Model');
    set(h3, 'fontsize', 4, 'Location', 'southwest');
    title('Debt repurchase');
    
    subaxis(2, 2, 4, 'Spacing', 0.08);
    plot(DatesEstimation, EquityPayoutDetrended, 'color', [0 0.6 0])
    hold on
    plot(DatesEstimation, detrend(baseline_simul.dyhat), '--b')
    axis tight;
    set(gca, 'XlimMode', 'manual', 'XLim', [1985 2015.25]);
    set(gca, 'YLimMode', 'manual', 'YLim', [-0.12 0.15]);
    h4 = legend('Data', 'Model');
    set(h4, 'fontsize', 4, 'Location', 'southwest');
    title('Equity payout');
  
    % Get rid of whitespace
    set(gcf, 'PaperSize', [10 6.25]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperPosition', [0 0 10 6.25]);
    set(gcf, 'PaperUnits', 'inches');
    

%% Save graph
saveas(gcf, path_out_figure);
