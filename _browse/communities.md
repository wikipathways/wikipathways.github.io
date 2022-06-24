---
order: 4
display-title: "Community"
btn-class: "btn-community btn-pill"
---

<h1>Pathways by Community</h1>
<p>The communities below represent pathway content specific to a research ares or species. These pages serve as as organizing points for exploring pathway content and contributing to the community.</p>
{% for x in site.communities %}
  <p><a class="btn btn-sm btn-pill btn-community" href="{{ x.url }}">{{ x.display-name }}</a>
<br />{{x.short-description}}</p> 
{% endfor %}

