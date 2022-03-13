---
layout: home
---
<div class="outer-container">
  <div class="row gy-6 py-3" style="display:flex; flex-wrap: wrap;">
    <div class="col" style="display:flex;">
      <div class="bg-gradient p-3" style="background-color: #eeeeee;">
        <div class="container">
          <div class="row" style="margin-right: 13px; background-color: #ffffff;">
            <div class="col-7" >
              <h2 style="font-family:Poppins">WikiPathways <small class="text-muted">is an open, collaborative platform dedicated to the collection and reuse of biological pathways contributed and updated by the research community. <a href="/about.html">Read more</a></small></h2>
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
          <div class="row" style="margin-right: 13px; background-color: #ffffff;">
            <div class="col-7 text-center" style="height:192px;min-width:333px;" >
              <a href="/rmd/stats">
                <img src="/assets/img/main_stats.png" width="333px" height="193px;"/> 
              </a>
            </div>
            <div class="col text-left align-self-center text-nowrap" style="margin-left: -5px;" >
              <ul>
                <li><a href="/browse/filters.html">{{ site.pathways.size }} pathways</a></li>
                <li><a href="/browse/organisms.html">{{ site.organisms.size }} organisms</a></li>
                <li><a href="/browse/communities.html">{{ site.communities.size }} communities</a></li>
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
	   searchBox2.placeholder=" e.g., ACE or cancer";
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
      <p> 
     <a class="btn btn-sm btn-pill btn-outline-warning" href="https://data.wikipathways.org/current/gmt" target="_blank">gmt</a>
     <a class="btn btn-sm btn-pill btn-outline-warning" href="https://data.wikipathways.org/current/gpml" target="_blank">gpml</a>
     <a class="btn btn-sm btn-pill btn-outline-warning" href="https://data.wikipathways.org/current/svg" target="_blank">svg</a>
     <a class="btn btn-sm btn-pill btn-outline-warning" href="https://data.wikipathways.org" target="_blank">Prior releases</a>
      </p>
      <h2>Access</h2>
      <p> <a class="btn btn-sm btn-pill btn-outline-warning" href="https://webservice.wikipathways.org" title="WikiPathways webservice API" target="_blank">API</a>
      <a class="btn btn-sm btn-pill btn-outline-warning" href="https://sparql.wikipathways.org" title="SPARQL endpoint for WikiPathways RDF" target="_blank">SPARQL</a>
      <a class="btn btn-sm btn-pill btn-outline-warning" href="https://bioconductor.org/packages/rWikiPathways/" title="R package for the WikiPathways webservice API" target="_blank">R</a>
      <a class="btn btn-sm btn-pill btn-outline-warning" href="hhttps://github.com/kozo2/pywikipathways" title="Python client package for the WikiPathways webservice API" target="_blank">Python</a>
      </p>
      <h2>Analyze</h2>
      <p style="margin-left:-3px; line-height:250%;">
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="analyze.html">
      How to Analyze</a></li></ul>
      <a href="https://pathvisio.org/" 
      title="PathVisio is a free open-source pathway analysis and drawing software which allows drawing, editing, and analyzing biological pathways." target="_blank">
      <img src="/assets/img/logo-pathvisio.png" height="30px" /></a>
      <a href="http://apps.cytoscape.org/apps/wikipathways" 
      title="Cytoscape is an open source software platform for visualizing complex-networks and integrating these with any type of attribute data." target="_blank">
      <img src="/assets/img/logo-cytoscape.png" height="30px" /></a>
      <a href="https://biit.cs.ut.ee/gprofiler/gost" title="g:Profiler is a public web server for characterising and manipulating gene lists." target="_blank">
      <img src="/assets/img/logo-gprofiler.png" height="30px" /></a>
      <a href="https://www.webgestalt.org/" title="WebGestalt is designed for functional genomic, proteomic and large-scale genetic studies from which large number of gene lists." target="_blank">
      <img src="/assets/img/logo-webgestalt.png" height="30px" /></a>
      <a href="https://amp.pharm.mssm.edu/Enrichr/" title="Enrichr is a comprehensive gene set enrichment analysis web server. Includes WikiPathways as one of their data sources." target="_blank">
      <img src="/assets/img/logo-enrichr.png" height="30px" /></a>
      <a href="https://bioconductor.org/packages/clusterProfiler/" title="The clusterProfiler R package supports GO and pathway analysis performed as overrepresentation or GSEA." target="_blank">
      <img src="/assets/img/logo-clusterprofiler.png" height="30px" /></a>
      <br/>
      <a href="/tools.html" style="font-size:0.8em; text-decoration:none;">and many more...</a></p>
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
      <li><a class="btn btn-sm btn-pill btn-outline-warning" href="" title="How to Publish">
      How to Publish</a></li>
      </ul>
      <h2>Contribute</h2>
      <ul style="list-style: none; margin-left:-3px; line-height:250%;">
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="/contribute.html">How to Contribute </a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="https://new.wikipathways.org/academy/path.html" target="_blank">How to Curate </a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="https://github.com/wikipathways/wikipathways-development" target="_blank">How to Develop</a></li>
      <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="https://github.com/wikipathways/wikipathways-help/discussions" target="_blank">FAQ</a></li>
      </ul>
      </div>
    </div>
    <div class="col" style="display:flex; flex-direction:row;">
      <div class="bg-gradient p-3 w-100" style="background-color: #eeeeee;">
      <h2>Latest</h2>
        {% assign sorted_pathways = site.pathways | sort: "wpid" | reverse | sort: "last-edited" %}
        {% assign pw = sorted_pathways.last %}
            <div class="card w-100" style="width: 10rem;">
              <a class="card-link" href="{{ pw.url }}">
              <img class="card-img-top" loading="lazy" src="/assets/img/{{pw.wpid}}/{{pw.wpid}}-thumb.png" alt="{{ pw.title }}">
              <div class="card-body">
                <p class="card-text">{{ pw.title }} <em>({{ pw.organisms.first }})</em></p>
              </div>
              </a>
            </div>
          <ul style="list-style: none; margin-left:-3px; line-height:250%;">
            <li><a class="btn btn-sm btn-pill btn-outline-warning" href="/new-pathways.html" 
            title="Newest additions to WikiPathways.">
            New pathways</a></li>
            <li><a class="btn btn-sm btn-pill btn-outline-warning" href="/recent-pathways.html" title="Recent pathway edits at WikiPathways.">
            Recent changes</a></li>
          </ul>
      </div>
    </div>
  </div>
</div>
