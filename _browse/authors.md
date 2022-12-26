---
layout: default
order: 6
display-title: "Authors"
btn-class: "btn-front"
---

<h1>Pathways by Author</h1>
<p>The authors below contributed to specific pathway content. Learn more about the authors of your favorite pathways or edit your own author page. </p>
<i>(sorted alphabetically)</i>
<ul class="three-column">
{% assign sorted_authors = site.authors | sort: "realname" %}
{% for x in sorted_authors %}
  <li><a href="{{ x.url }}">{{ x.realname }}</a></li>
{% endfor %} 
</ul>

