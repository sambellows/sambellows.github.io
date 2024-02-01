close all; clear; clc;


%% Spherical harmonic expansions
close all;
[t, p, T, P] = spherical_gridded_sampling('de', 72);
[~, T, P] = close_spherical_grid(ones(size(T)), T, P);

Y = sphericalharmonic(3, 2, T, P);

figure('units', 'pixels', 'position', [10, 10, 200, 200]);

h = plot_spherical_coordinates(abs(real(Y)), T ,P, sign(real(Y)));
colormap([1, 0, 0;0, 0, 1]);

camlight;
h.DiffuseStrength = 0.99;
exportgraphics(gcf, 'spherical_expansion.png', 'BackgroundColor', 'w');


%%
[f, D] = read_ascii_directivity_data([...
    "C:\Users\bamse\Box\Directivity Research\BYU Scholar's Archive\Speech Directivity\Data\SpeechDirectivity.csv"]);
close all;
[t, p, T, P] = spherical_gridded_sampling('de', 17);
dcs = spherical_cross_sections(D(:,:,21), T, P);

d = 10.^(D(19,:,21)/10);
figure('units', 'pixels', 'position', [10, 10, 200, 200]);
plot_polar_dB(abs(dcs.xz.r).^2, dcs.xz.t);

% exportgraphics(gcf, 'speech_di.png', 'BackgroundColor', 'w');
set(gcf, 'Color', 'w');
saveas(gcf, 'speech_di.png');


%%

im = imread('20220421_145409.jpg');
% 
% imshow(im);
% 
% size(im)
% im = im(1:3400,1:3400,:);
% 
% %%

im = im(1:15:3400,1:15:3400,:);
im = permute(im, [2, 1, 3]);
im = fliplr(im);
imshow(im);
axis equal
imwrite(im, 'trumpet_mute.png');
axis equal

%% ORGAN PIPE 2022

im = imread('organ_pipe_original.JPG');
imshow(im);


im = im(1:15:3000,250:15:3250,:);
im = permute(im, [2, 1, 3]);
im = fliplr(im);
size(im)
imshow(im);
imwrite(im, 'organ_pipe.png');






