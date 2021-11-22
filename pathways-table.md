---
layout: table-page
---

{% assign type-group = site.annotations | group_by: "type" | reverse %}
<div class="table-responsive-sm">
<table  class="table table-sm" id="myTable">
  <col style="width:500px" />
  <col style="width:75px" />
  <col style="width:auto" />
  <col style="width:120px" />
  <th>Pathway Title
  <span onclick="sortTable(0)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="0" style="width:250px;" onkeyup="filterTable()"></th>
  <th>ID
  <span onclick="sortTable(1)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="1" style="width:50px;" onkeyup="filterTable()"></th>
  <th>Organism
  <span onclick="sortTable(2)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="2" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Last Edited
  <span onclick="sortTable(3)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="3" style="width:70px;" onkeyup="filterTable()"></th>
  <th>Communities
  <span onclick="sortTable(4)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="4" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Pathway Terms
  <span onclick="sortTable(5)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="5" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Disease Terms
  <span onclick="sortTable(6)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="6" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Cell Types
  <span onclick="sortTable(7)" title="Copy link to clipboard" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="7" style="width:100px;" onkeyup="filterTable()"></th>
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
// Declare one-time variables
var table = document.getElementById("myTable");
var tr = table.getElementsByTagName("tr");

// Assume filter input ids are incrementing numbers as Strings
var numCols = table.rows[0].cells.length;
var fils = {}
for (var c=0; c < numCols; c++){
  fils[c.toString()] = c;
}

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
        if (txtValue.toUpperCase().indexOf(filter) !== -1 
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

function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("myTable");
  switching = true;
  dir = "asc";
  while (switching) {
    switching = false;
    rows = table.rows;
    /* Loop through all table rows (except the
    first, which contains table headers): */
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      /* Get the two elements you want to compare,
      one from current row and one from the next: */
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /* Check if the two rows should switch place,
      based on the direction, asc or desc: */
      if (dir == "asc") {
        if (n == 3){ // Date
          if (new Date(x.innerHTML) > new Date(y.innerHTML)) {
            shouldSwitch = true;
            break;
          }
        } else {
          if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
            shouldSwitch = true;
            break;
          }
        }
      } else if (dir == "desc") {
        if (n == 3){ // Date
          if (new Date(x.innerHTML) < new Date(y.innerHTML)) {
            shouldSwitch = true;
            break;
          }
        } else {
          if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
            shouldSwitch = true;
            break;
          }
        }
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      switchcount ++;
    } else {
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>