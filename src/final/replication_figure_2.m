%{ 
Programme to create the panels in the first two columns of figure 2 in Jermann
and Quadrini (2012).
%}

%% Path settings

% Add path to subaxis
addpath ../library/subaxis/

% Use these paths when compiling the entire project with waf.
path_shocks = project_paths('OUT_ANALYSIS', 'series_of_shocks.mat');
path_out_figure = project_paths('OUT_FIGURES', 'figure_2.pdf');

% Use the relative paths below to execute the script using the Matlab IDE.
% path_shocks = '../../bld/out/analysis/series_of_shocks.mat';
% path_out_figure = '../../out/figures/figure_2.pdf';

%%Load data to create figure 2
load(path_shocks);

%% Define plot properties
FontSizeAxis = 11;
FontSizeTitle = 16;
GraphColour = [0.16862745098039 0.24313725490196 0.57254901960784];
GraphThickness = 1.7;
NumTicksX = 11;
Spacing = 0.12;
Margin = 0.05;
SpacingHoriz = 0.08;

%% Create figure
figure
set(gcf, 'visible', 'off')

% Create plot in position 1 of a 2x2 grid
subaxis(2,2,1, 'Spacing', Spacing, 'Margin', Margin, 'SpacingHoriz', SpacingHoriz);
plot(TFPSeqa(5:end)*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-8 8]);
L1 = get(gca,'XLim');
set(gca,'XTick',linspace(L1(1),L1(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);
set(gca,'FontSize',FontSizeAxis);
title('Level of productivity, z', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle);

% Create plot in position 2 of a 2x2 grid
subaxis(2,2,2, 'Spacing', Spacing, 'Margin', Margin, 'SpacingHoriz', SpacingHoriz);
plot(xiSeqa(5:end)*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-8 8]);
L1 = get(gca,'XLim');
set(gca,'XTick',linspace(L1(1),L1(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);
set(gca,'FontSize',FontSizeAxis);
title('Level of financial conditions, $\xi$', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle);

% Create plot in position 3 of a 2x2 grid
subaxis(2,2,3, 'Spacing', Spacing, 'Margin', Margin, 'SpacingHoriz', SpacingHoriz);
plot(ResidualTFP(4:end)*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-3 3]);
L1 = get(gca,'XLim');
set(gca,'XTick',linspace(L1(1),L1(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);
set(gca,'FontSize',FontSizeAxis);
title('Innovations to productivity,  ${\epsilon}_{z}$', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle);

% Create plot in position 4 of a 2x2 grid
subaxis(2,2,4, 'Spacing', Spacing, 'Margin', Margin, 'SpacingHoriz', SpacingHoriz);
plot(ResidualXi(4:end)*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-3 3]);
L1 = get(gca,'XLim');
set(gca,'XTick',linspace(L1(1),L1(2),NumTicksX));
set(gca,'XMinorTick','on');
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);
set(gca,'FontSize',FontSizeAxis);
title('Innovations to financial conditions,  ${\epsilon}_{\xi}$', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle);

% Get rid of whitespace
set(gcf, 'PaperSize', [10 6.25]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 6.25]);
set(gcf, 'PaperUnits', 'inches');

%% Save figure as pdf
saveas(gcf, path_out_figure);