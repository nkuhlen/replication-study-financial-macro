% Run the baseline model dynare file.
dynare baseline_model.mod

% The following lines will copy the results from dynare to the appropriate
% output folder. They are only needed if you want to run the entire project
% with waf. So in case you just want to run the dynare file itself you
% should comment out the following lines.
if ~exist(project_paths('OUT_ANALYSIS'), 'dir')
    mkdir(project_paths('OUT_ANALYSIS'))
end

copyfile('baseline_model_results.mat', project_paths('OUT_ANALYSIS'))