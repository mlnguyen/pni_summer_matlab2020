
%% Problem 1

% Load behavioral scores
data = load('scores.mat');

% Null hypothesis: no difference in scores between pretest and posttest
% Alternate hypothesis: scores are different in pretest and posttest
% t(19) = 10.35, p = 3x10^-9
[h, p, ci, stats] = ttest(data.posttest, data.pretest);

% Calc summary statistics
pre_mean = mean(data.pretest); %.49
post_mean = mean(data.posttest); %.87
pre_std = std(data.pretest); %.12
post_std = std(data.posttest); %.17

% Plot summary stats
figure('color', 'w', 'name', 'Student scores', 'position', [350 160 420 530]); 
hold on;
bar([1,2], [pre_mean, post_mean]);
errorbar([1,2], [pre_mean, post_mean], [pre_std, post_std], 'linestyle', 'none', ...
    'color', 'r', 'linewidth', 2);

set(gca, 'xtick', [1,2], 'xticklabel', {'Pretest', 'Posttest'}, 'fontsize', ...
    12);
ylabel('Score', 'fontsize', 16);
title('Student scores', 'fontsize', 20);

% Save figure
saveas(gcf, 'student_scores.png');

% Results: Students significantly improved their score from pre-test to
% post-test (t(19) = 10.35, p<.001) from a mean score of 0.49 (STD = 0.12)
% in the pre-test to a mean score of 0.87 (STD=0.17) in the post-test.


%% Problem 2

% Load data
roi_data = load('roidata.mat');

% Calculate ISC: corr each subj with the teacher
nSubs = size(roi_data.student_data,1);

isc_r = NaN(1,nSubs);
for i = 1:nSubs
    isc_r(i) = corr(roi_data.student_data(i,:)', roi_data.teacher_data');
end

% Calculate ISC: take average corr values
isc = mean(isc_r); %0.056
isc_std = std(isc_r); %0.053

% Plot average student and teacher ts
figure('color', 'w', 'name', 'Dorsal precuneous student and teacher timeseries');
hold on;

plot(zscore(mean(roi_data.student_data,1)), 'b');
plot(zscore(roi_data.teacher_data), 'g');

% Add legend, labels
legend({'Student', 'Teacher'}, 'fontsize', 12);
xlabel('TR (1.5s', 'fontsize', 14);
ylabel('% signal change', 'fontsize', 14);
title('Avg student and teacher timeseries in dPrecun', 'fontsize', 18);

% Add ISC as text annotation
text(100, -3, ['isc = ' num2str(isc,4) ', std = ', num2str(isc_std,4)],...
    'fontsize', 12);

% save
saveas(gcf, 'dpcun_isc.png');

%% Problem 3

% Corr change in score with teacher-student isc
% r = .7139 p<.001
score_diff = (data.posttest - data.pretest)';
[r,p] = corr(score_diff, isc_r');

% Linear regression
Y = score_diff;
X = [ones(size(Y)), isc_r'];
[b, ci, ~, ~, stats] = regress(Y, X);

% Plot
figure('color', 'w', 'name', 'Scores-Behav corr'); hold on;

% Plot scatter
plot(isc_r, score_diff, 'bo', 'markerfacecolor', 'b', 'markersize', 12);

% Plot regression line
x_vals = [-.08:.01: .12];
y_vals = b(1) + b(2)*x_vals;
plot(x_vals, y_vals, 'r', 'linewidth', 2);

% Add text with stats
text(-.06, .55, ['r = ' num2str(r, 3) ', p = ' num2str(p,3)], 'fontsize', 12);
text(-.06, .52, ['b0 = ' num2str(b(1), 3) ', b1 = ' num2str(b(2),3)], ...
    'fontsize', 12);

% Add labels
set(gca, 'fontsize', 12, 'ylim', [0 .63])
xlabel('Teacher-Student ISC (r)', 'fontsize', 14);
ylabel('Posttest-Pretest Score', 'fontsize', 14);
title('ISC-Score correlation in DPcun', 'fontsize', 18);

% Save
saveas(gcf, 'isc_behav_corr.png');

% Results: Teacher-student ISC is significantly correlated with learning
% outcomes (r=0.71, p<.001). A linear regression model showed that
% Teacher-Student ISC explained 51% of the variance in learning (F = 18.72,
% p<.001).

%% Bonus:

% Set the number of iterations
nIters = 10000;

% Initialize null distribution
r_null = NaN(1,nIters);

% For each iteration, shuffle the order of scores. Recalc correlation and
% save to the r_null
for i = 1:nIters
    
    % Shuffle scores
    shuff_order = randperm(nSubs);
    shuff_diff = score_diff(shuff_order);
    
    % Calc null r
    r_null(i) = corr(shuff_diff, isc_r');
        
end

% Plot null distribution with observed r
figure('color', 'w', 'name', 'shuff null'); hold on;
histogram(r_null, 100, 'normalization', 'probability');
plot([r r], [0 .03], 'r', 'linewidth', 2);
title('Shuff distribution of null r-values', 'fontsize', 14);
saveas(gcf, 'shuffled_r_null.png')

% Count number of null values greater than observed r
null_larger = sum(r_null > r);

% Convert to p-value by dividing by nIters: p = .0003
p_shuff = null_larger / nIters;









