<h2>Pathways by Organism</h2>
{% for x in site.organisms %}
  <a class="collection-link" href="{{ x.url }}">{{ x.common }}</a>
{% endfor %}  
