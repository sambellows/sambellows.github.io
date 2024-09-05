close all; clear; clc;



t = linspace(-1, 3, 1e4);

s = -1 + 10j;

h = real(heaviside(t) .* exp(s * t));

figure('units', 'pixels', 'position', [20, 20, 400, 400]);
plot(t, h, 'r', 'LineWidth', 1.2);
grid on
axis off
hold on
plot([-1, 3, 3, -1, -1], [-1, -1, 2, 2, -1], 'k', 'LineWidth', 2)
ylim([-1, 2]);

exportgraphics(gcf, '../assets/img/teaching/signalssystems.jpg');
