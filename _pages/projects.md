---
layout: page
title: Research activities
permalink: /projects/
description: Here you can view some of my project descriptions, attended conferences and other miscellaneous stuff
nav: true
#display_categories: [work, fun]
horizontal: false
---

## Talks
- ``Saving the divergence condition in CutFEM (with respect to the Darcy interface problem)'', 4th International Conference on Numerical Methods in Multiphase Flows [(ICNMMF-4)](https://sites.psu.edu/icnmmf4/), September 28-30 2022, Venice, 15 minutes [(slides)](/assets/pdf/Presentation 2022 - CutFEM Darcy in Venice.pdf)
- ``Divergence preserving cut finite element methods for Stokes flow'', ENUMATH 2023 [(ENUMATH)](https://enumath2023.com/), September 4-8 2023, Lisbon, 20 minutes
- ``Exterior calculus for (cut) finite element methods'', KTH Numerical Analysis Seminar [(KTH NA Sem)](https://www.kth.se/math/kalender/semna), April 24 2025, Stockholm, 45 minutes 

## Project descriptions

- Conservative cut finite element methods [PhD Project]
, with S. Zahedi and T. Frachon

The cut finite element method (CutFEM) is a numerical method for meshes unfitted to the physical domain associated to a partial differential equation. In [this paper](https://arxiv.org/abs/2205.12023) we present a method which is able to preserve a conservation law - a condition on the divergence - in the setting of the Darcy interface problem, which models flow of porous media. The method introduces stabilization terms which preserve the saddle-point structure of the problem. The same mixed stabilization terms allow us to find methods exhibiting divergence-free velocity solutions also for Stokes flow, see [this follow-up paper](https://arxiv.org/abs/2304.14230).

- Uniformly bounded curl free extensions of vector fields in arbitrary topologies (and more)
, with S. Pitassi

In [this work](https://arxiv.org/abs/2604.04927) we construct a family of uniformly bounded extension operators of differential forms, which form a cochain map structure. This means that they commute with the exterior derivative. In terms of vector fields in 3D, this means we can extend curl free vector fields to curl free vector fields in a uniformly bounded way. Applications include uniformly bounded Poincaré inequalities.


- Cut finite element exterior calculus
, with D. Di Pietro and J. Droniou

We extend CutFEM to the setting of finite element exterior calculus (FEEC) in what we call [CutFEEC](https://arxiv.org/abs/2510.14772). 
Using mixed stabilisation terms allows to preserve the discrete structure of a standard conforming method also in the setting where the mesh is unfitted with respect to the physical domain. The language of exterior calculus helps illustrate this idea in a particularly nice way for the Hodge Laplace equation. Topological features can be handled similarly, giving a method and a principle that works for any topology.

- Auxiliary space preconditioners for mixed virtual element methods
, with W. Boon

In [this work](https://arxiv.org/abs/2404.12823) we propose nodal auxiliary space preconditioners for facet and edge virtual elements of lowest order, for applications to PDEs approximated using the virtual element method (VEM). Under assumed regularity of the mesh, the preconditioned system is proven to have bounded spectral condition number independent of the mesh size and this is verified by numerical experiments on a sequence of polygonal meshes. Moreover, we observe numerically that the preconditioner is robust on meshes containing elements with high aspect ratios.


- Can one hear the shape of a flat torus?
, with J. Rowlett and F. Rydell

Flat tori are particularly simple Riemannian manifolds for which it is in some dimensions possible to discern their isometry class (shape) from simply looking at the list of numbers we call the Laplace eigenvalue spectrum. In which dimensions can we do this? The answer is written in the language of quadratic forms (and also only German - up until [now](https://tensorfan.github.io/publications/)!)

(See [here](/assets/pdf/thesis.pdf) for a less polished introduction. Beware of errors.)



{% comment %}

<div class="projects">
  {% if site.enable_project_categories and page.display_categories %}
  <!-- Display categorized projects -->
    {% for category in page.display_categories %}
      <h2 class="category">{{category}}</h2>
      {% assign categorized_projects = site.projects | where: "category", category %}
      {% assign sorted_projects = categorized_projects | sort: "importance" %}
      <!-- Generate cards for each project -->
      {% if page.horizontal %}
        <div class="container">
          <div class="row row-cols-2">
          {% for project in sorted_projects %}
            {% include projects_horizontal.html %}
          {% endfor %}
          </div>
        </div>
      {% else %}
        <div class="grid">
          {% for project in sorted_projects %}
            {% include projects.html %}
          {% endfor %}
        </div>
      {% endif %}
    {% endfor %}

  {% else %}
  <!-- Display projects without categories -->
    {% assign sorted_projects = site.projects | sort: "importance" %}
    <!-- Generate cards for each project -->
    {% if page.horizontal %}
      <div class="container">
        <div class="row row-cols-2">
        {% for project in sorted_projects %}
          {% include projects_hrz.html %}
        {% endfor %}
        </div>
      </div>
    {% else %}
      <div class="grid">
        {% for project in sorted_projects %}
          {% include projects.html %}
        {% endfor %}
      </div>
    {% endif %}

  {% endif %}

</div>

{% endcomment %}
