close all; clear; clc;

close all; clear; clc;


%% convolution 1
close all;
figure('units', 'inches', 'position', [1, 1, 5, 9]);


color = [88, 166, 255] / 255;

n = -20:20;

h = (0.7).^n;
h(n < 0) = 0;
ht = h(n >= 0);

x1 = zeros(size(n));
x1(n == 0) = 1;
y1 = conv(x1, ht);
y1 = y1(1:length(x1));

x2 = zeros(size(n));
x2(n == 5) = 1.5;
y2 = conv(x2, ht);
y2 = y2(1:length(x2));

x3 = x2 + x1;
y3 = conv(x3, ht);
y3 = y3(1:length(x3));

subplot(3, 2, 1)
stem(n, x1, 'k', 'filled','MarkerSize', 3);
grid on
ylim([-1, 2]);
xlabel('$n$');
ylabel('$x[n]$');

subplot(3, 2, 2)
stem(n, y1, 'k', 'filled','MarkerSize', 3);
grid on
ylim([-1, 2]);
xlabel('$n$');
ylabel('$y[n]$');

subplot(3, 2, 3)
stem(n, x2, 'k', 'filled','MarkerSize', 3);
grid on
ylim([-1, 2]);
xlabel('$n$');
ylabel('$x[n]$');

subplot(3, 2, 4)
stem(n, y2, 'k', 'filled','MarkerSize', 3);
grid on
ylim([-1, 2]);
xlabel('$n$');
ylabel('$y[n]$');


subplot(3, 2, 5)
stem(n, x3, 'k', 'filled','MarkerSize', 3);
grid on
ylim([-1, 2]);
xlabel('$n$');
ylabel('$x[n]$');

subplot(3, 2, 6)
stem(n, y3, 'k', 'filled','MarkerSize', 3);
grid on
ylim([-1, 2]);
xlabel('$n$');
ylabel('$y[n]$');


exportgraphics(gcf, '2_convolution_intro.jpg', 'resolution', 300);



%% convolution gif
close all;
figure('units', 'inches', 'position', [1, 1, 9, 4], 'color', 'w');


color = [88, 166, 255] / 255;
n = -5:40;

h = (0.7).^n;
h(n < 0) = 0;
ht = h(n >= 0);

x = (0.9).^n .* cos(n/3);
x(n < 0) = 0;

xl = [-5, 40];

subplot(2, 3, 1)
stem(n, x, 'k', 'filled','MarkerSize', 3);
grid on
ylim([-1, 2]);
xlim(xl);
xlabel('$n$');
title('$x[n]$');

subplot(2, 3, 2)
stem(n, h, 'k', 'filled', 'MarkerSize', 3);
grid on
ylim([-1, 2]);
xlim(xl);
xlabel('$n$');
title('$h[n]$');

subplot(2, 3, 3)
stem(n, filter(ht, 1, x), 'k', 'filled', 'MarkerSize', 3);
grid on
ylim([-1, 2]);
xlim(xl);
xlabel('$n$');
title('$y[n]$');





yc = zeros(size(x));
for nn = n
    
    subplot(2, 3, 4)
    stem(n, x, 'k', 'filled','MarkerSize', 3);
    hold on
    scatter(nn, x(nn == n), 30, color, 'LineWidth', 2);
    hold off
    grid on
    ylim([-1, 2]);
    xlim(xl);
    xlabel('$n$');
    title(sprintf('$x[%d]$', nn));
    
    
    hc = x(nn == n) * (0.7).^(n - nn);
    hc(n < nn) = 0;
    subplot(2, 3, 5)
    stem(n, hc, 'filled','MarkerSize', 3,'color', color);
    hold off
    grid on
    xlim(xl);
    ylim([-1, 2]);
    xlabel('$n$');
    if nn < 0
        title(sprintf('$x[%d]h[n + %d]$', nn, abs(nn)));
    else
        title(sprintf('$x[%d]h[n - %d]$', nn, nn));
    end
    
    yc = yc + hc;
    
    subplot(2, 3, 6);
    stem(n, yc, 'k', 'filled','MarkerSize', 3);  
       hold off
    grid on
    xlim(xl);
    ylim([-1, 2]);
    xlabel('$n$');
    if nn < 0
        title(sprintf('$\\sum_{m=-\\infty}^{-%d} x[%d]h[n + %d]$', abs(nn), nn, abs(nn)));
    else
        title(sprintf('$\\sum_{m=-\\infty}^{%d} x[%d]h[n-%d]$', nn, nn, nn));
    end
    
    
    if nn == n(1)
    gif('../assets/img/animations/convolution.gif', 'overwrite', true);
    else
    gif;
    end
   
