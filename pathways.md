<h2>Pathways</h2>

{% assign type-group = site.annotations | group_by: "type" %}

<table>
  <th>Title</th>
  <th>ID</th>
  <th>Organism</th>
  <th>Last Edited</th>
  <th>Communities</th>
  {% for type in type-group %}  
    <th>{{type.name}}</th>
  {% endfor %}
  {% for pw in site.pathways %}
  {% assign pw-type-group = pw.annotations | group_by: "type" %}
  <tr>
    <td style="white-space: nowrap;">
      <a class="btn btn-sm btn-pill btn-secondary" href="{{ pw.url }}">{{ pw.title }}</a>
    </td>
    <td>{{ pw.wpid }}</td>
    <td>{{ pw.organisms | join: ", "}}</td>
    <td style="white-space: nowrap;">{{ pw.last-edited | date_to_string}}</td>
    <td>{{ pw.communities | join: ", "}}</td>
    {% for type in type-group %}  
      <td>
      {% for pw-type in pw-type-group %}
        {% if pw-type.name == type.name %}
          {{pw-type.items | map: "value" | join: ", "}}
        {% endif %}
      {% endfor %}
      </td>
    {% endfor %}
  </tr>
  {% endfor %}
</table>

