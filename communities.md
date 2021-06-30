<h1>Pathways by Community</h1>
{% for x in site.community-list %}
### {{ x }}
<ul>
  {% for pw in site.pathways %}
      {% if pw.communities contains x %}
          <li><a href="{{ pw.url }}">{{ pw.title }}</a></li>
        {% endif %}
  {% endfor %}
</ul>
{% endfor %}

