function [subj_num, data_thresh] = threshold_data(scores, threshold_var, threshold)
% function [subj_num, data_thresh] = threshold_data(scores, threshold_var, threshold)
%
% Thresholds data in scores based a threshold variable and min threshold
% value. Data that is equal to or exceeds the threshold is returned.
%
% ARGUMENTS:
%   -scores: nSubs x data matrix, contains subject scores
%   -threshold_var: nSubs x 1 matrix, contains a values for thresholding
%       and organized in same subject order as scores
%   -threshold: number indicating threshold.
%
% OUTPUTS:
%   -subj_num: nSubsThresh x 1, indices of subjects that meet the threshold
%   -data_thresh: nSubsThresh x data matrix, contains subject scores for
%       subjects that exceed threshold.

% Get the subject numbers for subject's whose threshold variable is equal
% to or greater than the threshold
subj_num = find(threshold_var >= threshold);

% Get data for subjects that pass threshold
data_thresh = scores(subj_num,:);
