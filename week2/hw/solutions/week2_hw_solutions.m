
%% Problem 1
% Visualize brain slice from a specified view and slice number

plot_brain_slice('sagittal', 71)
plot_brain_slice('axial', 71)
plot_brain_slice('coronal', 40)
plot_brain_slice('ax', 38)

%% Problem 2
% Check a participant's age
check_age();

% 22, eligible to participate

% 'nineteen', not a number

% 0, must be at least 18 years old

% 'asdf', not a number

% 18, eligible to participate

% 121, not a valid age

%% Problem 3
% Threshold and analyze behavioral data

% a. Load data
load('behav_data.mat'); whos;

% Get dims of data
size(intact_data) % 22x25, 22 subjects by 25 questions
size(scrambled_data) %20x25, 20 subjects by 25 questions

% b. Split attention ratings by group
attention_inds = attention(:, 2);
attention_intact = attention(attention_inds==1, 1);
attention_scram = attention(attention_inds==0, 1);

% c. Threshold data/test function
[sub_n, data] = threshold_data(intact_data, attention_intact, 2);
[sub_n, data] = threshold_data(scrambled_data, attention_scram, 3);
[sub_n, data] = threshold_data(scrambled_data, attention_scram, 0);

% d. Analyze data
[intact_subs_thresh, intact_data_thresh] = threshold_data(intact_data, ...
    attention_intact, 2);
[scram_subs_thresh, scram_data_thresh] = threshold_data(scrambled_data, ...
    attention_scram, 2);

% Calc percent correct
intact_pcor = sum(intact_data_thresh, 2) / size(intact_data_thresh,2) * 100;
scram_pcor = sum(scram_data_thresh, 2) / size(scram_data_thresh, 2) * 100;

% Find number of subjs
n_intact = length(intact_subs_thresh); % n = 20;
n_scram = length(scram_subs_thresh);   % n = 16

% Calc mean, std, and range for each group
mean_intact = mean(intact_pcor); % mean = 82.6%
std_intact = std(intact_pcor);   % std = 20.9%
min_intact = min(intact_pcor);   % min = 44%
max_intact = max(intact_pcor);   % max = 100%

mean_scram = mean(scram_pcor); % mean = 63.3%
std_scram = std(scram_pcor);   % std = 13.1%
min_scram = min(scram_pcor);   % min = 48%
max_scram = max(scram_pcor);   % max = 96%


