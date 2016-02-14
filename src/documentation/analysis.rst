.. _analysis:

************************************
Main model estimations / simulations
************************************

Dynare files
============


The simulation of the baseline model and the estimation of the extended model
is done using dynare. Since the dynare outputfiles cannot be easily guided I
create a separate subfolder in the analysis folder for them. Within this folder
I put the dynare model files :file:`baseline_model.mod` and
:file:`extended_model.mod` as well as the matlab scripts
:file:`run_baseline_model.m` and :file:`run_extended_model.m` that will run the
dynare model files and copy the necessary output file, for the baseline model
that is :file:`baseline_model_results.mat`, to the analysis output folder in
`bld`. Note that these scripts have to live in the same directory as the dynare
model files to work properly. Therefore I also added the `dynare_files` to the
project paths in the project roots wscript.


Extended model
--------------

To run the estimation of the extended model with dynare, the data that are used
for the estimation has to be in the same folder as the dynare model
file. Therefore the :file:`run_extended_model.m` first has to copy the data
that are prepared in the :file:`simulation_data_prep.m` file in the data
management section to the dynare files directory. This is not a particularly
nice solution, but so far this is the only way I could find to make this step
work ok with waf. Other than that the runfile for the extended model does not
do much.


The file :file:`baseline_simulation.m` simulates the baseline model with the
shock vectors obtained from :file:`shock_construction.m`. To do so it uses the
results (policy functions, steady state) from dynare, which are saved in the
:file:`baseline_model_results.mat` file. The simulated series for output, labor
hours, equity payouts and debt repurchases are saved for later use.


Shock Construction
------------------

:file:`shock_construction.m`:

.. include:: ../analysis/shock_construction.m
   :start-after: %{
   :end-before: %}