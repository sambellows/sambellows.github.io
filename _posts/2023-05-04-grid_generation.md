---
layout: post
title:  winslow grid generation in curvilinear coordinates
date:   2023-05-4
description: finite-difference grid generation
tags: room-acoustics
categories: mathematical-physics
---

Curvilinear coordinates allow finite-difference methods (FDM) to generlize to more complex geometries. The first step is to numerically evaluate a transform from the physical domain to the computational domain. While the geometry of physical domain can be quite complex, the computational domain is usually a rectangle:


<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/blog/transformation.jpg" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Transformation between the physical domain (RFZ room) and computational domain (rectangle).
</div>

While there are many approaches to creating such a transform, one method is to solve the Winslow system of equations:
\begin{equation}
\alpha x_{\xi\xi} - 2\beta x_{\xi\eta} + \gamma x_{\eta\eta}  = 0 
\end{equation}
\begin{equation}
\alpha y_{\xi\xi} - 2\beta y_{\xi\eta} + \gamma y_{\eta\eta} = 0
\end{equation}
with
\begin{equation}
\alpha = x_\eta^2 + y_\eta^2 \quad \gamma = x_\xi^2 + x_\xi^2 \quad \beta = x_\xi x_\eta + y_\xi y_\eta
\end{equation}
This coupled systems of equations may be solved iteratively to produce the desired grid:
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/blog/rfz_grid_generation.gif" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Iterative solution to Winslow system of equations.
</div>
