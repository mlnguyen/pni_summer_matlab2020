
% load sarah's data
data = load('/Users/Mai/Projects/teaching/matlab/data/sarah_motor_adaptation/HutterTaylorData.mat');
data = data.data;




% analyses:
% 1. for each consistency level, calculate correlation between imposed
% rotation (the offset between what you see and your hand motion determined
% by the experimenter) and implicit adaptation or explicit reaiming
% 2. for each consistency level, fit a linear regression model between
% imposed rotation and implicit adaptation/explicit reaiming. Test slopes
% and intercepts for significance.

%% Data wrangling: get mean per subject per rotation per condition
% set exp params
nSubs = 20;
trial1 = 9;
rot = [-16, -8, -4, -2, 0, 2, 4, 8, 16];
groups = {'OneConsistent', 'TwoConsistent', 'ThreeConsistent', 'SevenConsistent'};
mini_block_size = [1, 2, 3, 7];

% Pre-allocate memory for implied angle mean and explici aim mean
imp_mean = NaN(length(groups), nSubs, length(rot));
aim_mean = NaN(length(groups), nSubs, length(rot));

% Iterate through groups (consistent levels) and subs within groups
for groupN = 1:length(groups)
    for subN = 1:nSubs
        
        % get data for this subject and group,  crop practice trials
        sub_rot = data.rotation.(groups{groupN})(subN,trial1:end);
        sub_imp = data.implicitAngle.(groups{groupN})(subN,trial1:end);
        sub_aim = data.aimAngle.(groups{groupN})(subN,trial1:end);
        
        % if 1-consistent, then use every trial. Otherwise, use the second
        % trial of each mini block
        if groupN == 1
            trial_inds = 1:length(sub_rot);
        else
            trial_inds = 2:mini_block_size(groupN):length(sub_rot);
        end
              
        % get implicit angle and aim angle for second trial of each mini block
        sub_rot_2nd = sub_rot(trial_inds);
        sub_imp_2nd = sub_imp(trial_inds);
        sub_aim_2nd = sub_aim(trial_inds);
        
        for rotN = 1:length(rot)
            % get inds for this rotation
            rot_inds = find(sub_rot_2nd == rot(rotN));
            
            % get trials and take mean
            imp_mean(groupN, subN, rotN) = nanmean(sub_imp_2nd(rot_inds));
            aim_mean(groupN, subN, rotN) = nanmean(sub_aim_2nd(rot_inds));
        end
                
    end
end

% split data up for ease of analysis + saving
implicit_angle.oneConsistent = squeeze(imp_mean(1,:,:));
implicit_angle.twoConsistent = squeeze(imp_mean(2,:,:));
implicit_angle.threeConsistent = squeeze(imp_mean(3,:,:));
implicit_angle.sevenConsistent = squeeze(imp_mean(4,:,:));

aim_angle.oneConsistent = squeeze(aim_mean(1,:,:));
aim_angle.twoConsistent = squeeze(aim_mean(2,:,:));
aim_angle.threeConsistent = squeeze(aim_mean(3,:,:));
aim_angle.sevenConsistent = squeeze(aim_mean(4,:,:));

exp_params.nSubs_per_group = 20;
exp_params.rotation_angles =  [-16, -8, -4, -2, 0, 2, 4, 8, 16];
exp_params.mini_block_size = [1, 2, 3, 7];

% save
save('lec9/data/motor_adapt_data', 'implicit_angle', 'aim_angle', 'exp_params');


%% Analysis

% correlation
for subN = 1:exp_params.nSubs_per_group
    [r(subN),p] = corr(rot', implicit_angle.sevenConsistent(subN,:)');
end

% regression
b = NaN(exp_params.nSubs_per_group, 2);

for subN = 1:exp_params.nSubs_per_group
    x = [ones(9,1), exp_params.rotation_angles'];
    y = aim_angle.oneConsistent(subN,:)';
    [b(subN,:), ci, resid, ~, stats] = regress(y, x);
end


mean(r)
mean(b)
%%
figure; hold on;
plot(exp_params.rotation_angles, mean(aim_angle.oneConsistent), 'r-o')
plot(exp_params.rotation_angles, mean(aim_angle.twoConsistent), 'g-o')
plot(exp_params.rotation_angles, mean(aim_angle.threeConsistent), 'b-o')
plot(exp_params.rotation_angles, mean(aim_angle.sevenConsistent), '-o', 'color', [1 0 1])
title('Mean explicit aiming');

figure; hold on;
plot(exp_params.rotation_angles, mean(implicit_angle.oneConsistent), 'r-o')
plot(exp_params.rotation_angles, mean(implicit_angle.twoConsistent), 'g-o')
plot(exp_params.rotation_angles, mean(implicit_angle.threeConsistent), 'b-o')
plot(exp_params.rotation_angles, mean(implicit_angle.sevenConsistent), '-o', 'color', [1 0 1])
title('Mean implicit adaptation');


figure; plot(exp_params.rotation_angles, implicit_angle.oneConsistent, 'r-o')

% t-test for significance of slopes






