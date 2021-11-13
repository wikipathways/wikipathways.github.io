<h2>Pathways by Community</h2>
{% for x in site.communities %}
  <a class="btn btn-sm btn-pill btn-success" href="{{ x.url }}">{{ x.display-name }}</a>
<p>{{x.short-description}}</p>
{% endfor %}

