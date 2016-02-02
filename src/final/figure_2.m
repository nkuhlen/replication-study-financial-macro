%{ 
Programme to create the panels in the first two columns of figure 2 
in Jermann Quadrini (2012).
%}

clear all;
close all;

%Load data to create figure 2
load(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'));

% Create the plot in position 1 of a 2x2 grid
figure
subplot(2, 2, 1)
plot(TFPSeqa)
title('Level of productivity, z','Interpreter','latex')

% Create the bar chart in position 2 of a 2x2 grid
subplot(2, 2, 2)
plot(xiSeqa)
title('Level of financial conditions, $\xi$','Interpreter','latex')

% Create the stem chart in position 3 of a 2x2 grid
subplot(2, 2, 3)
plot(ResidualTFP)
title('Innovations to productivity,  ${\epsilon}_{z}$','Interpreter','latex')

% Create the line plot in position 4 of a 2x2 grid
subplot(2, 2, 4)
plot(ResidualXi)
title('Innovations to financial conditions,  ${\epsilon}_{\xi}$','Interpreter','latex')


saveas(gcf, project_paths('OUT_FIGURES', 'figure_2.png'));