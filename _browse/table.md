---
layout: table-page
order: 2
display-title: "Table filters"
btn-class: "btn-outline-warning"
---

{% assign type-group = site.annotations | group_by: "type" | reverse %}
<div class="table-responsive-sm">
<table  class="table table-sm" id="myTable">
  <col style="width:500px" />
  <col style="width:75px" />
  <col style="width:auto" />
  <col style="width:120px" />
  <th>Pathway Title
  <!-- NOTE: SORT IS TOO SLOW FOR FULL TABLE -->
  <span id="sortable" onclick="sortTable(0)" title="Sort by title" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="0" style="width:250px;" onkeyup="filterTable()"></th>
  <th>ID
  <span id="sortable" onclick="sortTable(1)" title="Sort by ID" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="1" style="width:50px;" onkeyup="filterTable()"></th>
  <th>Organism
  <span id="sortable" onclick="sortTable(2)" title="Sort by organism" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="2" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Last Edited
  <span id="sortable" onclick="sortTable(3)" title="Sort by last edited date" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="3" style="width:70px;" onkeyup="filterTable()"></th>
  <th>Communities
  <span id="sortable" onclick="sortTable(4)" title="Sort by communities" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="4" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Pathway Terms
  <span id="sortable" onclick="sortTable(5)" title="Sort by pathway ontology terms" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="5" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Disease Terms
  <span id="sortable" onclick="sortTable(6)" title="Sort by disease ontology terms" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="6" style="width:100px;" onkeyup="filterTable()"></th>
  <th>Cell Types
  <span id="sortable" onclick="sortTable(7)" title="Sort by cell type ontology terms" style="color: #666;"><i class="fa fa-sort"></i></span>
  <br /><input type="text" id="7" style="width:100px;" onkeyup="filterTable()"></th>
  {% assign pw-sorted = site.pathways | sort: "title" %}
  {% for pw in pw-sorted %}
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
          {% assign pw-items-pars = pw-type.items | map: "parent" | join: ", " %}
          {% if pw-items-pars.size > 0 %}
            {% assign pw-items = pw-items | append: ", " | append: pw-items-pars | uniq %}
          {% endif %}
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
var sortSpans = document.getElementsByClassName("fa-sort");
countVisibleRows()

function showhideSort(spans, state){
  for (var i=0; i< spans.length; i++){
    spans[i].style.display= state; 
  }
}

// Assume filter input ids are incrementing numbers as Strings
var numCols = table.rows[0].cells.length;
var fils = {}
for (var c=0; c < numCols; c++){
  fils[c.toString()] = c;
}

// URL PARAMETERS
var orgList, comList, pwoList, dioList, ctoList;
var url_string = window.location.href;
var url = new URL(url_string);
if (url.searchParams.toString().length > 0){
  orgList = url.searchParams.get("Organism");
  comList = url.searchParams.get("Community");
  pwoList = url.searchParams.get("Pathway Ontology");
  dioList = url.searchParams.get("Disease Ontology");
  ctoList = url.searchParams.get("Cell Type Ontology");
} else {
  // Any defaults if no parameters provided
  orgList = null;
  comList = null;
  pwoList = null;
  dioList = null;
  ctoList = null;

}  
// console.log(dioList);
document.getElementById(2).value = orgList;
document.getElementById(4).value = comList;
document.getElementById(5).value = pwoList;
document.getElementById(6).value = dioList;
document.getElementById(7).value = ctoList;
filterTable();

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
  countVisibleRows();
}

function countVisibleRows() {
  var rows = table.rows;
  var z = 0;
  var sort = true;
  for (var q = 1; q < rows.length; q++) {
    if (rows[q].style.display == ""){ //visible row
      z++;
      if (z > 200){ // SORT THRESHOLD
        sort = false;
        break;
      }
    }
  }
  if (sort){
    showhideSort(sortSpans, '');
  } else {
    showhideSort(sortSpans, 'none');
  }
}

// NOTE: TOO SLOW FOR FULL TABLE
function sortTable(n) {
  var table, rows, switching, q ,r, x, y, shouldSwitch, dir, switchcount = 0;
  var visibleRows = [];
  table = document.getElementById("myTable");
  switching = true;
  dir = "asc";
  rows = table.rows;
  /* Collect visible rows (except the
  first, which contains table headers) */
  for (q = 1; q < rows.length; q++) {
    if (rows[q].style.display == ""){ //visible row
      visibleRows.push(q);
    }
  }
  while (switching) {
    switching = false;
    /* Loop through all VISIBLE table rows (+1) */
    for (r = 0; r < (visibleRows.length - 1); r++) {
      shouldSwitch = false;
      /* Get the two elements you want to compare,
      one from current row and one from the next: */
      x = rows[visibleRows[r]].getElementsByTagName("TD")[n];
      y = rows[visibleRows[r + 1]].getElementsByTagName("TD")[n];
      /* Check if the two rows should switch place,
      based on the direction, asc or desc: */
      if (dir == "asc") {
        if (n == 3){ // Date
          if (new Date(x.innerHTML) > new Date(y.innerHTML)) {
            shouldSwitch = true;
            break;
          }
        } else if (n == 1) { // WPID (numeric part)
          if (x.innerHTML.split("WP")[1] > y.innerHTML.split("WP")[1]) {
            shouldSwitch = true;
            break;
          }
        } else if (n == 0) { // hyperlinked title
          if (x.innerHTML.toLowerCase().split(">")[1] > y.innerHTML.toLowerCase().split(">")[1]) {
            shouldSwitch = true;
            break;
          }
        } else { // all other columns
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
        } else if (n == 0) { // hyperlinked title
          if (x.innerHTML.toLowerCase().split(">")[1] < y.innerHTML.toLowerCase().split(">")[1]) {
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
      rows[visibleRows[r]].parentNode.insertBefore(rows[visibleRows[r + 1]], rows[visibleRows[r]]);
      switching = true;
      switchcount ++;
      // recollect visible rows
      visibleRows = [];
      for (q = 1; q < rows.length; q++) {
        if (rows[q].style.display == ""){ //visible row
          visibleRows.push(q);
        }
      }
    } else {
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>
