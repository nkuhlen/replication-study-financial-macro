%{ 
Programme to prepare the data needed to replicate figure 1 and the shock construction 
as described in the online appendix of Jermann and Quadrini (2012).
%}

%% Import data and define variables 
% Import data from the original data files
DataFFA 							= xlsread(project_paths('IN_DATA', 'FRB_Z1.xlsx'), 'Sheet1', 'B8:I261');
BusinessValueAddedUntil1969         = xlsread(project_paths('IN_DATA', 'NIPA_Hist_until_1969.xlsx'), '10305 Qtr', 'X11:CQ11');
BusinessValueAddedFrom1970 	        = xlsread(project_paths('IN_DATA', 'NIPA_Hist_from_1969.xlsx'), '10305 Qtr', 'H11:GG11');
BusinessPriceIndexUntil1969	        = xlsread(project_paths('IN_DATA', 'NIPA_Hist_until_1969.xlsx'), '10304 Qtr', 'X11:CQ11');
BusinessPriceIndexFrom1970 	        = xlsread(project_paths('IN_DATA', 'NIPA_Hist_from_1969.xlsx'), '10304 Qtr', 'H11:GG11');
RealGDPUntil1969					= xlsread(project_paths('IN_DATA', 'NIPA_Hist_until_1969.xlsx'), '10106 Qtr', 'X10:CQ10');
RealGDPFrom1970 					= xlsread(project_paths('IN_DATA', 'NIPA_Hist_from_1969.xlsx'), '10106 Qtr', 'H10:GG10');
Hours								= xlsread(project_paths('IN_DATA', 'AWHI.xlsx'), 'AWHI', 'B25:B230');

% Define variables
NetIncreaseCoprorateEquities        = DataFFA(:,2);
NetDividendsNonFinancialBusiness    = DataFFA(:,3);
NetDividendsFarmBusiness            = DataFFA(:,4);
ProprietorsNetInvestment            = DataFFA(:,5);

% Define variables using exact names from Jermann and Quadrini
Dates       = transpose(1952:0.25:2015.25);
NetBorrow   = DataFFA(:,1);
CapExp      = DataFFA(:,6);
CapCon1     = DataFFA(:,7);
CapCon2     = DataFFA(:,8);
NomBusGdp   = transpose(horzcat(BusinessValueAddedUntil1969, BusinessValueAddedFrom1970));
BusPrice    = transpose(horzcat(BusinessPriceIndexUntil1969, BusinessPriceIndexFrom1970));


%% Prepare data needed to replicate figure 1
% Equity Payout is calculated as net dividends of nonfinancial and farm business 
% minus net increase in corporate equities minus proprietors’ net investment and
% divided by Business GDP times 1000.
EquityPayout 	= (NetDividendsNonFinancialBusiness ...
                + NetDividendsFarmBusiness ...
                - NetIncreaseCoprorateEquities ...
                - ProprietorsNetInvestment)./(NomBusGdp*1000);

% Debt Repurchase is the negative of net increase in debt, normalized by
% Business GDP times 1000.
DebtRepurchase	= (-NetBorrow)./(NomBusGdp*1000);


%% Prepare data needed for shock construction 
% Initialize capital with a vector from 1951Q4-2015Q2 (end of
% period capital stock)
RealCap = NaN(length(Dates) + 1, 1);

% Define initial value for capital such that there is no trend in the ratio of
% capital to real business gdp over the entire sample.
CapitalInit = 22.38;

% Initialize value for 1951Q4, i.e. the capital stock that is
% around at the beginning of the first period in the sample.
RealCap(1, 1) = CapitalInit;

% Compute values for 1952Q1 - 2015Q2
for index = 2:length(RealCap)
    RealCap(index, 1) = RealCap(index - 1, 1) + (CapExp(index - 1) - ...
                        CapCon1(index - 1) - CapCon2(index - 1)) * ...
                        0.00025/BusPrice(index - 1);
end

%% Calculate TFP series for 1964Q1 - 2015Q2
% Set start and end date
StartDate = 1964.0;
StartIndex = find(Dates == StartDate);
EndDate = 2015.25;
EndIndex = find(Dates == EndDate);

% Set technology parameter as defined by Jermann and Quadrini
Theta = 0.64;

% Create vectors for the time period as specified above
TFP		 			= NaN(length(Dates(StartIndex + 1:EndIndex)), 1);
NomBusGdpTruncated 	= NomBusGdp(StartIndex:EndIndex, 1);
BusPriceTruncated 	= BusPrice(StartIndex:EndIndex, 1);
RealCapTruncated	= RealCap(StartIndex + 1:EndIndex + 1, 1);
		
% Compute the values for start_date+1 until end_date
TFP= log(NomBusGdpTruncated(2:end)./BusPriceTruncated(2:end)) - ...
			(1 - Theta)*log(RealCapTruncated(1:end-1)) -  Theta*log(Hours(2:end));


save(project_paths('OUT_DATA', 'updated_data.mat'), 'NetIncreaseCoprorateEquities', ...
     'NetDividendsNonFinancialBusiness', 'NetDividendsFarmBusiness', ...
     'ProprietorsNetInvestment', 'Dates', 'NetBorrow', 'CapExp', ...
     'CapCon1', 'CapCon2', 'NomBusGdp', 'BusPrice', 'RealCap', 'TFP', ...
     'EquityPayout', 'DebtRepurchase');
