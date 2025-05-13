close all; clear; clc;




a = 1;
z0 = 1;
N = 35;
k = logspace(-1, 1.5, 60);


[~, ~, T, P] = spherical_gridded_sampling('de', 25);


cnm = rigid_sphere_point_source_efc(N, k, a, z0, 1, pi / 2, 0);

Dff = far_field_directivity_pattern(cnm, T, P);

cmap = load('DIColorMap.dat');



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
filename = "../assets/img/animations/point_source_directivity.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end


