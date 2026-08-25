---
layout: page
permalink: /publications/
title: Papers
description: by year

#edit and put back @s in _bibliography/papers.bib to see einstein entries
#years: [1956, 1950, 1935, 1905] # comment out to get back Einstein publications, several on one year is OK

#years: [2030,2029,2028,2027,2026,2025,2024,2023,2022,2021]
# years: [2025,2024,2023,2022,2021]
nav: true
social: true  # includes social icons at the bottom of the page

scholar:
  sort_by: year
  order: descending
  query: "@*"
---

<!-- _pages/publications.md -->
<div class="publications">

<!-- {% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %} -->

<!-- {% assign available_years = "" %} -->
{% bibliography -f papers -q @* | capture: "all_entries" %}
{% for y in page.years %}
  {% if all_entries contains y %}
    <h2 class="year">{{ y }}</h2>
    {% bibliography -f papers -q @*[year={{ y }}]* %}
  {% endif %}
{% endfor %}

</div>


<style>
  /* .publications h2.year {
    // left:-200px;
    width: 1000px;
    border-top: 3px solid var(--global-theme-color); // Thicker separator
    padding-top: 2rem;
  } */

  .publications .row {
    left: 200px;
    margin-bottom: 60px;
    position: relative;
    /* padding-left: -250px;  */
    min-height: 200px; /* Ensure rows have enough height for images */
    max-width: 600px; /* 600% */
  }
  
  /* Position the image relatively */
  .col-sm-2 {
    /* margin-left: auto; 
    margin-right: 0; */
    position: relative;
    left: 350px;
    /* top: 0; */
    /* width: 300px; */
    /* float: right; */
  } 
  
  /* Super-sized images */
  .publications img {
    max-height: 160px;
    max-width: 400px; /* 600% */
    height: auto;
    border: 1px solid #ddd;
    box-shadow: 0 6px 12px rgba(0,0,0,0.15);
  }
  
  /* Text column takes full width */
  .col-sm-10 {
    left: -300px;
    width: 100%; 
  }

  /* Adjust for mobile */
  @media (max-width: 767px) {
    .publications .row {
      left: 0;
      margin-bottom: 30px;
      padding-top: 20px;
      max-width: 100%;
    }
    .col-sm-2 {
      left: 0;
      width: 100%;
      text-align: center;
      margin-bottom: 10px;
    }
    .col-sm-10 {
      left: 0;
      width: 100%;
    }
    .publications img {
      max-width: 100%;
      height: auto;
    }
  }
</style>