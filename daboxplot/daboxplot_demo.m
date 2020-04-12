%DABOXPLOT_DEMO a few examples of DABOXPLOT functionality 
%
% Povilas Karvelis <karvelis.povilas@gmail.com>
% 15/04/2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rng('default')

% data in a cell array 
data1{1} = randn([60,4]); % Humans
data1{2} = randn([60,4]); % Dogs
data1{3} = randn([60,4]); % God
data1{4} = randn([60,4]); % Potato

% data in a matrix (+ grouping indices)
data2 = [randn([30,4]); randn([30,4]);...
         randn([30,4]); randn([30,4])];
group_inx = [ones(1,30), 2.*ones(1,30) 3.*ones(1,30) 4.*ones(1,30)];

group_names = {'Humans', 'Dogs' , 'God', 'Potato'};
condition_names = {'Water', 'Land', 'Moon', 'Hyperspace'};

% an alternative color scheme for some plots
c =  [0.45, 0.80, 0.69;...
      0.98, 0.40, 0.35;...
      0.55, 0.60, 0.79;...
      0.90, 0.70, 0.30];  
  
  
figure('Name', 'daboxplot_demo','WindowStyle','docked');
pause(0.5); % prevents a glitch in xlim; don't ask me why

% default boxplots for one group and three conditions 
subplot(3,3,1)
h = daboxplot(data2(:,1:3),'groups',group_inx(1:30));


% non-filled boxplots and cutomized medians
subplot(3,3,2)
h = daboxplot(data2(:,1:3),'groups',group_inx(1:60),'symbol','kx',...
    'conditions', condition_names,'fill',0,'legend',group_names(1:2));
ylabel('Performance');
xl = xlim; xlim([xl(1), xl(2)+1]);    % make more space for the legend
set(h.m,'Color','k','LineWidth',1.5); % customize median lines


% filled boxplots, different color scheme and cutomized medians
subplot(3,3,3)
h = daboxplot(data2(:,1:3),'groups',group_inx(1:90),'symbol','k+',...
    'conditions', condition_names,'legend',group_names(1:3),'color',c,...
    'whiskers',0,'scatter',2,'jitter',0,'scattersize',13);
ylabel('Performance');
xl = xlim; xlim([xl(1), xl(2)+1]);    % make more space for the legend


% transparent boxplots with no whiskers and jittered datapoints underneath
subplot(3,2,3)
h = daboxplot(data1,'scatter',2,'whiskers',0,'boxalpha',0.7,...
    'conditions', condition_names); 
ylabel('Performance');
xl = xlim; xlim([xl(1), xl(2)+0.75]);       % make space for the legend
legend([h.bx(1,:)],group_names);            % add the legend manually
set(gca,'FontSize',9);


% different color scheme, a color flip, different outlier symbol
subplot(3,2,4)
h = daboxplot(data2,'groups',group_inx,'conditions', condition_names,...
    'colors',c,'fill',0,'whiskers',0,'scatter',2,'symbol','k*',...
    'outliers',1,'scattersize',16,'flipcolors',1,'boxspacing',1.2,...
    'legend',group_names); 
ylabel('Performance');
xl = xlim; xlim([xl(1), xl(2)+0.75]); % make more space for the legend
set(gca,'FontSize',9);


% different color scheme, data scattered on top
subplot(3,2,5:6)
h = daboxplot(data2,'groups',group_inx,...
    'conditions', condition_names,'colors',c,'whiskers',0,...
    'scatter',1,'scattersize',15,'scatteralpha',0.5,...
    'boxspacing',0.8,'legend',group_names); 
ylabel('Performance');
set(gca,'FontSize',9.5);
xl = xlim; xlim([xl(1), xl(2)+0.2]);    % make more space for the legend


% TIP: to make the plots vertical use camroll(-90)






