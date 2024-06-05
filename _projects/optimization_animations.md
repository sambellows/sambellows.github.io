---
layout: page
title: optimization methods
description: 
img: assets/img/animations/GradientDescent.gif
importance: 6
category: signal processing animations
---

Optimization algorithms try to minimize a function.

In gradient descent, the iterative update is related to the local gradient of the objective function
\begin{equation}
\mathbf{x}^{(k+1)} = \mathbf{x}^{(k)} - \mu \nabla J(\mathbf{x}^{(k)}).
\end{equation}

<div class="row">
    <div class = "col-sm">
    </div>
    <div class="col-sm">
        {% include figure.html path="assets/img/animations/GradientDescent.gif" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
        <div class = "col-sm">
    </div>
</div>
<div class="caption">
    Gradient descent algorithm 
</div>

Newton's method uses the Hessian matrix to compute the local curvature. This leads to a more direct descent path. However, computing the Hessian matrix may be difficult for some problems.  
\begin{equation}
\mathbf{x}^{(k+1)} = \mathbf{x}^{(k)} - \mathbf{H}^{-1}(\mathbf{x}^{(k)})\nabla J(\mathbf{x}^{(k)}).
\end{equation}

<div class="row">
    <div class = "col-sm">
    </div>
    <div class="col-sm">
        {% include figure.html path="assets/img/animations/NewtonsMethod.gif" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
        <div class = "col-sm">
    </div>
</div>
<div class="caption">
    Newton's method
</div>
