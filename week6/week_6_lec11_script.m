

% load data
data = load('fisher_iris.mat');

% col1 = sepal length,
% col2 = sepal width
% col3 = petal length
% col4 = petal width


%% Kmeans clustering

% step 1: normalize your data, zscore
% standard normal distribution on your data: mean = 0, std = 0

data_z = zscore(data.meas, [], 1);


% step 2: run kmeans
k = 2;
[clust_ind, clust_centroid, sumd] = kmeans(data_z, k);


% Visualize: 3d plot
color = {'b', 'g'};
figure('color', 'w');
for i = 1:k
    % data for clust i
    data_clust = data_z(clust_ind == i, :);
    
    % plot datapoints in this cluster
    plot3(data_clust(:,1), data_clust(:,2), data_clust(:,3), 'o', ...
        'color', color{i}); hold on;
    
    % plot the centroid
    plot3(clust_centroid(i,1), clust_centroid(i,2), clust_centroid(i,3), ...
        '+', 'color', color{i}, 'markersize', 10, 'linewidth', 5);
end
xlabel('sepal length');
ylabel('sepal width');
zlabel('petal length');

plot3(data_z(:,1), data_z(:,2), data_z(:,3), 'o');


% Visualize: correlation matrix organized by cluster
[order, inds] = sort(clust_ind);

cormat = corr(data.meas(inds,:)');
figure('color', 'w');
imagesc(cormat); colorbar;


%% Hierarchical clustering

% load
data = load('fisher_iris.mat');

% calculate distance between flowers
dist = pdist(data.meas, 'euclidean');

% do hierarchical clustering: linkage
z_avg = linkage(dist, 'average');

% visualize: dendrogram
figure('color', 'w');
dendrogram(z_avg, 0);


% do hierarchical clustering: linkage
z_single = linkage(dist, 'single');

% visualize: dendrogram
figure('color', 'w');
dendrogram(z_single, 0);
title('clustering w single linkage');
