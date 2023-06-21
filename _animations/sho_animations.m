close all; clear; clc;


x0 = 1;
v0 = 1;

omega0 = pi/2;

T = 2 * pi / omega0;

t = linspace(0, 12, 1e3);



x = x0 * cos(omega0 * t) + v0 / omega0 * sin(omega0 * t);
v = -x0 * omega0 * sin(omega0 * t) + v0 * cos(omega0 * t);




figure('units', 'pixels', 'position', [20, 20, 400, 400]);

k = 1;

for i = 1:10:length(t)

    plot(t(1:i), x(1:i), 'k', 'LineWidth', 1.2);
    hold on
    scatter(t(i), x(i), 'r', 'filled');
    hold off
    grid on
    xlabel('Time (s)');
    ylabel('Displacement (m)');
    grid on
    xlim([0, 12]);
    ylim([-1.5, 1.5]);

     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{k} = frame2im(currFrame);   
    pause(0.01);
    k = k + 1;
end



%%

filename = "../assets/img/animations/sho_animation.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end

