---
layout: table-page
---

{% assign type-group = site.annotations | group_by: "type" | reverse %}
<div class="table-responsive-sm">
<table  class="table table-sm" id="myTable" data-filter-control="true"
  data-show-search-clear-button="true">
  <col style="width:500px" />
  <col style="width:75px" />
  <col style="width:auto" />
  <col style="width:110px" />
  <th data-field="title" data-filter-control="input">Pathway Title<br /><input type="text" id="title" style="width:250px;" onkeyup="myFunction(this.id,0)"></th>
  <th>ID</th>
  <th data-field="org" data-filter-control="select">Organism<br /><input type="text" id="org" style="width:100px;" onkeyup="myFunction(this.id,2)"></th>
  <th>Last Edited</th>
  <th>Communities<br /><input type="text" id="com" style="width:100px;" onkeyup="myFunction(this.id,4)"></th>
  <th>Pathway Terms<br /><input type="text" id="pw" style="width:100px;" onkeyup="myFunction(this.id,5)"></th>
  <th>Disease Terms<br /><input type="text" id="diod" style="width:100px;" onkeyup="myFunction(this.id,6)"></th>
  <th>Cell Types<br /><input type="text" id="ct" style="width:100px;" onkeyup="myFunction(this.id,7)"></th>
  {% for pw in site.pathways %}
  {% assign pw-type-group = pw.annotations | group_by: "type" %}
  <tr>
    <td title="{{ pw.title }}" style="overflow: hidden; max-height: 50px; white-space: nowrap; text-overflow: ellipsis;">
      <a href="{{ pw.url }}">{{ pw.title }}</a>
    </td>
    <td>{{ pw.wpid }}</td>
    <td title="{{ pw.organisms | join: ", "}}">{{ pw.organisms | join: ", "}}</td>
    <td>{{ pw.last-edited | date_to_string}}</td>
    <td title="{{ pw.communities | join: ", "}}">{{ pw.communities | join: ", "}}</td>
    {% for type in type-group %}  
      {% assign pw-items = "" %}
      {% for pw-type in pw-type-group %}
        {% if pw-type.name == type.name %}
          {% assign pw-items = pw-type.items | map: "value" | join: ", " %}
        {% endif %}
      {% endfor %}
      <td title="{{ pw-items }}">
      <div style="overflow: hidden; max-height: 50px; white-space: nowrap; text-overflow: ellipsis;">
      {{ pw-items }}
      </div>
      </td>
    {% endfor %}
  </tr>
  {% endfor %}
</table>
</div>

<script>
function myFunction(id, col) {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById(id);
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[col];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>