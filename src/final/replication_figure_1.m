%{
Programme to replicate figure 1 in Jerman and Quadrini (2012) using updated
data. First, plot equity payout and debt repurchase. Then, add recession areas
to the plot by using data from recessiondates.mat. 
%}

%% Path settings

% Use these paths when compiling the entire project with waf.
path_data = project_paths('OUT_DATA', 'updated_data.mat');
path_recession_dates = project_paths('IN_DATA', 'recessiondates.mat');
path_out_figure = project_paths('OUT_FIGURES', 'figure_1.pdf');

% Use the relative paths below to execute the script using the Matlab IDE.
% path_data = '../../bld/out/data/updated_data.mat';
% path_recession_dates = '../original_data/recessiondates.mat';
% path_out_figure = '../../out/figures/figure_1.pdf';

%%Load data to create figure 1.
load(path_data);
load(path_recession_dates)

%% Create figure
figure
set(gcf, 'visible', 'off')

% Scale variables to match figure from paper
d = DebtRepurchase*100;
e = EquityPayout*100;

% Add reference line at y=0
hold on
hline = refline (0);
hline.Color = 'k';
hold off

plothandle = plot(Dates, d, 'b', Dates, e, 'r--', 'LineWidth',1.5);

% Adjust axes
axis([1952 2015 -16 16])
aaa=ylim;
bottom=aaa(1,1);
top=aaa(1,2);

% Delete dates that happen before first data point
x_dates=xlim;
recessiondates(recessiondates(:,2)<x_dates(1),:)=[];

%set axes limits and step size
set(gca, 'XTick', [1956:4:2015])
set(gca, 'YTick', [-16:4:16])
set(gca,'FontSize', 12);

% Add recession areas
for ii=1:length(recessiondates)
hold on
ha = area([recessiondates(ii,1) recessiondates(ii,2)], ...
	[bottom top-bottom; bottom top-bottom],'FaceColor', ...
	[0.37254901960784 0.75686274509804 0.82745098039216], 'EdgeColor','white');
set(ha(1), 'FaceColor', 'none') % this makes the bottom area invisible
set(ha, 'LineStyle', '-')
end
ylim(aaa)

% Add legend
legend('Debt repurchase', 'Equity payout', 'Location','northwest')
uistack(plothandle,'top')
set(gca,'Layer','top')

% Export graphic without white space
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);

set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');

set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);

% Save figure as pdf
saveas(gcf, path_out_figure);
