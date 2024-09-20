function y = convolution_integral(x, h, t, a, b)


integrand = @(tau, t, x, h) x(tau) .* h(t - tau);


y = integral(@(tau) integrand(tau, t, x, h), a, b);


end