%% 1. Go over HW

%% 2. Write your first function
% -write hello function: function/end keyword, function name has to be same
% as file name; code body
% -call the function
%
% - modify function to accept arguments: hello your_name
% - call the function with different examples
%
% - modify to add documentation
% help hello

%% 3. back to keynote for formal def functions




%% 4. Exercise 1
% Go back to your script from HW 1. We?ll modify the script for visualizing
% brain slices into a function

% Write a function called plot_sagittal_slice()
%   One argument: slice index
%   For that index, get the sagittal brain slice and store to a variable
%   Plot sagittal brain slice
%
% Test your function by calling:
%   plot_sagittal_slice(25)
%   plot_sagittal_slice(50)
%   plot_sagittal_slice(60)


% handy dandy script reference
load('MNI152_T1_2mm_brain.mat');

% get an sagital slice. dims = 109 x 91
sag_slice = squeeze(nifti_img(75,:,:));
size(sag_slice)

% visualize sag slice
figure; colormap gray;
imagesc(flipud(sag_slice'));

%% 4B add documentation

%% 5. Outputs and scope
% try to print slice info from #4
% Back to keynote



%% 6. Practice 2
% Write a function to calculate the circumference and area of a circle from a radius r
%   Takes one input, radius
%   Outputs two values, area and circumference
% Test your function:
%   calc_circle(1)
%   calc_circle(.5)
%   calc_circle(66)

%% 7. When to use, best practices
% back in keynote

%% 8. Debug
% use plot_saggital_slices function as an example
% 1. use error messages
% 2. breakpoints and debug mode
% 3. automatically start debugger






