.. _data_management:

Data management
===============

Documentation of the code in **data_management**.

:file:`data_preparation.m`:

	This file prepares the data needed to replicate figure 1 and the shock construction as described in the online appendix of Jermann and Quadrini (2012). Having only one file for the data preparation is motivated by the fact that loading xslx files in matlab is not the fastest process. Therefore, avoiding replications of this process for each data set needed speeds up the whole data management process. 

	The variable names in this file adopt the corresponding names in the original code provided by Jermann and Quadrini. This allows for an easier comparison between the codes, which is important when performing a replication study. In addition to reading in data from the original data sets in *src/original_data*, this file computes equity payout, debt repurchase and the TFP series needed for the replication of figure 1 and the construction of the shocks.

	The resulting series are then saved as ``updated_data.mat`` in the *src/bld/out/figures* directory.


:file:`simulation_data_preparation.m`:

	.. include:: ../data_management/simulation_data_preparation.m
	   :start-after: %{
	   :end-before: %}