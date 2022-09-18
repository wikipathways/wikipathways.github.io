---
layout: default
order: 5
display-title: "Cited In"
btn-class: "btn-front"
---
    
<h2 id="title">Pathways Cited in the Literature</h2>
<p>A list of pathways that have been cited in the literature, for example as figures, data visualizations and top enrichment results.</p> 
<hr/><br />
<ul>
{% assign sorted_pathways = site.pathways | sort: "title" %}
{% for pw in sorted_pathways %}
  {% assign wpid-citedin=pw.wpid | append: "-citedin" %}
  {% assign citedin=site.data[wpid-citedin] %}
  {% assign citedin-size=citedin | size %}
  {% if citedin-size > 0 %}
    <li><a href="{{ pw.url }}" title="{{pw.wpid}}"><b>{{ pw.title }} <em>({{ pw.organisms.first }})</em></b></a>
      <ul>
        {% for citation in citedin %}
          <!-- Check link -->
          {% assign cit-link = "" %}
          {% assign cit-slash = citation.link | split: "/" | first %}
          {% assign cit-slash-dot = cit-slash | split: "." | first %}
          {% if cit-slash == "https:" %} <!-- fully formed url -->
            {% assign cit-link = citation.link %}
          {% elsif cit-slash-dot == "10" %} <!-- DOI in need of prefix -->
            {% assign cit-link = "https://doi.org/" | append: citation.link %}
          {% else %} <!-- presumed PubMed ID in need of prefix -->
            {% assign cit-link = "https://pubmed.ncbi.nlm.nih.gov/" | append: citation.link %}
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
          {% else %} <!-- not a DOI; don't display it -->
          {% endif %}
          <li><a href="{{ cit-link }}" target="_blank">{{ citation.label | strip_html | truncate: 100, "..."}}</a>{{ cit-archived }}</li>
        {% endfor %}
      </ul>
    </li> 
  {% endif %}
{% endfor %}
</ul>
<br/>
<hr/>
