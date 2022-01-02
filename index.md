---
layout: home
---
<div class="container">
  <div class="row gy-6 py-3" style="display:flex; flex-wrap: wrap;">
    <div class="col" style="display:flex;">
      <div class="bg-gradient p-3" style="background-color: #eeeeee;">
        <div class="container">
          <div class="row" style="margin-right: 13px; background-color: #ffffff;">
            <div class="col-7" >
              <h2>WikiPathways <small class="text-muted">is an open, collaborative platform dedicated to the collection and reuse of biological pathways contributed and updated by the research community. <a href="/about.html">Read more</a></small></h2>
            </div>
            <div class="col-4 text-right align-self-center" style="padding-left:0px; margin-left:-2px;">
              <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Wplogo_500.png"
              width="150px">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col" style="display:flex;">
      <div class="bg-gradient p-3" style="background-color: #eeeeee;">
        <div class="container">
          <div class="row py-3" style="margin-right: 13px; background-color: #ffffff;">
            <div class="col text-center" >
              <img src="/assets/img/stats-figure-1.jpg" style="height:160px; min-width:145px;" />
            </div>
            <div class="col text-center" >
              <img src="/assets/img/stats-figure-2.jpg" style="height:160px; min-width:145px;"/>
            </div>
            <div class="col text-left align-self-center" style="margin-left: -5px;" >
            {% assign doid = site.annotations | where: "type", "Disease" %}
              <ul>
                <li>{{ site.pathways.size }} pathways</li>
                <li>{{ doid.size }} diseases</li>
                <li>{{ site.organisms.size }} organisms</li>
                <li>{{ site.communities.size }} communities</li>
              </ul>
            </div>            
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row gy-6 py-3 text-center" style="display:flex; flex-wrap: wrap;">
    <div class="col" style="display:flex; flex-direction:row;">
      <div class="bg-gradient p-3 w-100" style="background-color: #eeeeee;">
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
    <div class="col" style="display:flex; flex-direction:row;">
      <div class="bg-gradient p-3 w-100" style="background-color: #eeeeee;">
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
    <div class="col" style="display:flex; flex-direction:row;">
      <div class="bg-gradient p-3 w-100" style="background-color: #eeeeee;">
      <h2>Analyze</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://pathvisio.org/" 
      title="PathVisio is a free open-source pathway analysis and drawing software which allows drawing, editing, and analyzing biological pathways." target="_blank">
      PathVisio (install)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="http://apps.cytoscape.org/apps/wikipathways" 
      title="Cytoscape is an open source software platform for visualizing complex-networks and integrating these with any type of attribute data." target="_blank">
      Cytoscape (install)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://biit.cs.ut.ee/gprofiler/gost" title="g:Profiler is a public web server for characterising and manipulating gene lists." target="_blank">
      g:Profiler (online)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://www.webgestalt.org/" title="WebGestalt is designed for functional genomic, proteomic and large-scale genetic studies from which large number of gene lists." target="_blank">
      WebGestalt (online)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://amp.pharm.mssm.edu/Enrichr/" title="Enrichr is a comprehensive gene set enrichment analysis web server. Includes WikiPathways as one of their data sources." target="_blank">
      Enrichr (online)</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://bioconductor.org/packages/clusterProfiler/" title="The clusterProfiler R package supports GO and pathway analysis performed as overrepresentation or GSEA." target="_blank">
      clusterProfiler (R)</a></li>
      <li><a href="/tools.html" style="font-size:0.8em; text-decoration:none;">and many more...</a></li>
      </ul>
      </div>
    </div>
    <div class="col" style="display:flex; flex-direction:row;">
      <div class="bg-gradient p-3 w-100" style="background-color: #eeeeee;">
      <h2>Publish</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="/cite.html">
      How to cite</a></li>
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="https://wikipathways.tumblr.com/" title="Blog of WikiPathways used or mentinoed in publications." target="_blank">
      Published examples</a></li>
      </ul>
      <h2>Learn</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="" target="_blank">How to Contribute </a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="" target="_blank">How to Curate </a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="" target="_blank">How to Use</a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="" target="_blank">How to Develop</a></li>
      </ul>
      </div>
    </div>
  </div>
</div>
