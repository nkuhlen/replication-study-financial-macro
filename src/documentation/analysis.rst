.. _analysis:

************************************
Main model estimations / simulations
************************************

Documentation of the code in *src.analysis*. This is the core of the project. 

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

The file :file:`baseline_simulation.m` simulates the baseline model with the
shock vectors obtained from :file:`shock_construction.m`. To do so it uses the
results (policy functions, steady state) from dynare, which are saved in the
:file:`baseline_model_results.mat` file. The simulated series for output, labor
hours, equity payouts and debt repurchases are saved for later use.


Shock Construction
==================

:file:`shock_construction.m`:

.. include:: ../analysis/shock_construction.m
   :start-after: %{
   :end-before: %}