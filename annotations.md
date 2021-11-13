<h2>Pathways by Annotation</h2>
<p>TODO: organize as collapsable ontologies</p>
{% assign type-group = site.annotations | group_by: "type" %}
{% for type in type-group %}
  <b>{{ type.name }}: </b>
  {% for annot in type.items %}
  <a class="btn btn-sm btn-pill btn-info" href="{{annot.url}}">{{annot.value}}</a>
  {% endfor %}
{% endfor %}