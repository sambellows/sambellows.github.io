---
layout: page
title: convolution operation
description: 
img: assets/img/animations/convolution_icon.gif
importance: 6
category: signal processing animations
---

The output $$y(t)$$ of a linear, time-invariant system is given by the convolution of its impulse response $$h(t)$$ with the input $$x(t)$$
\begin{equation}
y(t) = \int_{-\infty}^\infty x(\tau) h(t - \tau)d\tau.
\end{equation}
For discrete-time systems, the convolution sum is
\begin{equation}
y[n] = \sum_{m=-\infty}^\infty x[m]h[n-m]
\end{equation}
The sum can be interpreted as the superposition of delayed and scaled impulse responses:
<div class="row">
    <div class="col-sm">
        {% include figure.html path="assets/img/animations/convolution.gif" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Convolution of an input signal with a system impulse response. 
</div>

Another common interpretation of convolution is the graphical approach, where the output is the area under the curve of the product of the input and the time-reversed impulse response:
<div class="row">
    <div class="col-sm">
        {% include figure.html path="assets/img/animations/boxcars.gif" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Convolution of an input signal with a system impulse response. 
</div>
