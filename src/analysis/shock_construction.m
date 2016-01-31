%{ 
Translation of Gauss code from Jermann and Quadrini (2012) to matlab code.
%}

clear all;
close all;

load(project_paths('OUT_DATA', 'data_shock_construction.mat'));

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

TFP = xlsread('Data_Shocks_updated.xlsx','Sheet1', 'M137:M262');
TFPSeqa = detrend(TFP, 'linear');
data = horzcat(TFPSeqa, xiSeqa);

TFPSeqa_t = TFPSeqa(1:end-1);
TFPSeqa_t_1 = TFPSeqa(2:end);
xiSeqa_t = xiSeqa(1:end-1);
xiSeqa_t_1 = xiSeqa(2:end);

X = horzcat(TFPSeqa_t, xiSeqa_t);

ARmx = zeros(2,2);
ARmx(1,:) = regress(TFPSeqa_t_1,X);
ARmx(2,:) = regress(xiSeqa_t_1,X);

[b_1,bint_1,r_tfp] = regress(TFPSeqa_t_1,X);
[b_2,bint_2,r_xi] = regress(xiSeqa_t_1,X);

% autocorr(r_tfp, 15);
% autocorr(r_xi, 15);

% ti = get(gca,'TightInset');
% set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);

% set(gca,'units','centimeters')
% pos = get(gca,'Position');
% ti = get(gca,'TightInset');

% set(gcf, 'PaperUnits','centimeters');
% set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);

% R = horzcat(r_tfp, r_xi);
% corr(R)
%corrplot(R, 'varNames',{'tfp','xi'});  

save(project_paths('OUT_ANALYSIS', 'series_of_shocks.mat'), 'TFPSeqa_t', 'xiSeqa_t', ...
	'r_tfp', 'r_xi');

%% Using real gdp and corrected timing for the tfp shocks based on updated data.
% TFP_real = xlsread('Data_Shocks_updated.xlsx','Sheet1', 'O137:O262');
% TFPSeqa_real = detrend(TFP_real, 'linear');
% data = horzcat(TFPSeqa_real, xiSeqa);

% TFPSeqa_t_real = TFPSeqa_real(1:end-1);
% TFPSeqa_t_1_real = TFPSeqa_real(2:end);
% xiSeqa_t = xiSeqa(1:end-1);
% xiSeqa_t_1 = xiSeqa(2:end);

% X = horzcat(TFPSeqa_t_real, xiSeqa_t);

% ARmx_real = zeros(2,2);
% ARmx_real(1,:) = regress(TFPSeqa_t_1_real,X);
% ARmx_real(2,:) = regress(xiSeqa_t_1,X);

% [b_1,bint_1,r_tfp_real] = regress(TFPSeqa_t_1_real,X);
% [b_2,bint_2,r_xi_real] = regress(xiSeqa_t_1,X);

% R_real = horzcat(r_tfp_real, r_xi_real);
% corr(R_real)


% % Using the tfp shocks based on updated data but using real gdp and timing as in the paper.
% TFP_paper = xlsread('Data_Shocks_updated.xlsx','Sheet1', 'P137:P262');
% TFPSeqa_paper = detrend(TFP_paper, 'linear');
% data = horzcat(TFPSeqa_paper, xiSeqa);

% TFPSeqa_t_paper = TFPSeqa_paper(1:end-1);
% TFPSeqa_t_1_paper = TFPSeqa_paper(2:end);
% xiSeqa_t = xiSeqa(1:end-1);
% xiSeqa_t_1 = xiSeqa(2:end);

% X = horzcat(TFPSeqa_t_paper, xiSeqa_t);

% ARmx_paper = zeros(2,2);
% ARmx_paper(1,:) = regress(TFPSeqa_t_1_paper,X);
% ARmx_paper(2,:) = regress(xiSeqa_t_1,X);

% [b_1,bint_1,r_tfp_paper] = regress(TFPSeqa_t_1_real,X);
% [b_2,bint_2,r_xi_paper] = regress(xiSeqa_t_1,X);

% R_paper = horzcat(r_tfp_paper, r_xi_paper);
% corr(R_paper)
