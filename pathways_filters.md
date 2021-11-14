<h2>Pathways</h2>

<div class="container">
  <div class="row">
    <div class="col-sm">
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
          <input class="form-check-input" type="checkbox" name="organisms" value="{{ org.common }}">
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
          <input class="form-check-input" type="checkbox" value="{{ com.community-tag }}">
          {{ com.community-tag }}
        </label>
      </li>
      {% endfor %}
    </ul>
  </div>
  {% assign type-group = site.annotations | group_by: "type" %}
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
          <input class="form-check-input" type="checkbox" value="{{ annot.xref-identifier }}">
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
    <!-- CANT USE LIQUID FOR DYNAMIC CONTENT; MAYBE USE AS TABLE FILTER VALUES?-->
      {% for pw in site.pathways %}
          {% if pw.communities contains "CPTAC" %}
          <div class="col-sm-auto">
            <div class="card" style="width: 10rem;">
              <a class="card-link" href="{{ pw.url }}">
              <img class="card-img-top" src="https://www.wikipathways.org//wpi/wpi.php?action=downloadFile&type=png&pwTitle=Pathway:{{pw.wpid}}" alt="{{ pw.title }}p">
              <div class="card-body">
                <p class="card-text">{{ pw.title }} <em>({{ pw.organisms.first }})</em></p>
              </div>
              </a>
            </div>
          </div>
          {% endif %}
      {% endfor %}
    <!-- END LIQUID -->
    </div>
</div>
</div>
</div>




<script>


var orgList = []
var interests = document.querySelectorAll("[name=organisms"); 
for (var index = 0; index < interests.length; index++) { 
    interests[index].addEventListener("change", function(evt){ 
        var checkbox = evt.target; 
        console.log(checkbox.value + " changed to " + checkbox.checked); 
        orgList = $("input:checkbox[name=organisms]:checked").map(function(){return $(this).val()}).get();
        $('.results').html(orgList);
    }); 
}
</script>