end

%% convolution icon
figure('units', 'pixels', 'position', [20, 20, 400, 400]);
for nn = n
   
    ycp = yc;
    ycp(n > nn) = 0;
    stem(n, ycp, 'k', 'filled','MarkerSize', 3);  
       hold off
    grid on
    xlim(xl);
    ylim([-1, 2]);
    xlabel('$n$');
    axis off
    
    if nn == n(1)
    gif('../assets/img/animations/convolution_icon.gif', 'overwrite', true);
    else
    gif;
    end
   
end



%% Graphical Convolution


close all;
figure('units', 'inches', 'position', [1, 1, 6, 16/3], 'color', 'w');

t = linspace(-3, 3, 3001);

x = @(t) heaviside(t + 1) - heaviside(t - 1);

h1 = @(t) (heaviside(t) - heaviside(t - 1));
h2 = @(t) (heaviside(t) - heaviside(t - 1)) .* (1 - t);
h3 = @(t) exp(-4 * t.^2);

y = zeros(length(t),3);

a = -2;
b = 2;

integrand = @(tau, t, x, h) x(tau) .* h(t - tau);


for i = 1:length(t)    
    y(i,1) = integral(@(tau) integrand(tau, t(i), x, h1), a, b,...
        'Waypoints', [0, 1, 2, 3]);

    y(i,2) = integral(@(tau) integrand(tau, t(i), x, h2), a, b,...
        'Waypoints', [0, 1, 2, 3]);

    y(i,3) = integral(@(tau) integrand(tau, t(i), x, h3), a, b,...
        'Waypoints', [0, 1, 2, 3]);
end

for j = 1:3
    y(:,j) = movmedian(y(:,j), 5);
end

h = {h1, h2, h3};

for i = 1:3
subplot(4, 3, i)
plot(t, x(t), 'k', 'LineWidth', 1);
grid on
ylim([-1, 2]);
xlim([-3, 3]);
ylabel('$x(t)$');

subplot(4, 3, 3 + i)
plot(t, h{i}(t), 'k', 'LineWidth', 1);
grid on
xlim([-3, 3]);
ylim([-1, 2]);
ylabel('$h(t)$');

end

dt = 25 * (t(2) - t(1));
dt = 0.1;
tau = -2;


for i = 1:50
    
    tau = tau + dt;

    
    

    for j = 1:3

        hf = h{j}(tau - t);
        subplot(4, 3, 6 + j)
        plot(t, x(t), 'k', 'LineWidth', 1);
        hold on
        plot(t, hf, 'color', color, 'LineWidth', 1);
        grid on   
        hold off
        xlim([-3, 3]);
        ylim([-1, 2]);
        ylabel('$x(t), h(\tau - t)$');

        subplot(4, 3, 9 + j);
        plot(t(t <= tau), y(t <= tau,j), 'k', 'LineWidth', 1);
        grid on
        xlim([-3, 3]);
        ylim([-1, 2]);
        xlabel('$t$');
        ylabel('$y(t)$');

    end

    if i == 1
        gif('../assets/img/animations/boxcars.gif', 'overwrite', true,...
            'DelayTime', 4/15);
    else
        gif();
    end


