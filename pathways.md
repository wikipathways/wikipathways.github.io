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
  <th data-field="title" data-filter-control="input">Pathway Title<br /><input type="text" id="tit" style="width:250px;" onkeyup="filterTable()"></th>
  <th>ID</th>
  <th data-field="org" data-filter-control="select">Organism<br /><input type="text" id="org" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Last Edited</th>
  <th>Communities<br /><input type="text" id="com" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Pathway Terms<br /><input type="text" id="pwo" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Disease Terms<br /><input type="text" id="dio" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Cell Types<br /><input type="text" id="cto" style="width:100px;" onkeyup="filterTable()"></th>
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
// Define Filter input id and position
var fils = {
              'tit': 0,
              'org': 2,
              'com': 4,
              'pwo': 5,
              'dio': 6,
              'cto': 7
          };

// Declare one-time variables
var table = document.getElementById("myTable");
var tr = table.getElementsByTagName("tr");

function filterTable() {
  // Declare variables
  var activeFils, emptyFils, input, filter, td, i, txtValue;
  activeFils = [];
  emptyFils = [];

  // Define empty and active filter sets
  Object.keys(fils).forEach(key => {
    input = document.getElementById(key);
    filter = input.value.toUpperCase();
    if (filter.length > 0){
      activeFils.push(key);
    } else {
      emptyFils.push(key);
    }
  });

  // Loop through all table rows
  for (i = 0; i < tr.length; i++) {
    // Loop through column filters
    if(emptyFils.length > 0) {
      // Show all rows if an column filter is empty 
      tr[i].style.display = "";
    }
    // Loop through active column filters
    activeFils.forEach(key => {
      input = document.getElementById(key);
      filter = input.value.toUpperCase();
      td = tr[i].getElementsByTagName("td")[fils[key]];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1 
        && tr[i].style.display != "none") {
          // Show those that match the filter and aren't already hidden
          tr[i].style.display = "";
        } else {
          // Hide those that don't match the filter
          tr[i].style.display = "none";
        }
      } 
    });
  }
}
</script>