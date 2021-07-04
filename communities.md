<h2>Pathways by Community</h2>
{% for x in site.communities %}
  <a class="collection-link" href="{{ x.url }}">{{ x.display-name }}</a>
<p>{{x.description}}</p>
{% endfor %}

