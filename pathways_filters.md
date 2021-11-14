---
layout: table-page
---
<div class="container">
  <div class="row">
    <div class="col-sm" style="max-width:300px;">
<section class="facet">
  <div class="facet-header">
    <button type="button" class="btn btn-link facet-toggle" data-toggle="collapse" href="#organisms" aria-expanded="true" aria-controls="collapseExample">
      <strong class="facet-title">Organism</strong>
    </button>
  </div>
  <div class="facet-body collapse show" id="organisms">
    <ul class="facet-group">
    {% for org in site.organisms %}
      <li class="facet-group-item">
        <label class="form-check-label">
          <input class="form-check-input" type="checkbox" name="organisms" value="{{ org.latin }}">
          {{ org.latin }}
        </label>
      </li>
      {% endfor %}
    </ul>
  </div>
    <div class="facet-header">
    <button type="button" class="btn btn-link facet-toggle" data-toggle="collapse" href="#communities" aria-expanded="true" aria-controls="collapseExample">
      <strong class="facet-title">Community</strong>
    </button>
  </div>
  <div class="facet-body collapse" id="communities">
    <ul class="facet-group">
    {% for com in site.communities %}
      <li class="facet-group-item">
        <label class="form-check-label">
          <input class="form-check-input" type="checkbox" name="communities" value="{{ com.community-tag }}">
          {{ com.community-tag }}
        </label>
      </li>
      {% endfor %}
    </ul>
  </div>
  {% assign type-group = site.annotations | group_by: "type" | reverse %}
  {% for type in type-group %}
      <div class="facet-header">
    <button type="button" class="btn btn-link facet-toggle" data-toggle="collapse" href="#{{ type.name }}" aria-expanded="true" aria-controls="collapseExample">
      <strong class="facet-title">{{ type.name }}</strong>
    </button>
  </div>
  <div class="facet-body collapse" id="{{ type.name }}">
    <ul class="facet-group">
    {% for annot in type.items %}
      <li class="facet-group-item">
        <label class="form-check-label">
          <input class="form-check-input" type="checkbox" name="{{ type.name |downcase | replace:" ","_"}}" value="{{ annot.value }}">
          {{ annot.value }}
        </label>
      </li>
      {% endfor %}
    </ul>
  </div>
  {% endfor %}
</section>
</div>
<div class="col-sm">
    <div class="row">
    <div class="results"></div>
<div class="table-responsive-sm">
<table  class="table table-sm" id="myTable"> 
  <th>Pathway Title</th>
  <th style="display:none;">Organism<br /><input type="text" id="org" style="width:50px;" onkeyup="filterTable()"></th>
  <th style="display:none;">Communities<br /><input type="text" id="com" style="width:50px;" onkeyup="filterTable()"></th>
  <th style="display:none;">Pathway Terms<br /><input type="text" id="pwo" style="width:50px;" onkeyup="filterTable()"></th>
  <th style="display:none;">Disease Terms<br /><input type="text" id="dio" style="width:50px;" onkeyup="filterTable()"></th>
  <th style="display:none;">Cell Types<br /><input type="text" id="cto" style="width:50px;" onkeyup="filterTable()"></th>
  {% for pw in site.pathways %}
  {% assign pw-type-group = pw.annotations | group_by: "type" %}
  <tr>
    <td title="{{ pw.title }}" style="overflow: hidden; max-height: 50px; white-space: nowrap; text-overflow: ellipsis;">
      <a href="{{ pw.url }}">{{ pw.title }}</a>
    </td>
    <td style="display:none;" title="{{ pw.organisms | join: ", "}}">{{ pw.organisms | join: ", "}}</td>
    <td style="display:none;" title="{{ pw.communities | join: ", "}}">{{ pw.communities | join: ", "}}</td>
    {% for type in type-group %}  
      {% assign pw-items = "" %}
      {% for pw-type in pw-type-group %}
        {% if pw-type.name == type.name %}
          {% assign pw-items = pw-type.items | map: "value" | join: ", " %}
        {% endif %}
      {% endfor %}
      <td style="display:none;" title="{{ pw-items }}">
      <div style="overflow: hidden; max-height: 50px; white-space: nowrap; text-overflow: ellipsis;">
      {{ pw-items }}
      </div>
      </td>
    {% endfor %}
  </tr>
  {% endfor %}