end


%% Graphical Convolution

close all;
figure('units', 'inches', 'position', [1, 1, 3, 8], 'color', 'w');

t = linspace(-3, 3, 3001);

x = @(t) heaviside(t + 1) - heaviside(t - 1);

h = @(t) (heaviside(t) - heaviside(t - 1)) .* (1 - t);


y = zeros(size(t));

a = -2;
b = 2;

integrand = @(tau, t, x, h) x(tau) .* h(t - tau);


for i = 1:length(t)
    
    y(i) = integral(@(tau) integrand(tau, t(i), x, h), a, b,...
        'Waypoints', [0, 1, 2, 3]);

end

y = movmedian(y, 5);





subplot(4, 1, 1)
plot(t, x(t), 'k', 'LineWidth', 1);
grid on
ylim([-1, 2]);
xlim([-3, 3]);
ylabel('$x(t)$');

subplot(4, 1, 2)
plot(t, h(t), 'k', 'LineWidth', 1);
grid on
xlim([-3, 3]);
ylim([-1, 2]);
ylabel('$h(t)$');

dt = 25 * (t(2) - t(1));
dt = 0.05;
tau = -2;


for i = 1:100
    
    tau = tau + dt;

    
    hf = h(tau - t);

    subplot(4, 1, 3)
    plot(t, x(t), 'k', 'LineWidth', 1);
    hold on
    plot(t, hf, 'r', 'LineWidth', 1);
    grid on   
    hold off
    xlim([-3, 3]);
    ylim([-1, 2]);
    ylabel('$x(t), h(\tau - t)$');

    subplot(4, 1, 4);
    plot(t(t <= tau), y(t <= tau), 'k', 'LineWidth', 1);
    grid on
    xlim([-3, 3]);
    ylim([-1, 2]);
    xlabel('$t$');
    ylabel('$y(t)$');

    if i == 1
        gif('../assets/img/animations/trianglecar.gif', 'overwrite', true);
    else
        gif();
    end


end


%% Graphical Convolution

close all;
figure('units', 'inches', 'position', [1, 1, 3, 8], 'color', 'w');

t = linspace(-3, 3, 3001);

x = @(t) heaviside(t + 1) - heaviside(t - 1);

h = @(t) exp(-4 * t.^2);



y = zeros(size(t));

a = -2;
b = 2;

integrand = @(tau, t, x, h) x(tau) .* h(t - tau);


for i = 1:length(t)
    
    y(i) = integral(@(tau) integrand(tau, t(i), x, h), a, b,...
        'Waypoints', [0, 1, 2, 3]);

end

y = movmedian(y, 5);





subplot(4, 1, 1)
plot(t, x(t), 'k', 'LineWidth', 1);
grid on
ylim([-1, 2]);
xlim([-3, 3]);
ylabel('$x(t)$');

subplot(4, 1, 2)
plot(t, h(t), 'k', 'LineWidth', 1);
grid on
xlim([-3, 3]);
ylim([-1, 2]);
ylabel('$h(t)$');

dt = 25 * (t(2) - t(1));
dt = 0.05;
tau = -2;


for i = 1:100
    
    tau = tau + dt;

    
    hf = h(tau - t);

    subplot(4, 1, 3)
    plot(t, x(t), 'k', 'LineWidth', 1);
    hold on
    plot(t, hf, 'r', 'LineWidth', 1);
    grid on   
    hold off
    xlim([-3, 3]);
    ylim([-1, 2]);
    ylabel('$x(t), h(\tau - t)$');

    subplot(4, 1, 4);
    plot(t(t <= tau), y(t <= tau), 'k', 'LineWidth', 1);
    grid on
    xlim([-3, 3]);
    ylim([-1, 2]);
    xlabel('$t$');
    ylabel('$y(t)$');

    if i == 1
        gif('../assets/img/animations/gausscar.gif', 'overwrite', true);
    else
        gif();
    end


end


%%









