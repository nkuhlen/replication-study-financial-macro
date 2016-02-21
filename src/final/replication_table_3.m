%{ 
Programme to update table 3 in Jermann and Quadrini (2012) using the output from
the extended model estimation.
%}

%% Path settings

% Use these paths when compiling the entire project with waf.
path_out_analysis = project_paths('OUT_ANALYSIS', ...
                                  'extended_model_results.mat');
path_out_table_cal = project_paths('OUT_TABLES', 'cal_params.tex');
path_out_table_est = project_paths('OUT_TABLES', 'est_params.tex');

% Use the relative paths below to execute the script using the Matlab IDE.
% path_out_analysis = '../../bld/out/analysis/extended_model_results.mat';
% path_out_table_cal = '../../bld/out/tables/cal_params.tex';
% path_out_table_est = '../../bld/out/tables/est_params.tex';

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
    
    fprintf(fid, '%s, $%s$ & & & & %.3f \\\\ \r\n', strtrim(long_name), ...
      tex_name, par_val);
end

fclose(fid);

%% Table of estimated parameters

% Create list of names for estimated parameters in the order they shall
% appear in the final table.
est_par = {'siggma',
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
           'eps_z',
           'eps_zeta',
           'eps_gamma',
           'eps_eta',
           'eps_upsilon',
           'eps_G',
           'eps_varsigma',
           'eps_xi',
           'rho_R',
           'nu_1',
           'nu_2',
           'nu_3'};

% Set up a matlab container that maps the number representation of the prior
% distribution in dynare to an appropriate string.
str_distr = {'Beta', 'Normal', 'IGamma'};
distrib = [1, 3, 4];
dist_dict = containers.Map(distrib, str_distr);

% Create a list of indices of the elements that are strings corresponding to 
% shocks.
index_shocks = strfind(est_par, 'eps_');
shocks = find(not(cellfun('isempty', index_shocks)));

fid = fopen(path_out_table_est, 'w');

for idx = 1:length(est_par)

    shocks_looped_over = shocks <= idx;
    shocks_counter = numel(shocks_looped_over(shocks_looped_over>0));

    param = est_par(idx,:);

    % Note that information for the estimation of the shocks are stored
    % differently from the information of estimated parameters. Hence we
    % first check for the estimated shocks.
    if ismember(idx, shocks)
        index_correction = idx -  shocks_counter;

        long_name = strcat(M_.exo_names_long(strmatch(param, M_.exo_names, ...
                                               'exact'),:), ' volatility');
        tex_name = M_.exo_names_tex(strmatch(param, M_.exo_names, 'exact'),: ...
                                    );
        par_dist = dist_dict(estim_params_.var_exo(idx - index_correction, 5));
        par_mean = estim_params_.var_exo(idx - index_correction, 6);
        par_std = estim_params_.var_exo(idx - index_correction, 7);
        post_mode = oo_.posterior_mode.shocks_std.(char(param));
        post_hpdinf = oo_.posterior_hpdinf.shocks_std.(char(param));
        post_hpdsup = oo_.posterior_hpdsup.shocks_std.(char(param));
    else
        index_correction = shocks_counter;

        long_name = M_.param_names_long(strmatch(param, M_.param_names, ...
                                               'exact'),:);
        tex_name = M_.param_names_tex(strmatch(param, M_.param_names, ...
                                               'exact'),:);
        par_dist = dist_dict(estim_params_.param_vals(idx - index_correction, 5));
        par_mean = estim_params_.param_vals(idx - index_correction, 6);
        par_std = estim_params_.param_vals(idx - index_correction, 7);
        post_mode = oo_.posterior_mode.parameters.(char(param));
        post_hpdinf = oo_.posterior_hpdinf.parameters.(char(param));
        post_hpdsup = oo_.posterior_hpdsup.parameters.(char(param));
    end
                
    fprintf(fid, '%s, $%s$ & %s [%.3g, %.2g] & %.3f & %.3f & %.3f \\\\ \r\n', ...
            strtrim(long_name), tex_name, par_dist, par_mean, par_std, post_mode, ...
            post_hpdinf, post_hpdsup);
end

fclose(fid);
