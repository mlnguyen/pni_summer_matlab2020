
function sag_slice = plot_sagittal_slice(slice_ind)
%function sag_slice = plot_sagittal_slice(slice_ind)
%
% Plots a sagittal slice from the MNI152 2mm brain. The MNI brain .mat file
% must be located in current (working) directory.
%
% ARGUMENTS:
%   -slice_ind: number, between 1-91 
%
% OUTPUTS:
%   -sag_slice: 109x91 matrix containing data from the specified slice
%
% EXAMPLE
%   >>plot_sagittal_slice(10)

% load MNI brain
load('MNI152_T1_2mm_brain.mat');

% get an sagital slice. dims = 109 x 91
sag_slice = squeeze(nifti_img(slice_ind,:,:));

% visualize sag slice
figure; colormap gray;
imagesc(flipud(sag_slice'));


end