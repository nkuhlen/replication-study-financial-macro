%{
Replicate figure 1 using data from data_figure_1.mat. Create a 
Matlab figure by plotting equity payout and debt repurchase. 
Add recession areas to the plot by using data from recessiondates.mat. 
%}

% timeline = xlsread(project_paths('IN_DATA', 'DataSet_updated.xlsx'),'FFA', 'L9:L262');
% equity = xlsread(project_paths('IN_DATA', 'DataSet_updated.xlsx'),'FFA', 'I9:I262');
% debt = xlsread(project_paths('IN_DATA', 'DataSet_updated.xlsx'),'FFA', 'J9:J262');

clear all
close all

%Load data to create figure 1.
load(project_paths('OUT_DATA', 'updated_data.mat'));

%create figure
figure

%scale variables to match figure from paper
d = debt_repurchase*100;
e = equity_payout*100;

%add recession areas
load(project_paths('IN_DATA', 'recessiondates.mat'))

%add reference line at y=0
hold on
hline = refline (0);
hline.Color = 'k';
hold off

% use code from plot_NBER_recessions
plothandle = plot(timeline, d, 'b', timeline, e, 'r--');

%adjust axes
axis([1952 2015 -16 16])
aaa=ylim;
bottom=aaa(1,1);
top=aaa(1,2);

%delete dates that happen before first data point
x_dates=xlim;
recessiondates(recessiondates(:,2)<x_dates(1),:)=[];

%set axes limits and step size
set(gca, 'XTick', [1956:4:2015])
set(gca, 'YTick', [-16:4:16])

%add recession areas
for ii=1:length(recessiondates)
hold on
ha = area([recessiondates(ii,1) recessiondates(ii,2)], [bottom top-bottom; bottom top-bottom],'FaceColor',[0 0.7 0.8],'EdgeColor','white');
set(ha(1), 'FaceColor', 'none') % this makes the bottom area invisible
set(ha, 'LineStyle', '-')
end
ylim(aaa)

legend('Debt repurchase', 'Equity payout', 'Location','northwest')
uistack(plothandle,'top')
set(gca,'Layer','top')

%this exports a graphic without white space
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);

set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');

set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);

saveas(gcf, project_paths('OUT_FIGURES', 'Replication_Figure_1_updated.pdf'));