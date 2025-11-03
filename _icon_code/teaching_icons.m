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

%% Signals and Circuits


color = [88, 166, 255] / 255;


close all;
figure('units', 'pixels', 'position', [20, 20, 400, 400]);
grid on
axis off
hold on
t = linspace(0, 2 * pi - pi/4, 1e3);

t0 = 0;
t1 = 2 * pi - pi / 4;
f = 4;
phi = 1;
x = f / 10 * t / pi + 0.1 + 0.1 * cos(f * t - pi) - 0.45;
y = 0.2 * sin(f * t);
% y(t < -0.635) = 0;
% x(t < -0.635) = 0.6 * t(t < -0.635);
% y(t > 0.5) = 0;

plot(x, y, 'color', color, 'LineWidth', 2);
hold on
plot([-0.8, -0.45], [0, 0], 'color', color, 'LineWidth', 2);
plot([0.45, 0.8], [0, 0], 'color', color, 'LineWidth', 2);
plot([-1, 1, 1, -1, -1], [-1, -1, 1, 1, -1], 'k', 'LineWidth', 2)
ylim([-1, 1]);


exportgraphics(gcf, '../assets/img/teaching/signalscircuits.jpg');


%% Physics


color = [88, 166, 255] / 255;


close all;
figure('units', 'pixels', 'position', [20, 20, 400, 400]);
grid on
axis off
hold off
x = linspace(-0.5, 0.5);
x1 = linspace(-0.5, 0.2);

y = -4 * x.^2 + 1 - 0.3;
y1 = -4 * x1.^2 + 1 - 0.3;


plot(x, y, ':', 'color', color, 'LineWidth', 1.2);
hold on
plot(x1, y1, '-', 'color', color, 'LineWidth', 2);
plot([-0.8, -0.5], [0, 0] - 0.3, 'color', color, 'LineWidth', 2);
plot([0.5, 0.8], [0, 0] - 0.3, 'color', color, 'LineWidth', 2);
plot([-1, 1, 1, -1, -1], [-1, -1, 1, 1, -1], 'k', 'LineWidth', 2)
ylim([-1, 1]);
hold off
axis off


exportgraphics(gcf, '../assets/img/teaching/physics1.jpg');



%% Physics II


color = [88, 166, 255] / 255;


close all;
figure('units', 'pixels', 'position', [20, 20, 400, 400]);
grid on
axis off
hold off

theta = linspace(0, 2 * pi, 1e3);

r0 = [0.2, 0.5, 1, 2, 5, 10, 50]';
r = r0 .* cos(theta).^2;

[x, y] = polar2cartesian(r, theta);

plot(x', y', '-', 'color', color, 'LineWidth', 1.2);
hold on
plot([-1, 1, 1, -1, -1], [-1, -1, 1, 1, -1], 'k', 'LineWidth', 2)
ylim([-1, 1]);
xlim([-1, 1]);
hold off
axis off


exportgraphics(gcf, '../assets/img/teaching/physics2.jpg');

