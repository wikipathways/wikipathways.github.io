<h2>Pathways by Annotation</h2>
<p>TODO: organize as collapsable ontologies</p>
{% assign type-group = site.annotations | group_by: "type" %}
{% for type in type-group %}
<section class="facet">
  <div class="facet-header">
    <button type="button" class="btn btn-link facet-toggle" data-toggle="collapse" href="#{{ type.name }}" aria-expanded="false" aria-controls="collapseExample">
      <strong class="facet-title">{{ type.name }}</strong>
    </button>
  </div>
  <div class="facet-body collapse" id="{{ type.name }}">
  {% for annot in type.items %}
  <a class="btn btn-sm btn-pill btn-info" href="{{annot.url}}">{{annot.value}}</a>
  {% endfor %}
  </div>
</section>
{% endfor %}