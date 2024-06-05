---
layout: page
title: image source methods
description: 
img: assets/img/animations/image_source_intro.gif
importance: 4
category: acoustics animations
---


One method for determing the radiated sound field interacting with boundaries is by using image source techniques. Image source methods judiciously place "fictitous" sources outside the domain to create the desired boundary conditions. For example, to model the effects of a single, rigid-walled boundary, one can place an image source an equal distance from the boundary as the original source. Superposing both waves gives the desired field.


<div class="row">
    <div class="col">
    </div>
    <div class="col-8">
        {% include figure.html path="assets/img/animations/image_1d_single.gif" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col">
    </div>
</div>
<div class="caption">
    Method of images for a single boundary. Left: traveling wave unimpeded by boundary. Center: traveling wave and its image source. Right: Superposition of incident and image source's fields. 
</div>

The method works for multiple boundaries as well. However, even in the 1-dimensional case, two parallel boundaries require an inifinte number of image sources to account for the infinite number of reflections as the wave travels between the two boundaries. 

<div class="row">
    <div class="col">
    </div>
    <div class="col-8">
        {% include figure.html path="assets/img/animations/image_1d_double.gif" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col">
    </div>
</div>
<div class="caption">
    Method of images for a two boundaries.
</div>


The method also applies in two dimensions for a single boundary,


<div class="row">
    <div class="col">
    </div>
    <div class="col-8">
        {% include figure.html path="assets/img/animations/image_2d_single.gif" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col">
    </div>
</div>
<div class="caption">
    Method of images for a single source with one boundary in two dimensions.
</div>

and even for an enclosure in two dimensions or more:


<div class="row">
    <div class="col">
    </div>
    <div class="col-8">
        {% include figure.html path="assets/img/animations/image_3d_single.gif" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col">
    </div>
</div>
<div class="caption">
    Method of images for a two-dimensional enclosure.
</div>