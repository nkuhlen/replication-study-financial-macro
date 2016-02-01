%{ 
Programme to prepare the data needed to replicate figure 1 and the shock construction 
as described in the online appendix of Jerman and Quadrini (2012).
%}

%% Import original data
data_ffa 							= xlsread(project_paths('IN_DATA', 'FRB_Z1.xlsx'), 'Sheet1', 'B8:I261');
business_value_added_until_1969 	= xlsread(project_paths('IN_DATA', 'NIPA_Hist_until_1969.xlsx'), '10305 Qtr', 'X11:CQ11');
business_value_added_from_1970 		= xlsread(project_paths('IN_DATA', 'NIPA_Hist_from_1969.xlsx'), '10305 Qtr', 'H11:GG11');
business_price_index_until_1969		= xlsread(project_paths('IN_DATA', 'NIPA_Hist_until_1969.xlsx'), '10304 Qtr', 'X11:CQ11');
business_price_index_from_1970 		= xlsread(project_paths('IN_DATA', 'NIPA_Hist_from_1969.xlsx'), '10304 Qtr', 'H11:GG11');
real_gdp_until_1969					= xlsread(project_paths('IN_DATA', 'NIPA_Hist_until_1969.xlsx'), '10106 Qtr', 'X10:CQ10');
real_gdp_from_1970 					= xlsread(project_paths('IN_DATA', 'NIPA_Hist_from_1969.xlsx'), '10106 Qtr', 'H10:GG10');
hours								= xlsread(project_paths('IN_DATA', 'AWHI.xlsx'), 'AWHI', 'B25:B230');



%% Prepare data needed to replicate figure 1
% Define variables
net_increase_credit_markets_instruments = data_ffa(:,1);
net_increase_corporate_equities         = data_ffa(:,2);
net_dividends_non_financial_business    = data_ffa(:,3);
net_dividends_farm_business             = data_ffa(:,4);
proprietors_net_investment              = data_ffa(:,5);
business_gdp 							= transpose(horzcat(business_value_added_until_1969, business_value_added_from_1970));

% Calculate equity payout and debt repurchase
equity_payout 	= (net_dividends_non_financial_business ...
                + net_dividends_farm_business ...
                - net_increase_corporate_equities ...
                - proprietors_net_investment)./(business_gdp*1000);

debt_repurchase	= (-net_increase_credit_markets_instruments)./(business_gdp*1000);

% Create timeline
timeline = transpose(1952:0.25:2015.25);


%% Prepare data needed for shock construction 
% Define variables using variable names following Jermann and Quadrini
CapExp 		= data_ffa(:,6);
CapCon1 	= data_ffa(:,7);
CapCon2 	= data_ffa(:,8);
NetBorrow 	= data_ffa(:,1);
NomBusGdp 	= transpose(horzcat(business_value_added_until_1969, business_value_added_from_1970));
BusPrice 	= transpose(horzcat(business_price_index_until_1969, business_price_index_from_1970));

% Rename timeline variable to use variable names as in Jermann and Quadrini
Dates = timeline;

% Define initial value to calculate capital stock.
capital_init = 22.3833730671711;

% Initialize capital with a vector from 1951Q4-2015Q2 (end of
% period capital stock)
capital = NaN(length(Dates) + 1, 1);

% Initialize value for 1951Q4, i.e. the capital stock that is
% around at the beginning of the first period in the sample.
capital(1, 1) = capital_init;

% Compute values for 1952Q1 - 2015Q2
for index = 2:length(capital)
    capital(index, 1) = capital(index - 1, 1) + (CapExp(index - 1) - ...
                        CapCon1(index - 1) - CapCon2(index - 1)) * ...
                        0.00025/BusPrice(index - 1);
end

RealCap = capital;

% Calculate TFP series
start_date = 1964.0;
start_index = find(Dates == start_date);
end_date = 2015.25;
end_index = find(Dates == end_date);

% Set technology parameter
theta = 0.64;

% Create vectors for time period as specified above
TFP		 			= NaN(length(Dates(start_index + 1:end_index)), 1);
NomBusGdpTruncated 	= NomBusGdp(start_index:end_index, 1);
BusPriceTruncated 	= BusPrice(start_index:end_index, 1);
RealCapTruncated	= RealCap(start_index + 1:end_index + 1, 1);
		
% Compute values for start_date+1 until end_date
TFP= log(NomBusGdpTruncated(2:end)./BusPriceTruncated(2:end)) - ...
			(1 - theta)*log(RealCapTruncated(1:end-1)) -  theta*log(hours(2:end));


save(project_paths('OUT_DATA', 'updated_data.mat'), 'net_increase_credit_markets_instruments', ...
     'net_increase_corporate_equities', 'net_dividends_non_financial_business', ...
     'net_dividends_farm_business', 'proprietors_net_investment', 'business_gdp', 'equity_payout', ...
     'debt_repurchase', 'timeline', 'CapExp', 'CapCon1', 'CapCon2', 'NetBorrow', ...
     'NomBusGdp', 'BusPrice', 'RealCap', 'TFP');
