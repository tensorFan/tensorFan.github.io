---
layout: page
permalink: /publications/
title: publications
description: publications by categories in reversed chronological order.
#years: [1956, 1950, 1935, 1905] # comment out to get back publications
nav: true
# edit _bibliography to remove einstein
---

If all goes well, this will get filled eventually.

<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
