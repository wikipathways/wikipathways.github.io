---
title: Team
curators:
- Egonw
- Khanspers
- Mkutmon
- AlexanderPico
- DeSl
- Fehrhart
- Ddigles
- Susan
- Andra
- Elisson nl
- Madeomuga
- IsabelWassink
- Jmillanacosta
- Tabbassidaloii
- Ash_iyer
- ElenaDR1

architects:
- Mkutmon
- AlexanderPico

coordination:
- Khanspers
- Susan

founders:
- Thomas
- AlexanderPico
- MartijnVanIersel
- Khanspers
- BruceConklin
- Evelo

redirect_from: /index.php/WikiPathways:Team
---
<h1>Who is behind WikiPathways?</h1>
WikiPathways is run by people like you! Join our teams of <a href="#curators">curators</a>, <a href="#community_editors">community editors</a> and <a href="#developers">developers</a> to maintain this public resource of pathway information.

<a name="architects"/>
<h2>Coordination</h2>
<b>Architects:</b> Responsible for roadmap planning, onboarding new developers, and setting best practices.
<ul>
{% for a in page.architects %}
    {% assign auth = site.authors | where: "username", a | first  %}
    <li><a href="{{site.url}}/authors/{{a}}.html" title="View profile">{{ auth.realname }}</a></li>
{% endfor %}
</ul>
<b>Community Coordinators:</b> Responsible for curation coordination, organization of community meetings, educational material.
<ul>
{% for a in page.coordination %}
    {% assign auth = site.authors | where: "username", a | first  %}
    <li><a href="{{site.url}}/authors/{{a}}.html" title="View profile">{{ auth.realname }}</a></li>
{% endfor %}
</ul>

<a name="curators"/>
<h2>Curators</h2>
Help review pathway edits, monitor automated reports, or join the <b><i>Curator of the Week</i></b> roster.
<div class="row">
{% for a in page.curators %}
    {% assign auth = site.authors | where: "username", a | first  %}
<div class="col-sm-3"><div class="card mb-3" style="max-width: 300px; padding:5px; background-color:#eae6ff;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="https://github.com/{{auth.github}}.png" style="object-fit: cover; border-radius: 50%; width: 75px; margin: 5px;" class="card-img" alt="No photo">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">{{auth.realname}}</h5>
        <p class="card-text"></p>
        <a href="{{auth.url}}" class="btn btn-sm btn-info">View profile</a>
      </div>
    </div>
  </div>
</div></div>
{% endfor %}
</div>

<a name="community_editors"/>
<h2>Community Editors</h2>
Interested in a focused subset of pathways, for example relating to a disease or model organism? Join or create a WikiPathways Community and organize your own community practices and events. Here is a list of communities and lead editors and points of contact:
{% for c in site.communities %}
<p style="margin-bottom:0px;">
<a class="btn btn-sm btn-pill btn-community" href="{{ c.url }}">{{ c.display-name }}</a>
<span style="color:gray;">{{c.short-description}}</span>
</p>
<ul>
    {% for a in c.editors %}
        {% assign auth = site.authors | where: "username", a | first  %}
        <li><a href="{{site.url}}/authors/{{a}}.html" title="View profile">{{ auth.realname }}</a></li>
    {% endfor %}
</ul>
{% endfor %}

<a name="developers"/>
<h2>Developers</h2>
The WikiPathways project is 100% open source. Dive under the hood to review and contribute to the code base.
<ul>
    <li><a href="https://github.com/orgs/wikipathways/people" title="View code contributors" target="_blank">See all WikiPathways code contributors</a></li>
</ul>

<a name="founders"/>
<h2>Founders</h2>
Back in 2007, members of the Conklin (Gladstone Institutes, CA, USA) and Evelo (Univ. Maastrict, NL) labs decided to collaborate on a new type of pathway database. Read all about it in <a href="https://doi.org/10.1371%2Fjournal.pbio.0060184">Pico AR, <i>et al.</i> PLoS Biol. 2008</a>.
<ul>
{% for a in page.founders %}
    {% assign auth = site.authors | where: "username", a| first  %}
    <li><a href="{{site.url}}/authors/{{a}}.html" title="View profile">{{ auth.realname }}</a></li>
{% endfor %}
</ul>
