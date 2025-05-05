close all; clear; clc;




a = 1;
rho = linspace(0, a);
phi = linspace(0, 2 * pi);

[R, P] = ndgrid(rho, phi);




[Psi, kn, N] = ef_circular_plate(R, P, a, 3, 3, 1);


cmap = load('DIColorMap.dat');

[X, Y] = polar2cartesian(R, P);


%%
figure('units', 'pixels', 'position', [20, 20, 400, 400]);

ind = 10;

for i = 1:60

    h = surf(X, Y, real(Psi(:,:,ind) * exp(1j * i / 60 * 2 * pi)))
    hold on;
 %   plot3(cos(phi), sin(phi), real(Psi(end,:,ind) * exp(1j * i / 60 * 2 * pi)), 'k', 'LineWidth', 1);
    %shading interp
    h.EdgeAlpha = 0.1;
    view(30, 50);
    caxis([-0.5, 0.5]);
    colormap(cmap);
    hold off;
    axis off
    zlim([-1, 1]);
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end


%%
filename = "../assets/img/animations/circular_plate_22.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end


