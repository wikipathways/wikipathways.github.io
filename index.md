---
layout: home
---

<h2>Browse content by...</h2>

{% for bp in site.browse-pages %}
  <a class="btn btn-sm btn-pill btn-secondary" href="{{bp}}.html">{{bp}}</a>
  {% endfor %}
