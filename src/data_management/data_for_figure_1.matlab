% Programme to prepare the data needed to replicate figure 1 as described in the 
% the online appendix of Jerman and Quadrini (2012).

%% Import original data
data_ffa = xlsread(project_paths('IN_DATA', 'FRB_Z1.xlsx'), 'Sheet1', 'B8:F261');

net_increase_corporate_equities         = data_ffa(:,2);
net_dividends_non_financial_business    = data_ffa(:,3);
net_dividends_farm_business             = data_ffa(:,4);
proprietors_net_investment              = data_ffa(:,5);

% Calculate equity payout
equity_payout = net_dividends_non_financial_business ...
                + net_dividends_farm_business ...
                - net_increase_corporate_equities ...
                - proprietors_net_investment

