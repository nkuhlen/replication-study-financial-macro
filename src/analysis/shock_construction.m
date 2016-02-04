%{ 
Basic translation of Gauss code from Jermann and Quadrini (2012) as provided 
online to matlab code.
%}

clear all;
close all;

load(project_paths('OUT_DATA', 'updated_data.mat'));

% Start translation of Gauss code.
NomDebt = zeros(size(Dates,1)+1,1);

NomDebt(1) = 94.12;

for t = 1:1:size(Dates,1)
  NomDebt(t+1)=NomDebt(t)+NetBorrow(t)*0.00025;
  t=t+1;
end;

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

ARmx = zeros(2,2);
ARmx(1,:) = regress(TFPSeqa_t_1,X);
ARmx(2,:) = regress(xiSeqa_t_1,X);

ARmx
% End of translation of Gauss code.

% Store residuals
[b1,bint1,ResidualTFP] = regress(TFPSeqa_t_1,X);
[b2,bint2,ResidualXi] = regress(xiSeqa_t_1,X);

% Calculate correlation between residuals
R = horzcat(ResidualTFP, ResidualXi);
CorrelationResiduals = corr(R);


%% Save series to matlab dataset
save(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'), 'TFPSeqa', 'xiSeqa', ...
	'ResidualTFP', 'ResidualXi', 'Dates', 'ARmx', 'CorrelationResiduals');
 