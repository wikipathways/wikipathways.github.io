<h2>Pathways by Organism</h2>
{% for x in site.organisms %}
  <a class="btn btn-sm btn-pill btn-primary" href="{{ x.url }}">{{ x.common }}</a>
{% endfor %}  
