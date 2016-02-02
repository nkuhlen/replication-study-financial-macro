%{ 
Create graphs of autocorrelation in residual series.
%}

clear all;
close all;

load(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'));

autocorr(ResidualTFP, 15);
saveas(gcf, project_paths('OUT_FIGURES', 'autocorrelation_tfp.png'));

autocorr(ResidualXi, 15);
saveas(gcf, project_paths('OUT_FIGURES', 'autocorrelation_xi.png'));
