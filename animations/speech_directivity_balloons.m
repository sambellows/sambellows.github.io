close all; clear; clc;


[f, D] = read_ascii_directivity_data('SpeechDirectivity.csv');





[t, p, T, P] = spherical_gridded_sampling('de', 17);

amn = sphericalharmonic_coefficients(D, T, P, 15, 'ch', 'multiband');
for band = 1:21
    amnr(:,:,band) = wignerRotate(amn(:,:,band), 0, -pi/2, 0);
    amnr(:,:,band) = wignerRotate(amnr(:,:,band), pi, 0, 0);
end

D = sphericalharmonic_expand(T, P, amnr);


%%

figure('Units', 'inches', 'position', [1, 1, 15, 7]);
for fr = 1:21

    ax(fr) = subplot(3, 7, fr);
    h = plot_directivity_balloon(D(:,:,fr), T, P);
    delete(h.colorbar);
    tt = title(sprintf('%d Hz', f(fr)), 'FontSize', 14);
    tt.Position = tt.Position + [0, 0, -10];



end
pause(0.01);

for fr = 1:21

    ax(fr).Position = ax(fr).Position + [-0.05, -0.1, 0.07, 0.07];

end




