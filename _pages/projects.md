---
layout: page
title: projects
permalink: /projects/
description: Here you can see descriptions of my ongoing and previous research.
nav: true
#display_categories: [work, fun]
horizontal: false
---

- Conservative cut finite element methods

Partial differential equations govern nature and so crop up all over the place, but they are notoriously hard to solve. Luckily it is possible to find approximate solutions through the help of computers which, in cases where we know the exact solution, can be shown to converge, i.e. get closer with respect to some refinement, to this exact solution. When the computational domain gets cut in two by some interface, perhaps modelling a fracture or a boundary separating two media, the problem becomes even harder to solve.

We use so called cut finite element methods (cutFEM) to efficiently compute approximate (discrete) solutions to these problems. However, as is the case for many FEM applied to flow phenomena, we lose energy over the course of the simulation. The discrete scheme is not conservative. The aim is then to find a modification to the cutFEM framework which is conservative.

- Can one hear the shape of a flat torus?

Flat tori are particularly simple Riemannian manifolds for which it is in some dimensions possible to discern their isometry class (shape) from simply looking at the list of numbers we call the Laplace eigenvalue spectrum. In which dimensions can we do this? The answer is hidden deep within the corpus of pure mathematics research, and we seek to uncover it and present it in a new, more reader-friendly way.

Since there is no hosting for the text elsewhere, see [here](/assets/pdf/thesis.pdf) for an introduction.



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
