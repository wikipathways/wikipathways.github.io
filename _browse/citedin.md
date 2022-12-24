---
layout: default
order: 5
display-title: "Cited In"
btn-class: "btn-front"
---

{% assign sorted_pathways = site.pathways | sort_natural: "title" %}
{% assign pathway_count = 0 %}
{% assign pub_count = 0 %}   
{% for pw in sorted_pathways %}
    {% assign citedin-size = pw.citedin | size %}
    {% if citedin-size > 0 %}
      {% assign pathway_count = pathway_count | plus: 1 %}
      {% assign pub_count = pub_count | plus: citedin-size %}
    {% endif %}
{% endfor %}
<h2 id="title">Pathways Cited in the Literature</h2>
<p>A list of pathways that have been cited in the literature as figures, data visualizations and top enrichment results.</p> 
<b>To date, {{ pathway_count }} pathways have been cited a total of {{ pub_count }} times</b>
<hr/><br />
<ul>
{% for pw in sorted_pathways %}
    {% assign citedin-size = pw.citedin | size %}
    {% if citedin-size > 0 %}
    <li><a href="{{ pw.url }}" title="{{pw.wpid}}">{{ pw.title }} - {{ pw.wpid }} <em>({{ pw.organisms.first }})</em></a>
      <ul>
        {% for citation in pw.citedin %}
          <!-- Check type -->
          {% assign cit-slash = citation.link | split: "/" | first %}
          {% assign cit-slash-dot = cit-slash | split: "." | first %}
          {% if cit-slash == "https:" %} <!-- fully formed url -->
            {% assign cit-link = citation.link %}
            {% assign cit-title = citation.title %}
            {% assign cit-label = 'URL' %}
            {% assign cit-msg = citation.link | truncate: 21 %}
          {% elsif cit-slash-dot == "10" %} <!-- DOI in need of prefix -->
            {% assign cit-link = "https://doi.org/" | append: citation.link %}
            {% assign cit-title = citation.title %}
            {% assign cit-label = 'DOI' %}
            {% assign cit-msg = citation.link | truncate: 21 %}
          {% else %} <!-- presumed PubMed or PMC ID in need of prefix -->
            {% assign cit-link = "https://pubmed.ncbi.nlm.nih.gov/" | append: citation.link %}
            {% assign cit-title = citation.title %}
            {% assign cit-label = 'PMC' %}
            {% assign cit-msg = citation.link | truncate: 21 %}
          {% endif %}
          <!-- Check archived -->
          {% assign cit-archived = "" %}
          {% assign cit-dot = citation.archived | split: "." | first %}
          {% if cit-dot == "https://doi" %} <!-- fully formed DOI url -->
            {% capture cit-archived %}
            Cites <a href="{{ citation.archived }}" target="_blank">this version</a>
            {% endcapture %}
          {% elsif cit-dot == "10" %} <!-- DOI in need of prefix -->
            {% capture cit-archived %}
            Cites <a href="https://doi.org/{{ citation.archived }}" target="_blank">this version</a>
            {% endcapture %}
          {% else %} <!-- empty or not a DOI; therefore don't display it -->
          {% endif %}
          <!-- <li><a href="{{ cit-link }}" target="_blank">{{ citation.label | strip_html | truncate: 100, "..."}}</a>{{ cit-archived }}</li> -->
          <li>
            <a href="{{ cit-link }}" title="{{ cit-title }}" target="_blank">
              <img alt="{{ cit-label }}" src="https://img.shields.io/static/v1?label={{ cit-label }}&message={{ cit-msg }}&color=blue">
            </a>
            {{ cit-archived }}
          </li>
        {% endfor %}
      </ul>
    </li> 
    {% endif %}
{% endfor %}
</ul>
<br/>
<hr/>
