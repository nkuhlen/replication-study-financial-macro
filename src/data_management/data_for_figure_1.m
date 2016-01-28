% Programme to prepare the data needed to replicate figure 1 as described in the 
% the online appendix of Jerman and Quadrini (2012).
% source: http://www.federalreserve.gov/datadownload/Download.aspx?rel=Z1&series=1b491b6891f88f8604172bc2f3970d52&filetype=csv&label=include&layout=seriescolumn&from=03/01/1952&to=06/30/2015

%% Import original data
data_ffa = csvread(project_paths('IN_DATA', 'FRB_Z1.csv'), 6, 1);


net_increase_credit_markets_instruments = data_ffa(:,1);
net_increase_corporate_equities         = data_ffa(:,2);
net_dividends_non_financial_business    = data_ffa(:,3);
net_dividends_farm_business             = data_ffa(:,4);
proprietors_net_investment              = data_ffa(:,5);

% Calculate equity payout
equity_payout = net_dividends_non_financial_business ...
                + net_dividends_farm_business ...
                - net_increase_corporate_equities ...
                - proprietors_net_investment

save(project_paths('OUT_DATA', 'data_figure_1.mat'), 'net_increase_credit_markets_instruments', ...
     'net_increase_corporate_equities', 'net_dividends_non_financial_business', ...
     'net_dividends_farm_business', 'proprietors_net_investment')