% Compare the model simulation for output, working hours, equity payout and
% debt repurchases to its observed counterparts as done in figure 5 in the
% original paper.

%% Path settings

% Paths for waf
path_out_simulation = project_paths('OUT_ANALYSIS', 'baseline_simulation.mat');
path_to_data = project_paths('OUT_DATA', 'dataset.mat');
path_out_figure = project_paths('OUT_FIGURES', 'figure5.pdf');

% Path for matlab IDE
% path_out_simulation = '../../bld/out/analysis/baseline_simulation.mat';
% path_to_data = '../../bld/out/data/dataset.mat';
% path_out_figure = '../../bld/out/figures/figure5.pdf';

%% Load and define data

% Read in the simulated series
load(path_out_simulation)

% Read in observed data from data management
load(path_to_data)

timeline = timeline.estimation_sample(2:end);
gdp_data = total_output.log_diff(2:end);
hours_data = working_hours.log_diff(2:end);
debt_data = debt_repurchase.detrended(2:end) ./ 100;
equity_data = equity_payout.detrended(2:end) ./ 100;

%% Plot comparison graphs
% Plot
figure;
set(gcf, 'visible', 'off');
    subplot(2, 2, 1)
    plot(timeline, gdp_data, 'color', [0 0.6 0])
    hold on
    plot(timeline, baseline_simul.yhat, '--b');
    set(gca, 'XLimMode', 'manual', 'XLim', [1985 2015.25]);
    set(gca, 'YLimMode', 'manual', 'YLim', [-0.14 0.08]);
    h1 = legend('Data', 'Model');
    % h1.Location = 'southwest';
    set(h1, 'fontsize', 4, 'Location', 'southwest');
    title('GDP');
    
    subplot(2, 2, 2)
    plot(timeline, hours_data, 'color', [0 0.6 0])
    hold on
    plot(timeline, baseline_simul.nhat, '--b')
    set(gca, 'XLimMode', 'manual', 'XLim', [1985 2015.25]);
    set(gca, 'YLimMode', 'manual', 'YLim', [-0.14 0.08]);
    h2 = legend('Data', 'Model');
    set(h2, 'fontsize', 4, 'Location', 'southwest');
    title('Hours worked');
    
    subplot(2, 2, 3)
    plot(timeline, debt_data, 'color', [0 0.6 0])
    hold on
    plot(timeline, baseline_simul.byhat, '--b')
    set(gca, 'XlimMode', 'manual', 'XLim', [1985 2015.25]);
    set(gca, 'YLimMode', 'manual', 'YLim', [-0.12 0.15]);
    h3 = legend('Data', 'Model');
    set(h3, 'fontsize', 4, 'Location', 'southwest');
    title('Debt repurchase');
    
    subplot(2, 2, 4)
    plot(timeline, equity_data, 'color', [0 0.6 0])
    hold on
    plot(timeline, detrend(baseline_simul.dyhat), '--b')
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
