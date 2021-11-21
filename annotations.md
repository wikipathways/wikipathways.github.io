<h1>Pathways by Annotation</h1>
<p>Exlpore ontologies below to identify pathways tagged with particular terms.</p>
{% assign type-group = site.annotations | group_by: "type" | reverse %}
{% for type in type-group %}
<section class="facet">
  <div class="facet-header">
    <button type="button" class="btn btn-link facet-toggle" data-toggle="collapse" href="#{{ type.name }}" aria-expanded="false" aria-controls="collapseExample">
      <h2 class="facet-title">{{ type.name }}</h2>
    </button>
  </div>
  <div class="facet-body collapse" id="{{ type.name }}">
    {% assign level-group = type.items | group_by: "level" | sort: "name" %}  
    {% for level in level-group %}
    <div class="facet-header">
      <button type="button" class="btn btn-link facet-toggle" data-toggle="collapse" href="#{{ type.name }}{{ level.name }}" aria-expanded="false" aria-controls="collapseExample">
        <strong class="facet-title">{{ level.name }}</strong>
      </button>
    </div>
    <div class="facet-body collapse" id="{{ type.name }}{{ level.name }}">
      {% for annot in level.items %}
        <a class="btn btn-sm btn-pill btn-info" href="{{annot.url}}">{{annot.value}}</a>
      {% endfor %}
    </div>
    {% endfor %}
  </div>
</section>
{% endfor %}