</table>
</div>
    </div>
</div>
</div>
</div>

<script>
// CHECKBOXES
// Listen for organism checkboxes
var orgList = []
var interests = document.querySelectorAll("[name=organisms"); 
for (var index = 0; index < interests.length; index++) { 
    interests[index].addEventListener("change", function(evt){ 
        var checkbox = evt.target; 
        //console.log(checkbox.value + " changed to " + checkbox.checked); 
        orgList = $("input:checkbox[name=organisms]:checked").map(function(){return $(this).val()}).get();
        document.getElementById('org').value = orgList;
        filterTable();
    }); 
}
// Listen for community checkboxes
var comList = []
var interests = document.querySelectorAll("[name=communities"); 
for (var index = 0; index < interests.length; index++) { 
    interests[index].addEventListener("change", function(evt){ 
        var checkbox = evt.target; 
        //console.log(checkbox.value + " changed to " + checkbox.checked); 
        comList = $("input:checkbox[name=communities]:checked").map(function(){return $(this).val()}).get();
        document.getElementById('com').value = comList;
        filterTable();
    }); 
}
// Listen for Pathway Ontology checkboxes
var pwoList = []
var interests = document.querySelectorAll("[name=pathway_ontology"); 
for (var index = 0; index < interests.length; index++) { 
    interests[index].addEventListener("change", function(evt){ 
        var checkbox = evt.target; 
        //console.log(checkbox.value + " changed to " + checkbox.checked); 
        pwoList = $("input:checkbox[name=pathway_ontology]:checked").map(function(){return $(this).val()}).get();
        document.getElementById('pwo').value = pwoList;
        filterTable();
    }); 
}
// Listen for Disease checkboxes
var dioList = []
var interests = document.querySelectorAll("[name=Disease"); 
for (var index = 0; index < interests.length; index++) { 
    interests[index].addEventListener("change", function(evt){ 
        var checkbox = evt.target; 
        //console.log(checkbox.value + " changed to " + checkbox.checked); 
        dioList = $("input:checkbox[name=Disease]:checked").map(function(){return $(this).val()}).get();
        document.getElementById('dio').value = dioList;
        filterTable();
    }); 
}
// Listen for Pathway Ontology checkboxes
var ctoList = []
var interests = document.querySelectorAll("[name=cell_type"); 
for (var index = 0; index < interests.length; index++) { 
    interests[index].addEventListener("change", function(evt){ 
        var checkbox = evt.target; 
        //console.log(checkbox.value + " changed to " + checkbox.checked); 
        ctoList = $("input:checkbox[name=cell_type]:checked").map(function(){return $(this).val()}).get();
        document.getElementById('cto').value = ctoList;
        filterTable();
    }); 
}

// TABLE FILTER
// Declare one-time variables
var table = document.getElementById("myTable");
var tr = table.getElementsByTagName("tr");
var fils = {
  'org':1,
  'com':2,
  'pwo':3,
  'dio':4,
  'cto':5
};

function filterTable() {
  // Declare variables
  var activeFils, emptyFils, input, filSplit, td, i, txtValue;
  activeFils = [];
  emptyFils = [];

  // Define empty and active filter sets
  Object.keys(fils).forEach(key => {
    input = document.getElementById(key).value;
    if (input.length > 0){
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
      filSplit = input.value.toUpperCase().split(",");
      td = tr[i].getElementsByTagName("td")[fils[key]];
      if (td) {
        txtValue = td.textContent || td.innerText;
        tvSplit = txtValue.toUpperCase().trim().split(",");
        // console.log(tvSplit);
        // console.log(filSplit);
        if (filSplit.filter(value => tvSplit.includes(value)).length > 0  //filter.indexOf(txtValue.toUpperCase()) !== -1  
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