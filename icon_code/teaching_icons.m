close all; clear; clc;

color = [88, 166, 255] / 255;

t = linspace(-1, 3, 1e4);

s = -1 + 10j;

h = real(heaviside(t) .* exp(s * t));

figure('units', 'pixels', 'position', [20, 20, 400, 400]);
plot(t, h, 'color', color, 'LineWidth', 2);
grid on
axis off
hold on
plot([-1, 3, 3, -1, -1], [-1, -1, 2, 2, -1], 'k', 'LineWidth', 2)
ylim([-1, 2]);

exportgraphics(gcf, '../assets/img/teaching/signalssystems.jpg');


%%


t = linspace(-1, 0);
close all;
figure('units', 'pixels', 'position', [20, 20, 400, 400]);
grid on
axis off
hold on
t = -0.8:0.1:0.8;
n = round(t * 10);
y = -0.15 * (heaviside(t - 0.35) - heaviside(t + 0.35)) .* (-1).^(-n);
t(t == -0.4) = -0.35;
t(t == 0.4) = 0.35;
plot(t, y, 'color', color, 'LineWidth', 2);
hold on
plot([-1, 1, 1, -1, -1], [-1, -1, 1, 1, -1], 'k', 'LineWidth', 2)
ylim([-1, 1]);

exportgraphics(gcf, '../assets/img/teaching/introece.jpg');
