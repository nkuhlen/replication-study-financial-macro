%{ 
Create graphs of autocorrelation in residual series.
%}

clear all;
close all;

load(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'));

autocorr(r_tfp, 15);
saveas(gcf, project_paths('OUT_FIGURES', 'autocorrelation_tfp.png'));

autocorr(r_xi, 15);
saveas(gcf, project_paths('OUT_FIGURES', 'autocorrelation_xi.png'));
