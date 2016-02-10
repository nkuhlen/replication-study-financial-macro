% Use the results from dynare to simulate the model with the shock vectors
% estimated in the *shock_construction* script. Save them for later
% comparison with the observed variables.

%% Path settings

% Use these paths for waf
path_dynare_output = project_paths('OUT_ANALYSIS', ...
                                  'baseline_model_results.mat');
path_to_shocks = project_paths('OUT_ANALYSIS', 'shock_innovations.mat');
path_out_analysis = project_paths('OUT_ANALYSIS', ...
                                 'baseline_simulation.mat');

% And these for use in matlab IDE
% path_dynare_output = '../../bld/out/analysis/baseline_model_results.mat';
% path_to_shocks = '../../bld/out/analysis/shock_innovations.mat';
% path_out_analysis = '../../bld/out/analysis/baseline_simulation.mat';

%% Load in data
load(path_dynare_output)
load(path_to_shocks)

%% Simulation with dynare results

% Set initial values for the simulation to be the steady state values saved
% from dynare in oo_.dr.ys
initial_condition_states = repmat(oo_.dr.ys,1,M_.maximum_lag);

% Create a matrix where the first row corresponds to the innovations to
% aggregate productivity and the second row to the innovations in financial
% conditions.
shock_matrix = horzcat(prod_innovations, fin_innovations);

% Simulate with original innovation processes
model_simul = simult_(initial_condition_states,oo_.dr,shock_matrix,1);

% Assign simulated series to variables
baseline_simul.yhat = model_simul(strmatch('yhat',M_.endo_names, 'exact'),:);
baseline_simul.nhat = model_simul(strmatch('nhat',M_.endo_names, 'exact'),:); 
baseline_simul.byhat = model_simul(strmatch('byhat',M_.endo_names, 'exact'),:);

baseline_simul.dyhat = model_simul(strmatch('dyhat',M_.endo_names, 'exact'),:) ...
    - oo_.dr.ys(strmatch('dyhat',M_.endo_names, 'exact'));

%% Save simulated series
save(path_out_analysis, 'baseline_simul')