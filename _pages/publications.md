---
layout: page
permalink: /publications/
title: papers
description: sorted by year

#edit and put back @s in _bibliography/papers.bib to see einstein entries
#years: [1956, 1950, 1935, 1905] # comment out to get back Einstein publications, several on one year is OK

#years: [2030,2029,2028,2027,2026,2025,2024,2023,2022,2021]
years: [2024,2023,2022,2021]
nav: true
social: true  # includes social icons at the bottom of the page
---

<!-- _pages/publications.md -->
<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
