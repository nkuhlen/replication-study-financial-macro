.. _original_data:

Original data
===============

Documentation of the different datasets in **original_data**.

:file:`AWHI.xlsx`:

	Contains data on *Current Employment Statistics* from the U.S. Bureau of Labor Statistics downloaded 
	`here 
	<https://research.stlouisfed.org/fred2/series/AWHI/downloaddata>`_
	from FRED, Federal Reserve Bank of St. Louis (last checked: November 21, 2015).

		* Index of Aggregate Weekly Hours: Production and Nonsupervisory Employees: Total Private Industries
		* Series ID: AWHI
		* Source: US. Bureau of Labor Statistics
		* Release: Employment Situation
		* Seasonal Adjustment: Seasonally Adjusted
		* Frequency: Quarterly
		* Aggregation Method: Average
		* Units: Index 2002=100


:file:`DataSet_Jermann_Quadrini.xlsx`:

	This is the data set used by Jermann and Quadrini (2012) which can be downloaded from
	`here 
	<https://www.aeaweb.org/articles.php?doi=10.1257/aer.102.1.238>`_
	(last checked: January 31, 2016).


:file:`FRB_Z1.xlsx`:

	Contains data on *Flow of Funds Accounts (FFA)* downloaded 
	`here 
	<http://www.federalreserve.gov/datadownload/Download.aspx?rel=Z1&series=1f08e962a27dff21b89a7212d58b8346&filetype=spreadsheetml&label=include&layout=seriescolumn&from=03/01/1952&to=06/30/2015>`_
	from the Federal Reserve Board (FRB) (last checked: January 28, 2016). The following list provides the identifiers and series descriptions in the data set.

		* FA144104005.Q: Nonfinancial business; debt securities and loans; liability
		* FA103164103.Q: Nonfinancial corporate business; corporate equities; liability
		* FA106121075.Q: Nonfinancial corporate business; net dividends paid
		* FA136121073.Q: Farm business; net dividends paid
		* FA112090205.Q: Nonfinancial noncorporate business; proprietors' equity in noncorporate business (net worth)
		* FA145050005.Q: Nonfinancial business; total capital expenditures
		* FA106300083.Q: Nonfinancial corporate business; consumption of fixed capital, structures, equipment, and intellectual property products, including equity REIT residential structures (NIPA basis)
		* FA116300001.Q: Nonfinancial noncorporate business; consumption of fixed capital, structures, equipment, and intellectual property products, current cost basis 


:file:`NIPA_Hist_until_1969.xlsx` and :file:`NIPA_Hist_from_1969.xlsx`:

	Contain data on *National Income and Product Accounts (NIPA)* downloaded 
	`here 
	<http://www.bea.gov//national/nipaweb/DownSS2.asp>`_
	from the Bureau of Economic Analysis (BEA) (last checked: November 7, 2015). The following list provides the table codes and descriptions in both data sets from section 1 that are relevant to the replication study. 
		
		* 10106	Table 1.1.6. Real Gross Domestic Product, Chained Dollars
		* 10304	Table 1.3.4. Price Indexes for Gross Value Added by Sector
		* 10305	Table 1.3.5. Gross Value Added by Sector
		

:file:`recessiondates.mat`:

	Contains data on recession dates needed to replicate shaded areas in figure 1 from Jermann and Quadrini (2012). The data was provided by  
	`Benjamin Born 
	<benjamin.born@uni-bonn.de>`_
	as part of the project module in econometrics and statistics in the winter semester 15/16 at the University of Bonn.
