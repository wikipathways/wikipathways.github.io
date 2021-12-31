---
layout: home
---
<div class="container">
  <div class="row g-6 py-3">
    <div class="col">
      <div class="bg-light bg-gradient p-3">
      What is WikiPathways...
      </div>
    </div>
    <div class="col">
      <div class="bg-light bg-gradient p-3">
      Active community and growth stats...
      </div>
    </div>
  </div>
  <div class="row gy-6 py-3 text-center">
    <div class="col">
      <div class="bg-light bg-gradient p-3">
      <h2>Search</h2>
      <div id="blue-searchbox">
   <script>
	 (function() {
	   var gcse = document.createElement("script");
	   gcse.type = "text/javascript";
	   gcse.async = true;
	   gcse.src = "https://cse.google.com/cse.js?cx=c1b9a23fc5f2875e3";
	   var s = document.getElementsByTagName("script")[0];
	   s.parentNode.insertBefore(gcse, s);
	 })();
	 window.onload = function()
	 { 
	   var searchBox1 =  document.getElementById("gsc-i-id1");
	   searchBox1.placeholder=" ";
	   searchBox1.title="Search WikiPathways"; 
	   var searchBox2 =  document.getElementById("gsc-i-id2");
	   searchBox2.placeholder=" e.g., AKT1 or cancer";
	   searchBox2.title="Search WikiPathways"; 
	 }
   </script>
   <gcse:search></gcse:search>
</div>
      <h2>Browse</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      {% assign sorted_browse = site.browse | sort: "order" %} 
      {% for bp in sorted_browse %}
        <li><a class="btn btn-sm btn-pill {{bp.btn-class}}" href="{{bp.url}}"> {{ bp.display-title }}</a></li>
      {% endfor %}
      </ul>
      </div>
    </div> 
    <div class="col">
      <div class="bg-light bg-gradient p-3">
      <h2>Download</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="https://data.wikipathways.org/current/" target="_blank">Latest monthly release </a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="https://data.wikipathways.org" target="_blank">Prior releases </a></li>
      </ul>
      <h2>Access</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="https://webservice.wikipathways.org" title="WikiPathways webservice API" target="_blank">Web services </a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://sparql.wikipathways.org" title="SPARQL endpoint for WikiPathways RDF" target="_blank">SPARQL</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://bioconductor.org/packages/rWikiPathways/" title="R package for the WikiPathways webservice API" target="_blank">
      rWikiPathways (R) </a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="hhttps://github.com/kozo2/pywikipathways" title="Python client package for the WikiPathways webservice API" target="_blank">
      pyWikiPathways (Python) </a></li>
      </ul>
      </div>
    </div>
    <div class="col">
      <div class="bg-light bg-gradient p-3">
      <h2>Analyze</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://pathvisio.org/" 
      title="PathVisio is a free open-source pathway analysis and drawing software which allows drawing, editing, and analyzing biological pathways." target="_blank">
      PathVisio (install)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://biit.cs.ut.ee/gprofiler/gost" title="g:Profiler is a public web server for characterising and manipulating gene lists." target="_blank">
      g:Profiler (online)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://www.webgestalt.org/" title="WebGestalt is designed for functional genomic, proteomic and large-scale genetic studies from which large number of gene lists." target="_blank">
      WebGestalt (online)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://bioconductor.org/packages/clusterProfiler/" title="The clusterProfiler R package supports GO and pathway analysis performed as overrepresentation or GSEA." target="_blank">
      clusterProfiler (R)</a></li>
      <li><a href="/tools.html" style="font-size:0.8em;">and many more...</a></li>
      </ul>
      <h2>Publish</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="/cite.html">
      How to cite</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://wikipathways.tumblr.com/" title="Blog of WikiPathways used or mentinoed in publications." target="_blank">
      Published examples</a></li>
      </ul>
      </div>
    </div>
    <div class="col">
      <div class="bg-light bg-gradient p-3">
      <h2>Participate</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="" target="_blank">Curation </a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="" target="_blank">Modeling </a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="" target="_blank">Development </a></li>
      </ul>
      </div>
    </div>
  </div>
</div>
