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
FontSizeTitle = 12
FontSizeAxis = 8

figure
subaxis(2,2,1, 'Spacing', 0.08)
% subplot(2,2,1)
plot(TFPSeqa*100)
axis tight
set(gca,'box','off')
set(gca,'XLim',[1 120])
set(gca,'YLim',[-8 8])
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks))
set(gca,'XMinorTick','on');
title('Level of productivity, z','Interpreter','latex', 'FontSize', FontSizeTitle, 'FontSize', FontSizeTitle)
set(gca,'FontSize',FontSizeAxis)
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)'])
% subplot('Position', [0.05, 0.69, 0.92, 0.27] )
% saveas(gcf, project_paths('OUT_FIGURES', 'figure_2_plot_1.png'));


% Create the bar chart in position 2 of a 2x2 grid
subaxis(2,2,2, 'Spacing', 0.08)
% subplot(2,2,2)
plot(xiSeqa*100)
axis tight
set(gca,'box','off')
set(gca,'XLim',[1 120])
set(gca,'YLim',[-8 8])
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks))
set(gca,'XMinorTick','on');
title('Level of financial conditions, $\xi$','Interpreter','latex', 'FontSize', FontSizeTitle)
set(gca,'FontSize',FontSizeAxis)
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)'])
% subplot('Position', [1 1 1 1])
% saveas(gcf, project_paths('OUT_FIGURES', 'figure_2_plot_2.png'));


% Create the stem chart in position 3 of a 2x2 grid
subaxis(2,2,3, 'Spacing', 0.08)
% subplot(2,2,3)
plot(ResidualTFP*100)
axis tight
set(gca,'box','off')
set(gca,'XLim',[1 120])
set(gca,'YLim',[-3 3])
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks))
set(gca,'XMinorTick','on');
title('Innovations to productivity,  ${\epsilon}_{z}$','Interpreter','latex', 'FontSize', FontSizeTitle)
set(gca,'FontSize',FontSizeAxis)
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)'])

% saveas(gcf, project_paths('OUT_FIGURES', 'figure_2_plot_3.png'));


% Create the line plot in position 4 of a 2x2 grid
subaxis(2,2,4, 'Spacing', 0.08)
% subplot(2,2,4)
plot(ResidualXi*100)
axis tight
set(gca,'box','off')
set(gca,'XLim',[1 120])
set(gca,'YLim',[-3 3])
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks))
set(gca,'XMinorTick','on');
title('Innovations to financial conditions,  ${\epsilon}_{\xi}$','Interpreter','latex', 'FontSize', FontSizeTitle)
set(gca,'FontSize',FontSizeAxis)
set(gca,'XTickLabel',['85(II)'; '88(II)'; '91(II)'; '94(II)'; '97(II)'; ...
	'00(II)'; '03(II)'; '06(II)'; '09(II)';'12(II)'; '15(II)'])

saveas(gcf, project_paths('OUT_FIGURES', 'figure_2.png'));