close all; clear; clc;

% don't know where the original code is hiding at, this is for an icon

figure('units', 'pixels', 'position', [20, 20, 200, 200]);

color = [88, 166, 255] / 255;

t = linspace(-2, 2);

tau = linspace(-1.5, 0, 10);

for i = 1:length(tau)

    plot(t, t.^2, 'k', 'linewidth', 2);
    hold on
    scatter(tau(i), tau(i).^2, 50, color, 'filled');
    %quiver(tau(i), tau(i).^2, -tau(i)^2, tau(i), 'k');
    hold off
    axis off
   
    
    if i == 1
    gif('../assets/img/animations/optimization_icon.gif', ...
        'overwrite', true, 'delaytime', 0.2);
    else
    gif;
    end
   
end