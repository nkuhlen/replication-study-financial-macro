% Use output from the extended model estimation to create an update of table
% 3.

%% Path settings

% Use these paths for waf...
% path_out_analysis = project_paths('OUT_ANALYSIS', ...
%                                   'extended_model_results.mat');
% path_out_table_cal = project_paths('OUT_TABLES', 'cal_params.tex');
% path_out_table_est = project_paths('OUT_TABLES', 'est_params.tex');

% ... and these for Matlab IDE.
path_out_analysis = '../../bld/out/analysis/extended_model_results.mat';
path_out_table_cal = '../../bld/out/tables/cal_params.tex';
path_out_table_est = '../../bld/out/tables/est_params.tex';

%% Load results
load(path_out_analysis);

%% Table of calibrated parameters

% Create list of names for calibrated parameters in the order they shall
% appear in the final table.
cal_par = {'betta ',
           'tau   ',
           'alppha',
           'theta ',
           'delta ',
           'xi_bar',
           'G_bar '};

% Write Parameter names and values in a latex table in the specified directory.
fid = fopen(path_out_table_cal, 'w');
for idx = 1:length(cal_par)
    param = cal_par(idx,:);
    long_name = M_.param_names_long(strmatch(param, M_.param_names, ...
                                             'exact'),:);
    tex_name = M_.param_names_tex(strmatch(param, M_.param_names, 'exact'),: ...
                                  );
    par_val = M_.params(strmatch(param, M_.param_names, 'exact'),:);
    
    fprintf(fid, '%s, $%s$ & & & & %.3f \\\\ \r\n', long_name, tex_name, par_val);
end

fclose(fid);

%% Table of estimated parameters

% Create list of names for estimated parameters in the order they shall
% appear in the final table.
est_par = {'eps_z',
           'eps_zeta',
           'eps_gamma',
           'eps_eta',
           'eps_upsilon',
           'eps_G',
           'eps_varsigma',
           'eps_xi',
           'siggma',
           'epsilon',
           'h',
           'omega',
           'phi',
           'varrho',
           'psi',
           'kappa',
           'eta_bar',
           'upsilon_bar',
           'rho_z',
           'rho_zeta',
           'rho_gamma',
           'rho_eta',
           'rho_upsilon',
           'rho_G',
           'rho_varsigma',
           'rho_xi',
           'rho_gz',
           'rho_R',
           'nu_1',
           'nu_2',
           'nu_3'};

% Set up a matlab container that maps the number representation of the prior
% distribution in dynare to an appropriate string.
str_distr = {'Beta', 'Normal', 'IGamma'};
distrib = [1, 3, 4];
dist_dict = containers.Map(distrib, str_distr);

fid = fopen(path_out_table_est, 'w');

for idx = 1:length(est_par)

    param = est_par(idx,:);
    % Note that information for the estimation of the shocks are stored
    % differently from the information of estimated parameters. Hence we
    % first check for the estimated shocks.
    if idx <= size(estim_params_.var_exo,1)
        long_name = M_.exo_names_long(strmatch(param, M_.exo_names, ...
                                               'exact'),:);
        tex_name = M_.exo_names_tex(strmatch(param, M_.exo_names, 'exact'),: ...
                                    );
        par_dist = dist_dict(estim_params_.var_exo(idx, 5));
        par_mean = estim_params_.var_exo(idx, 6);
        par_std = estim_params_.var_exo(idx, 7);
        post_mode = oo_.posterior_mode.shocks_std.(char(param));
        post_hpdinf = oo_.posterior_hpdinf.shocks_std.(char(param));
        post_hpdsup = oo_.posterior_hpdsup.shocks_std.(char(param));
    else
        long_name = M_.param_names_long(strmatch(param, M_.param_names, ...
                                               'exact'),:);
        tex_name = M_.param_names_tex(strmatch(param, M_.param_names, ...
                                               'exact'),:);
        par_dist = dist_dict(estim_params_.param_vals(idx - 8, 5));
        par_mean = estim_params_.param_vals(idx - 8, 6);
        par_std = estim_params_.param_vals(idx - 8, 7);
        post_mode = oo_.posterior_mode.parameters.(char(param));
        post_hpdinf = oo_.posterior_hpdinf.parameters.(char(param));
        post_hpdsup = oo_.posterior_hpdsup.parameters.(char(param));
    end
                
    fprintf(fid, '%s, $%s$ & %s [%.3g, %.2g] & %.3f & %.3f & %.3f \\\\ \r\n', ...
            long_name, tex_name, par_dist, par_mean, par_std, post_mode, ...
            post_hpdinf, post_hpdsup);
end

fclose(fid);
