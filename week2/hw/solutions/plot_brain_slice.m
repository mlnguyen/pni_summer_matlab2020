
function plot_brain_slice(view, slice_ind)
% function plot_brain_slice(view, slice_ind)
%
% Visualize a brain slice from the MNI152 2mm brain on a new figure. View
% can be sagittal, coronal, or axial, and the slice numbers can range
% between 1-91 for sagittal and axial slices and 1-109 for coronal slices.
%
% ARGUMENTS:
%   -view: string specifying brain view
%   -slice_ind: int specifing slice number
%
% EXAMPLE:
% >>plot_brain_slice('sagittal', 45);


% Load MNI brain
load('MNI152_T1_2mm_brain.mat');

% Select slice based on view and slice_ind
switch view
    case 'sagittal'
        brain_slice = squeeze(nifti_img(slice_ind,:,:));
        
    case 'coronal'
        brain_slice = squeeze(nifti_img(:,slice_ind,:));

    case 'axial'
        brain_slice = squeeze(nifti_img(:,:,slice_ind));
        
    otherwise
        error([view ' is not a valid slice view']);
end

% Visualize
figure('color', 'w'); colormap gray;
imagesc(flipud(brain_slice'));
title(['view:' view ', slice: ' num2str(slice_ind)]);