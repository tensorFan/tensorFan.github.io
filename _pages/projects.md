---
layout: page
title: research activities
permalink: /projects/
description: here you can see some of my project descriptions, attended conferences and other miscellaneous stuff
nav: true
#display_categories: [work, fun]
horizontal: false
---

## attended conferences
- 4th International Conference on Numerical Methods in Multiphase Flows [(ICNMMF-4)](https://sites.psu.edu/icnmmf4/), September 28-30, 2022, Venice. Gave a 15 minute talk [(slides)](/assets/pdf/Presentation 2022 - CutFEM Darcy in Venice.pdf)
- ENUMATH 2023 [(ENUMATH)](https://enumath2023.com/), September 4-8, 2023, Lisbon. Gave a 20 minute talk.

## project descriptions

- Conservative cut finite element methods [PhD Project]
, with S. Zahedi and T. Frachon

Partial differential equations (PDEs) are fantastic models of physical phenomena occuring in nature, but they are notoriously hard to solve. It is possible to find approximate solutions through the help of computers which, in cases where we know the exact solution, can be shown to converge (i.e. get closer with respect to some refinement) to this exact solution. When the computational domain gets cut in two by some interface, perhaps modelling a fracture or an interface separating two media, the problem becomes even harder to solve.

We use the so called Cut Finite Element Method (CutFEM) to efficiently compute approximate solutions to these problems. However, the method is generally unable to preserve a conservation law over the course of the simulation. We say that such a numerical method is not divergence preserving. The aim is then to find a modification to the CutFEM framework which is divergence preserving.

[This paper](https://arxiv.org/abs/2205.12023) is our first presentation of a method which accomplishes the above, in the setting of the Darcy interface problem which models porous media flow. The method introduces stabilization terms which preserve the saddle-point structure of the problem. The same mixed stabilization terms allow us to find methods exhibiting divergence-free velocity solutions also for Stokes flow, see [this follow-up paper](https://arxiv.org/abs/2304.14230).

- Can one hear the shape of a flat torus? [~2021]
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
