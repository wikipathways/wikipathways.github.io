---
layout: default
order: 3
display-title: "New"
btn-class: "btn-front"
---

<h2 id="title">New Pathways</h2>
<p>A sorted list of 20 pathways that have been recently added to the database.</p> 
<h2>Pathways</h2>
<ul class="nav nav-tabs" style="margin-left: 0px;">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#gallery">Gallery</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#list">List</a>
    </li>
</ul>
{% assign sorted_pathways = site.pathways | sort: "wpid" | reverse %}
<div class="tab-content" >
    <div class="tab-pane fade show active" id="gallery" role="tabpanel">
        <br/>
    <div class="row" style="margin-right: 0px; margin-left: 0px;">
        {% assign i = 0 %}
        {% for pw in sorted_pathways %}
            {% if pw.wpid.size == 6 %} <!-- Only display sorted 4-digit wpids -->
                {% assign i = i | plus: 1 %}
                {% if i > 20 %}
                    {% break %}
                {% endif %}
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
            {% endif %}
        {% endfor %}
    </div>
    </div>
<div class="tab-pane fade" id="list" role="tabpanel">
    <br/>
    <div class="row" style="margin-left: 0px;">
      <ul style="list-style-type: none; margin-left: 0px;">
        {% assign j = 0 %}
        {% for pw in sorted_pathways %}
          {% if pw.wpid.size == 6 %}
          {% assign j = j | plus: 1 %}
            {% if j > 20 %}
              {% break %}
            {% endif %}
            <li><a href="{{ pw.url }}">{{pw.wpid}}: {{ pw.title }} <em>({{ pw.organisms.first }})</em> --<b>last edited: {{ pw.last-edited }}</b></a></li>
          {% endif %}
        {% endfor %}
      </ul>
    </div>  
  </div>
</div>
<br/>
<hr/>
<h2>Authors of New Pathways</h2>
<p>
    {% assign all_authors = '' | split: '' %}
    {% assign k = 0 %}
    {% for pw in sorted_pathways %}
      {% if pw.wpid.size == 6 %}
      {% assign k = k | plus: 1 %}
        {% if k > 20 %}
          {% break %}
        {% endif %}
          {% for auth in pw.authors %}
            {% capture thisAuth %}
              <a href="{{site.url}}/authors/{{auth}}.html" title="View author profile">{{auth}}</a>
            {% endcapture %}
            {% assign all_authors = all_authors | push: thisAuth %}
          {% endfor %}
      {% endif %}
    {% endfor %}
    {{ all_authors | uniq | array_to_sentence_string }}
</p>
