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
{% assign blocked_authors = "Wpblocked,Unknown,TestUser" | split:"," %}
{% for x in sorted_authors %}
  {% unless blocked_authors contains x.username %}
    {% unless blocked_authors contains x.realname %}
      <li><a href="{{ x.url }}">{{ x.realname }}</a></li>
      {% endunless %} 
  {% endunless %}
{% endfor %} 
</ul>

