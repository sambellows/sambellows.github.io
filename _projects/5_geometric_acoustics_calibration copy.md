---
layout: page
title: GA model calibration
description: architectural acoustics
img: assets/img/projects/raytracing_diagram.png
importance: 3
category: work
---


Geometric acoustics simulations are used across areas of architectural acoustics for improved sound design. Nonetheless, an important aspect of creating a numerical model is selecting material properties so that measured data agrees with the simulation input. One area of my research is to generate numerical methods to calibrate geometric acoustics models. 

Geometric acoustics (GA) models use principles of specular and diffuse reflections to predict the temporal energetic response of a room. Methods can include ray tracing, beam or cone tracing, and image-source methods to determine ray paths between a source and receiver. In modeling sound propagation, random incidence absorption coefficients determine the amount of energy lost at each reflection while random incidence scattering coefficients influence the trajectory at each reflection. The cumulation of many rays and leads to the echogram, an energetic description of the energy decay in the room. 


<div class="row">
    <div class = "col-sm">
    </div>
    <div class= "col-sm">
        {% include figure.html path="assets/img/projects/raytracing_diagram.png" title="gong" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class = "col-sm">
    </div>
</div>
<div class="caption">
    Simple geometrical acoustics model. The red line indicates a single ray path from the source to the receiver. 
</div>


Many room acoustic metrics, including reverberation time and clarity, may be calculated from the echogram, which may be written as follows:

\begin{equation}
E(t) = \sum_{m = 1}^M W_m\left(\prod_{n = 1}^N (1 - \alpha_n)^{p_{nm}}\right)\delta(t - \tau_m)
\end{equation}
with $$M$$ being the number of rays, $$W_m$$ being the amplitude of the $$m$$th ray, $$N$$ being the number of surfaces $$\alpha_n$$ being the absorption coefficient for the $$n$$th surface, and $$\tau_m$$ being the impact time of the $$m$$th ray. The integer $$p_{nm}$$ represents the number of times the $$m$$th ray hit the $$n$$th surface. 

Because the echogram is a function of the absorption coefficients, one can calculate its gradient as
\begin{equation}
\frac{\partial E}{\partial \alpha_n}  = -\sum_{m = 1}^M \frac{p_{nm}}{(1 - \alpha_n)} W_m\left(\prod_{n = 1}^N (1 - \alpha_n)^{p_{nm}}\right)\delta(t - \tau_m).
\end{equation}
Using this expression, one may use a gradient-descent algorithm to iteratively adjust the absorption coefficients as
\begin{equation}
\alpha_n^{(k+1)} = \alpha_n^{(k)} - \mu (\tilde{C}^{(k)} - C)\frac{\partial}{\partial \alpha_n}\tilde{C}^{(k)}.
\end{equation}
where $$C$$ is some meaasured room acoustics metric, $$\tilde{C}$$ is its simulated value, and $$k$$ is the iteration step. 


