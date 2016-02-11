%{ 
Compare the model simulation for output, working hours, equity payout and
debt repurchases to its observed counterparts as done in figure 5 in the
original paper.
%}

%% Path settings

% Add path to subaxis
addpath ../library/subaxis/

% Paths for waf
path_out_simulation = project_paths('OUT_ANALYSIS', 'baseline_simulation.mat');
path_to_data = project_paths('OUT_DATA', 'updated_data.mat');
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

% Define plot properties
FontSizeAxis = 9;
FontSizeLegend = 9;
FontSizeTitle = 16;
GraphColourData = [0.34509803921569 0.69803921568627 0.21176470588235];
GraphColourModel =[0.16862745098039 0.24313725490196 0.57254901960784];
GraphThickness = 1.5;
Margin = 0.05;
NumTicksX = 11;
NumTicksY = 10;
Spacing = 0.12;
SpacingHoriz = 0.08;


%% Create figure
figure;
set(gcf, 'visible', 'off');

%% Create plot in position 1 of a 2x2 grid
subaxis(2, 2, 1, 'Spacing', Spacing, 'Margin', Margin, ...
    'SpacingHoriz', SpacingHoriz);
plot(Estimation.Dates, Estimation.RealGdp*100, 'color', GraphColourData, ...
	'LineWidth', GraphThickness)
hold on
plot(Estimation.Dates, baseline_simul.yhat*100, 'color', GraphColourModel, ...
	'LineWidth', GraphThickness, 'LineStyle', '--');
set(gca,'box','off');

% Adjust axes.
axis tight;
set(gca, 'XLimMode', 'manual', 'XLim', [1985 2015.25]);
set(gca, 'YLimMode', 'manual', 'YLim', [-14 10]);
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(I) '; '90(IV)'; '93(IV)'; '96(IV)'; ...
    '99(IV)'; '02(IV)'; '05(IV)'; '08(IV)';'11(IV)'; '14(IV)']);
set(gca,'YTick', -14:2:10);
set(gca,'FontSize',FontSizeAxis);

% Add legend and title.
h1 = legend('Data', 'Model');
set(h1, 'fontsize', FontSizeLegend, 'Location', 'southwest');
title('GDP', 'Interpreter','latex', 'FontSize', FontSizeTitle);


%% Create plot in position 2 of a 2x2 grid
subaxis(2, 2, 2, 'Spacing', Spacing, 'Margin', Margin, ...
    'SpacingHoriz', SpacingHoriz);
plot(Estimation.Dates, Estimation.Hours*100, 'color', ...
	GraphColourData, 'LineWidth', GraphThickness)
hold on
plot(Estimation.Dates, baseline_simul.nhat*100, 'color', GraphColourModel, ...
	'LineWidth', GraphThickness, 'LineStyle', '--');
set(gca,'box','off');

% Adjust axes.
axis tight;
set(gca, 'XLimMode', 'manual', 'XLim', [1985 2015.25]);
set(gca, 'YLimMode', 'manual', 'YLim', [-14 10]);
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(I) '; '90(IV)'; '93(IV)'; '96(IV)'; ...
    '99(IV)'; '02(IV)'; '05(IV)'; '08(IV)';'11(IV)'; '14(IV)']);
set(gca,'YTick', -14:2:10);
set(gca,'FontSize',FontSizeAxis);

% Add legend and title.
h2 = legend('Data', 'Model');
set(h2, 'fontsize', FontSizeLegend, 'Location', 'southwest');
title('Hours worked', 'Interpreter','latex', 'FontSize', FontSizeTitle);


%% Create plot in position 3 of a 2x2 grid
subaxis(2, 2, 3, 'Spacing', Spacing, 'Margin', Margin, ...
    'SpacingHoriz', SpacingHoriz);
plot(Estimation.Dates, Estimation.DebtRepurchase*100, 'color', ...
	GraphColourData, 'LineWidth', GraphThickness)
hold on
plot(Estimation.Dates, baseline_simul.byhat*100, 'color', GraphColourModel, ...
	'LineWidth', GraphThickness, 'LineStyle', '--');
set(gca,'box','off');

% Adjust axes.
axis tight;
set(gca, 'XlimMode', 'manual', 'XLim', [1985 2015.25]);
set(gca, 'YLimMode', 'manual', 'YLim', [-12 15]);
L1 = get(gca,'XLim');
set(gca,'XTick',linspace(L1(1),L1(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(I) '; '90(IV)'; '93(IV)'; '96(IV)'; ...
    '99(IV)'; '02(IV)'; '05(IV)'; '08(IV)';'11(IV)'; '14(IV)']);
set(gca,'FontSize',FontSizeAxis);
L2 = get(gca,'YLim');
set(gca,'YTick',linspace(L2(1),L2(2), NumTicksY));

% Add legend and title.
h3 = legend('Data', 'Model');
set(h3, 'fontsize', FontSizeLegend, 'Location', 'southwest');
title('Debt repurchase', 'Interpreter','latex', 'FontSize', FontSizeTitle);


%% Create plot in position 4 of a 2x2 grid
subaxis(2, 2, 4, 'Spacing', Spacing, 'Margin', Margin, ...
    'SpacingHoriz', SpacingHoriz);
plot(Estimation.Dates, Estimation.EquityPayout*100, 'color', ...
	GraphColourData, 'LineWidth', GraphThickness)
hold on
plot(Estimation.Dates, detrend(baseline_simul.dyhat)*100, 'color', ...
	GraphColourModel, 'LineWidth', GraphThickness, 'LineStyle', '--');
set(gca,'box','off');

% Adjust axes.
axis tight;
set(gca, 'XlimMode', 'manual', 'XLim', [1985 2015.25]);
set(gca, 'YLimMode', 'manual', 'YLim', [-12 15]);
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(I) '; '90(IV)'; '93(IV)'; '96(IV)'; ...
    '99(IV)'; '02(IV)'; '05(IV)'; '08(IV)';'11(IV)'; '14(IV)']);
set(gca,'FontSize',FontSizeAxis);
L2 = get(gca,'YLim');
set(gca,'YTick',linspace(L2(1),L2(2), NumTicksY));

% Add legend and title.
h4 = legend('Data', 'Model');
set(h4, 'fontsize', FontSizeLegend, 'Location', 'southwest');
title('Equity payout', 'Interpreter','latex', 'FontSize', FontSizeTitle);

% Get rid of whitespace
set(gcf, 'PaperSize', [10 6.25]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 6.25]);
set(gcf, 'PaperUnits', 'inches');


%% Save graph
saveas(gcf, path_out_figure);
