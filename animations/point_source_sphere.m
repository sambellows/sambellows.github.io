close all; clear; clc;




a = 1;
z0 = 1;
N = 20;
k = 5;


r = linspace(1.01 * a, 4 * a, 200);
phi = linspace(0, 2 * pi, 200);

[R, P] = ndgrid(r, phi);
T = pi / 2 * ones(size(R));
[X, Y, Z] = spherical2cartesian(R, T, P);

cnm = rigid_sphere_point_source_efc(N, k, a, z0, 1, pi / 2, 0);

pressure = hels_spherical_expand(cnm, k, R, T, P);

pressure = 20 * pressure ./ max(pressure(:));
cmap = load('DIColorMap.dat');



%%
figure('units', 'pixels', 'position', [20, 20, 400, 400]);


for i = 1:60

    surf(X, Y, Z, real(pressure * exp(1j * i / 60 * 2 * pi)))
    hold on
    plot3(cos(phi), sin(phi), ones(size(phi)), 'k', 'LineWidth', 2);
    shading interp
    view(0, 90);
    caxis([-1, 1]);
    colormap(cmap);
    axis off
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end


%%
filename = "../assets/img/animations/point_source.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end


