<h1>Pathways by Portal</h1>
{% for x in site.portal-list %}
### {{ x }}
<ul>
  {% for pw in site.pathways %}
      {% if pw.portals contains x %}
          <li><a href="{{ pw.url }}">{{ pw.title }}</a></li>
        {% endif %}
  {% endfor %}
</ul>
{% endfor %}

