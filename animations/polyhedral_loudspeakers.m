close all; clear; clc;




a = 1;
z0 = 1;
N = 25;
k = logspace(0.2, 1.1, 60);


[~, ~, T, P] = spherical_gridded_sampling('de', 17);

R = 100;
Dff = polyhedra_loudspeaker(12, a, pi/10, 1, R, T, P, k, z0, N, 'axial');


%%
figure('units', 'pixels', 'position', [20, 20, 400, 400]);


for i = 1:length(k)

    plot_directivity_balloon(Dff(:,:,i), T, P);
    view(10, 26);
    title(sprintf('$ka = %.2f$', k(i) * a));
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end


%%
filename = "../assets/img/animations/dodec_directivity.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end


%% Comparison between a single driver and 12

a = 0.1;
ac = 0.03;
f = 100:50:5e3;
c = 343;

k = 2 * pi * f / c;

t0 = asin(ac / a);

Dff = polyhedra_loudspeaker(12, a, ac, 1, R, T, P, k, z0, N, 'axial');
cnm = rigid_sphere_axially_vibrating_cap_efc(N, k, a, 1, t0, 1, pi/2, 0);
Dffm = far_field_directivity_pattern(cnm, T, P);

%%
figure('units', 'pixels', 'position', [20, 20, 3 * 400, 400]);

im = [];

for i = 1:length(k)

    subplot(1, 2, 2)
    plot_directivity_balloon(Dff(:,:,i), T, P);
    view(10, 26);
    title(sprintf('RPL \n $%.f Hz $', f(i)), 'FontSize', 14);
    
    
    subplot(1, 2,1)
    plot_directivity_balloon(Dffm(:,:,i), T, P);
    view(10, 26);
    title(sprintf('Single Driver \n $%.f Hz $', f(i)), 'FontSize', 14);   
     set(gcf,'color','w');
     
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end

%%
filename = "../assets/img/animations/rpl_comparison.gif"; % Specify the output file name

fps = 10;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end




