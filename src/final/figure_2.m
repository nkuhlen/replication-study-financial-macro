%{ 
Programme to create the panels in the first two columns of figure 2 
in Jermann Quadrini (2012).
%}

clear all;
close all;

% Add path to subaxis
addpath ../library/subaxis/

%Load data to create figure 2
load(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'));

% Create the plot in position 1 of a 2x2 grid
NumTicks =11;
FontSizeTitle = 12;
FontSizeAxis = 8;
GraphColour = [0 0 0.5];
GraphThickness = 1.4;

figure
% Create plot in position 1 of a 2x2 grid
subaxis(2,2,1, 'Spacing', 0.08);
plot(TFPSeqa*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-8 8]);
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks));
set(gca,'XMinorTick','on');
title('Level of productivity, z', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle, 'FontSize', FontSizeTitle);
set(gca,'FontSize',FontSizeAxis);
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);

% Create plot in position 2 of a 2x2 grid
subaxis(2,2,2, 'Spacing', 0.08);
plot(xiSeqa*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-8 8]);
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks));
set(gca,'XMinorTick','on');
title('Level of financial conditions, $\xi$', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle);
set(gca,'FontSize',FontSizeAxis);
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);

% Create plot in position 3 of a 2x2 grid
subaxis(2,2,3, 'Spacing', 0.08);
plot(ResidualTFP*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-3 3]);
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks));
set(gca,'XMinorTick','on');
title('Innovations to productivity,  ${\epsilon}_{z}$', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle);
set(gca,'FontSize',FontSizeAxis);
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);

% Create plot in position 4 of a 2x2 grid
subaxis(2,2,4, 'Spacing', 0.08);
plot(ResidualXi*100, 'color', GraphColour, 'LineWidth', GraphThickness);
axis tight;
set(gca,'box','off');
set(gca,'XLim',[1 120]);
set(gca,'YLim',[-3 3]);
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks));
set(gca,'XMinorTick','on');
title('Innovations to financial conditions,  ${\epsilon}_{\xi}$', ...
	'Interpreter','latex', 'FontSize', FontSizeTitle);
set(gca,'FontSize',FontSizeAxis);
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)']);


saveas(gcf, project_paths('OUT_FIGURES', 'figure_2.png'));