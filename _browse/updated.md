---
layout: default
order: 4
display-title: "Updated"
btn-class: "btn-front"
---
    
<h2 id="title">Recently Updated Pathways</h2>
<p>A date-sorted list of 20 pathways that have been recently edited.  <em>Note: This does not include pathways pending review.</em></p> 

<h2>Pathways</h2>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#gallery">Gallery</a>
    </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#list">List</a>
      </li>
</ul>
{% assign sorted_pathways = site.pathways | sort: "last-edited" | reverse | slice:0, 20 %}
<div class="tab-content" >
    <div class="tab-pane fade show active" id="gallery" role="tabpanel">
        <br/>
    <div class="row">
      {% for pw in sorted_pathways %}
          <div class="col-sm-auto">
            <div class="card" style="width: 10rem;">
              <a class="card-link" href="{{ pw.url }}">
              <img class="card-img-top" loading="lazy" src="/assets/img/{{pw.wpid}}/{{pw.wpid}}-thumb.png" alt="{{ pw.title }}">
              <div class="card-body">
                <p class="card-text">{{ pw.title }} <em>({{ pw.organisms.first }})</em>
                <br /><b>last edited: {{ pw.last-edited }}</b></p>
              </div>
              </a>
            </div>
          </div>
      {% endfor %}
    </div>
  </div>
  <div class="tab-pane fade" id="list" role="tabpanel">
    <br/>
    <div class="row" style="margin-left: 10px;">
      <ul>
        {% for pw in sorted_pathways %}
              <li><a href="{{ pw.url }}">{{ pw.title }} - {{pw.wpid}} <em>({{ pw.organisms.first }})</em> --<b>last edited: {{ pw.last-edited }}</b></a></li>
        {% endfor %}
      </ul>
    </div>  
  </div>
</div>
<br/>
<hr/>
<h2>Authors of Recent Updates</h2>
{% assign sorted_pw_authors = sorted_pathways | map: "authors" | join: ','  | split: ',' | uniq  %} <!-- REPLACE authors with "recent author" -->
{% assign all_authors = '' | split: '' %}
{% for auth in sorted_pw_authors %}
  {% assign realname = site.authors | where: "username", auth | map: "realname" | first  %}
  {% capture thisAuth %}
    <a href="{{site.url}}/authors/{{auth}}.html" title="View author profile">{{realname}}</a>
  {% endcapture %}
  {% assign all_authors = all_authors | push: thisAuth %}
{% endfor %}
<p>{{ all_authors | array_to_sentence_string }}.</p>
