---
order: 4
display-title: "Communities"
tooltip: "Groups of individuals interested in particular subsets of pathways" 
btn-class: "btn-community btn-pill"
---

<h1>Pathways by Community</h1>
<p>The communities below represent pathway content specific to a research area or organism. These pages are designed to make it easier to explore pathway content, learn more about the community and to organize relevant pathway curation. To learn how to create or edit a community page, see our <a href="https://wikipathways.org/help_communities.html">Communities Help</a>.</p>
{% for x in site.communities %}
  <p><a class="btn btn-sm btn-pill btn-community" href="{{ x.url }}">{{ x.display-name }}</a>
<br />{{x.short-description}}</p> 
{% endfor %}

