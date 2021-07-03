<h1>Pathways by Annotation</h1>
{% for x in site.annotations %}
### <a href="{{ x.url }}">{{ x.type }}: {{ x.value }}</a>
{% endfor %}  