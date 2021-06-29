<h1>Pathways by Organism</h1>
{% for x in site.organism-list %}
### {{ x }}
<ul>
  {% for pw in site.pathways %}
      {% if pw.organisms contains x %}
          <li><a href="{{ pw.url }}">{{ pw.title }}</a></li>
        {% endif %}   
  {% endfor %}  
</ul>
{% endfor %}  
