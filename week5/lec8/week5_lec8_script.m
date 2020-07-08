%% Introduction to data: in matlab

%% Getting to know your data

% reading in data:importdata()
data = importdata('data/pe_learn.csv');
col_headers = data.colheaders;
sub_data = data.data;

% what are the diff cols?
col_pe = 8;
col_lr = 12;
col_risk = 9;
%col_deck = 14;

% reorg data: mean for each subj
% doing stats on the average response for each subject in each condition
% (low vs high risk)

% separately average for low vs high risk - know how to separate data by
% condition -> logical indexing!
high_risk_inds = find(sub_data(:,col_risk) == 1);
low_risk_ind = find(sub_data(:, col_risk) == 0);

sub_data_high = sub_data(high_risk_inds,:);
sub_data_low = sub_data(low_risk_ind, :);

% get average pe and average learning rate for each subject in each high vs
% low risk
nSubs = 136;

sub_pe = NaN(nSubs, 2); % col1 = high risk, col2 = low risk
sub_lr = NaN(nSubs, 2);

for i = 1:nSubs
   % get data for this subject by logical indexing
    sub_inds = find(sub_data_high(:, 1) == i);
    
    % get the data 
    sub_high_pe = sub_data_high(sub_inds,col_pe);
    sub_low_pe = sub_data_low(sub_inds, col_pe);
    sub_high_lr = sub_data_high(sub_inds, col_lr);
    sub_low_lr = sub_data_low(sub_inds, col_lr);
    
    
    % store pe in a matrix
    sub_pe(i, 1) = nanmean(sub_high_pe);
    sub_pe(i, 2) = nanmean(sub_low_pe);
    
    % store average lr in a matrix
    sub_lr(i,1) = nanmean(sub_high_lr);
    sub_lr(i,2) = nanmean(sub_low_lr);
end



% visualize: histograms
% range of values, weird values (outliers)
% what we've done so far is correct? do the average values etc make sense?


% plot hist of prediction err
figure('color', 'w', 'name', 'prediction error means');

subplot(1, 2, 1); 
histogram(sub_pe(:,1), 25);
title('PE in high risk');
set(gca, 'xlim', [0 45]);

subplot(1,2,2);
histogram(sub_pe(:,2),25);
title('PE in low risk');
set(gca, 'xlim', [0 45]);


% plot hist of learning rate
figure('color', 'w', 'name', 'learning rate means');

subplot(1, 2, 1); 
histogram(sub_lr(:,1), 25);
title('LR in high risk');
set(gca, 'xlim', [-.75 1.5]);

subplot(1,2,2);
histogram(sub_lr(:,2),25);
title('LR in low risk');
set(gca, 'xlim', [-.75 1.5]);




%% Gauassian/normal distributions: back to matlab

%% Descriptive statistics
% for each group, mean/median/std

% means, std for PE
% PE high: mean = 30.6, std = 2.97
% PE low: mean = 17.8, std = 3.44
pe_mean_high = nanmean(sub_pe(:,1));
pe_mean_low = nanmean(sub_pe(:,2));
pe_std_high = nanstd(sub_pe(:,1));
pe_std_low = nanstd(sub_pe(:,2));



% means, std for LR
% LR high: mean = .26, std = .25
% LR low: mean = .43, std = .332
lr_mean_high = nanmean(sub_lr(:,1));
lr_mean_low = nanmean(sub_lr(:,2));
lr_std_high = nanstd(sub_lr(:,1));
lr_std_low = nanstd(sub_lr(:,2));

%% One-sample t-tests: back to matlab

%% Do one-sample t-tests
% Is learning rate diff form 0 in the low and high risk conditions?
[h, p, ci, stats] = ttest(sub_lr(:,1), 'alpha', .05);


% Is learning rate diff form 0 in the low risk conditions?
[h, p, ci, stats] = ttest(sub_lr(:,2))



%% Two-sample t-tests: back to matlab

%% Do two-sample t-tests
% Is learning rate different in low vs high rate condition?
diff_lr = sub_lr(:,2) - sub_lr(:,1);

[h, p, ci, stats] = ttest(diff_lr)







%% write up and visualize your results: back to kyenote

%% write up and visualize yoru results: make bar pltos\

figure('color', 'w', 'name', 'learning rate'); hold on;

bar([1,2], [lr_mean_low lr_mean_high]);

errorbar([1,2],[lr_mean_low lr_mean_high], [lr_std_low/sqrt(nSubs), ...
    lr_std_high/sqrt(nSubs)], 'linestyle', 'none', 'linewidth', 2)

xlabel('Risk groups'); ylabel('Learning rate');
set(gca, 'xtick', [1 2], 'xticklabel', {'Low', 'High'});






