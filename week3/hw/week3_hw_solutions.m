%% Problem 1

% Load data
% -col2: subject number
% -col3: x coordinate
% -col4: y coordinate
data_struct = csvread('eyetracking/vis_hierarchy_eyetracking.csv',1);

% Specify image file
stim_image = 'eyetracking/img1.jpg';

% Open a new figure
figure('name', 'eyetracking');

% Iterate through subjects
for i = 1:3
    % open a new subplot
    subplot(1,3,i); hold on;
  
    
    % logical selection to get data for subj i
    sub_inds = find(data_struct(:,2) == i);
    sub_data = data_struct(sub_inds,:);
    
    % get x,y coords for subj i
    sub_data_x = sub_data(:,3);
    sub_data_y = sub_data(:,4);
    
    % Display image
    imshow(stim_image); hold on;
    
    % Plot fixation pattern
    plot(sub_data_x, sub_data_y, 'b-o', 'linewidth', 2 )
    
    % Plot first fixation point in green + thicker line
    plot(sub_data_x(1), sub_data_y(1), 'go', 'linewidth', 3)
    
    % Plot last fixation point in red + thicker line
    plot(sub_data_x(end), sub_data_y(end), 'ro', 'linewidth', 3)
    
    % add title
    title(['subject ' num2str(i)], 'fontsize', 12);
end


%% Problem 2

% Set exp params
nSubs = 15;
nROIs = 3;
nTrs = 190;
roiNames = {'rTPJ', 'lTPJ', 'PMC'};

% Load data into a 3D matrix: nSub x nROI x time. 
data = NaN(nSubs, nROIs, nTrs);
for i = 1:nSubs

    % load subject data
    load(fullfile('tom_localizer', ['s' num2str(i) '_roidata.mat']));
    
    % org data
    data(i,:,:) = sub_data;
end
    

% For each ROI, plot the time course of all the subjects. On top of that,
% plot the average time course across subs
for i = 1:nROIs
    
    % get data for this roi
    roi_data = squeeze(data(:,i,:));
    mean_roi_data = mean(roi_data);
    
    % open a figure
    figure('name', roiNames{i}, 'color', 'w'); hold on;
        
    % plot block design
    for j = 1:length(belief)
        rectangle('position', [belief_lag(j), - 6, blockLength, 12], 'edgecolor', ...
            [1 .8 .8], 'facecolor', [1 .8 .8]);
    end
    for j = 1:length(photo)
        rectangle('position', [photo_lag(j), - 6, blockLength, 12], 'edgecolor', ...
            [.8 .8 1], 'facecolor', [.8 .8 1]);
    end   
    % add lines for legend
    plot(belief_lag(j), -6, '-', 'color', [1 .8 .8], 'linewidth', 8);
    plot(photo_lag(j), -6, '-', 'color', [.8 .8 1], 'linewidth', 8);
    
    % plot all the subjects
    plot(roi_data', 'color', [.5 .5 .5]);
    
    % plot average of all subjects
    plot(mean_roi_data, 'k', 'linewidth', 2)
    
    % add labels
    legend({'belief', 'photo'}, 'fontsize', 14);
    set(gca,'fontsize', 12);
    title(['ToM localizer: ' roiNames{i}], 'fontsize', 20);
    xlabel('TRs (1.5s)', 'fontsize', 14);
    ylabel('% signal change', 'fontsize', 14);
    
end
