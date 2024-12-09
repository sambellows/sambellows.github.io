close all; clear; clc;



h = @(t) heaviside(t) .* exp(-t);
x = @(t) heaviside(t) .* exp(-2 * t);

t = linspace(-1, 10);

y = zeros(size(t));

a = -10;
b = 10;

integrand = @(tau, t, x, h) x(tau) .* h(t - tau);


for i = 1:length(t)
    
    y(i) = integral(@(tau) integrand(tau, t(i), x, h), a, b);

end

%%

plot(t, y);
hold on
plot(t, heaviside(t) .* (exp(-t) - exp(-2 * t)), 'k--');
hold off


%%

h = @(t) heaviside(t) .* exp(-2 * t);
x = @(t) heaviside(t) .* exp(-1 * t) .* abs(cos(2 * t));

t = linspace(-1, 10, 500);

y = zeros(size(t));

a = -10;
b = 20;

for i = 1:length(t)
    
    y(i) = convolution_integral(x, h, t(i), a, b);

end


plot(t, y);
hold off
