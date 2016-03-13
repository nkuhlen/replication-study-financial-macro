.. _data_management:

Data management
===============

The data management part consists of two parts. The first prepares updated data from the original data sources. The second uses the original dataset provided by Jermann and Quadrini (2012, :cite:`JERMANNfinancial`) and prepares it for the estimation of the extended model.

:file:`data_preparation.m`:

	This file reads in the data from the original data files and prepares them for use across different modules of this project. Having only one file for the data preparation is partially motivated by the fact that loading xslx files in matlab is not the fastest process. Therefore, avoiding replications of this process for each data set needed speeds up the whole data management process. 

	The variable names in this file adopt the corresponding names in the original code provided by Jermann and Quadrini. This allows for an easier comparison between the codes, which is important when performing a replication study. In addition to reading in data from the original data sets in *src/original_data*, this file computes equity payout, debt repurchase and the TFP series needed for the replication of figure 1 and the construction of the shocks.

	The resulting series are then saved as ``updated_data.mat`` in the *src/bld/out/figures* directory.


:file:`simulation_data_preparation.m`:

	This script reads in the data from the Excel data sheet provided by Jermann and Quadrini and computes variables log differences and demeans them for output, consumption, investment, price deflator, working hours and wage growths. It just demeans the interest rate and detrends debt repurchases.
	
	All constructed variables are stored in a ``.mat`` datafile that can be read by dynare.
