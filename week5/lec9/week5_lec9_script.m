
%% Plotting/getting to know data
% load data
data = load(fullfile('data', 'motor_adapt_data.mat'));


% Take a look at our data
figure('color', 'w'); hold on;
plot(data.exp_params.rotation_angles, mean(data.aim_angle.oneConsistent,1), 'b-o')
plot(data.exp_params.rotation_angles, mean(data.aim_angle.twoConsistent,1), 'r-o')
plot(data.exp_params.rotation_angles, mean(data.aim_angle.threeConsistent,1), 'g-o')
plot(data.exp_params.rotation_angles, mean(data.aim_angle.sevenConsistent,1), 'c-o')
legend({'one', 'two', 'three', 'seven'});
xlabel('rotation angle'); ylabel('explicit aim angle');

% on your own: plot implicit angle (5 min)
figure('color', 'w'); hold on;
plot(data.exp_params.rotation_angles, mean(data.implicit_angle.oneConsistent,1), 'b-o')
plot(data.exp_params.rotation_angles, mean(data.implicit_angle.twoConsistent,1), 'r-o')
plot(data.exp_params.rotation_angles, mean(data.implicit_angle.threeConsistent,1), 'g-o')
plot(data.exp_params.rotation_angles, mean(data.implicit_angle.sevenConsistent,1), 'c-o')
legend({'one', 'two', 'three', 'seven'});
xlabel('rotation angle'); ylabel('implicit angle');

%% Analysis: correlation

% Corr: rotation angle and aim angle for 7-consistent group
[r,p] = corr(data.exp_params.rotation_angles', data.aim_angle.sevenConsistent');

% mean, std
mean(r)
std(r)

% plot individual subject
figure('color', 'w');
plot(data.exp_params.rotation_angles, data.aim_angle.sevenConsistent);

% corr: rotation angle and implicit angle and 7 consistent group
[r,p] = corr(data.exp_params.rotation_angles', data.implicit_angle.sevenConsistent');


%% Analyis: linear regression

% Regression model: predict exlicit aim angle from rotation angle
b = NaN(2, 20);
for i = 1:20
    y = data.aim_angle.sevenConsistent(i,:)';
    x = [ones(length(data.exp_params.rotation_angles),1), data.exp_params.rotation_angles'];
    [b(:,i), ci, resid, ~, stats] = regress(y, x);
end

% mean of our predictors
mean(b,2)

% test for significance of our corr coeffs
[h, p_b0, ~, stats_b0] = ttest(b(1,:));
[b, p_b1, ~, stats_b1] = ttest(b(2,:));


% regression analysis on group 7 but for implicit angle
b = NaN(2, 20);
for i = 1:20
    y = data.implicit_angle.sevenConsistent(i,:)';
    x = [ones(length(data.exp_params.rotation_angles),1), data.exp_params.rotation_angles'];
    [b(:,i), ci, resid, ~, stats] = regress(y, x);
end

% test for significance of our corr coeffs
[h, p_b0, ~, stats_b0] = ttest(b(1,:));
[b, p_b1, ~, stats_b1] = ttest(b(2,:));


