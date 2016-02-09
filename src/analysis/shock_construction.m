%{ 
Translation of Gauss code from Jermann and Quadrini (2012) as provided online 
as 'MainProg.gau' to matlab using the updated data to construct tfp shocks and 
financial shocks.
%}

clear all;
close all;

%% Start translation of Gauss code. This includes all variable names and comments.
ARmx = NaN(2,2);

% load DATASET TO COSTRUCT CREDIT SHOCKS
load(project_paths('OUT_DATA', 'updated_data.mat'));

RealCap = RealCap(2:size(Dates,1)+1);
NomDebt = NomDebt(2:size(Dates,1)+1);
NomCap = RealCap.*BusPrice;

RealDebt=NomDebt./BusPrice;
RealBusGdp=NomBusGdp./(BusPrice.*4);

StartPeriod=1984;

DataSet = horzcat(log(RealCap), log(RealDebt), log(RealBusGdp), Dates);
DataSet = DataSet(Dates>=StartPeriod,:) ;
Dates = Dates(Dates>=StartPeriod,:);
NomBusGdp = NomBusGdp(Dates>=StartPeriod,:);
NomDebt = NomDebt(Dates>=StartPeriod,:);
NomCap = NomCap(Dates>=StartPeriod,:);

dDataSet=detrend(DataSet, 'linear');
tDataSet=DataSet-dDataSet;


% CONSTRUCT SEQUENCE OF SHOCKS and VAR   
mcoefy = 1;
mcoefk = -1.5489;
mcoefb = 0.5489;

xiSeqa=(mcoefk*dDataSet(:,1)+mcoefb*dDataSet(:,2)+mcoefy*dDataSet(:,3));

TFPSeqa = detrend(TFP(80:end), 'linear');
data = horzcat(TFPSeqa, xiSeqa);

TFPSeqa_t = TFPSeqa(1:end-1);
TFPSeqa_t_1 = TFPSeqa(2:end);
xiSeqa_t = xiSeqa(1:end-1);
xiSeqa_t_1 = xiSeqa(2:end);

X = horzcat(TFPSeqa_t, xiSeqa_t);

ARmx(1,:) = regress(TFPSeqa_t_1,X);
ARmx(2,:) = regress(xiSeqa_t_1,X);

% End of translation of Gauss code.

%% Store residuals
[b1,bint1,ResidualTFP] = regress(TFPSeqa_t_1,X);
[b2,bint2,ResidualXi] = regress(xiSeqa_t_1,X);

% Calculate correlation between residuals
R = horzcat(ResidualTFP, ResidualXi);
CorrelationResiduals = corr(R);


%% Save series to matlab dataset
save(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'), 'TFPSeqa', 'xiSeqa', ...
	'ResidualTFP', 'ResidualXi', 'Dates', 'ARmx', 'CorrelationResiduals');
 