---
layout: home2
---
<div style="background: linear-gradient(0deg, #fefefe, #eae6ff 100%);">
  {%- include_cached header.html %}
<section id="intro"> 
  <main class="home-page-content" aria-label="Content">
    <div class="wrapper">   
      <div class="outer-container">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
                <h2 style="font-family:Poppins"><b>WikiPathways</b> is an open, collaborative platform dedicated to the collection and reuse of biological pathways contributed and updated by the research community.
                </h2>
                <a class="btn btn-sm btn-front" href="/about.html">Read more</a>
                <div class="row-main-single gy-5 py-5" style="display:flex; flex-wrap: wrap;">
                  <div class="col-9 mx-auto>">
                    <div class="container">
                      <h3 style="font-family:Poppins; text-align: center; font-size:larger"><b>Search the current collection</b>
                      </h3>
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
                      <p style="color: #6c757d;text-align: center">Search by gene symbols, pathway names or other keywords</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-6 mx-auto gy-4 py-4" style="display:flex;">
            <div class="container">
              <a href="/pathways/WP554.html">
                <div class="wp554-gif"></div> 
              </a>
              <p style="color: #6c757d;text-align: center">Interact with diagrams with annotated genes, metabolites, drugs, interactions and pathways.</p>
            </div>
          </div> 
        </div>
      </div>
    </div>
  </main>
</section>
</div>
<section id="join"> 
    <div class="wrapper">   
      <div class="outer-container" >
        <div class="row-main-single gy-6 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-11 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
                <h2 style="font-family:Poppins; margin-left:100px;"><b>Better than static pathway figures. Dedicated to open science.</b><br/><span style="color: #6c757d;"> Join hundreds of other scientists by contributing your pathway knowledge.</span></h2>
              </div>
            </div>
          </div>
          <div class="col-1" style="display:flex;">
          </div>
          <div class="col-6 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
              <a href="/rmd/stats">
                <div class="stats-gif"></div> 
              </a>
              </div>
            </div>
          </div>
          <div class="col-2 mx-auto" style="display:flex;">
            <div class="container" style="width:90px;">
                <br/><br/><br/><a class="btn btn-sm btn-front w-100" href="/help.html">Create</a>
                <br/><br/><a class="btn btn-sm btn-front w-100" href="/help.html">Curate</a>
                <br/><br/><a class="btn btn-sm btn-front w-100" href="https://github.com/wikipathways/wikipathways-development" target="_blank">Code</a>
            </div>
          </div> 
          <div class="col-1" style="display:flex;">
          </div>
        </div>
      </div> 
    </div>
</section>
<section id="browse">
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(90deg, #fefefe, #eae6ff 100%);">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
                <h2 style="font-family:Poppins"><b>Browse the current collection</b><br/><span style="color: #6c757d;">Explore the full breadth and depth of pathway knowledge. Discover pathways of interest by organism, communities of domain experts, and ontology annotations.</span></h2>
                <div class="row-main-single" style="display:flex; flex-wrap: wrap;">
                  <div class="col-1" style="display:flex;">
                  </div>
                  <div class="col-10 mx-auto>" style="display:flex;">
                    <div class="container" style="text-align:center; width:110px;">
      {% assign sorted_browse = site.browse | sort: "order" %} 
      {% for bp in sorted_browse %}
        <br/><a class="btn btn-sm {{bp.btn-class}} w-100 my-1" style="font-size:large" href="{{bp.url}}"> {{ bp.display-title }}</a>
      {% endfor %}           
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="container">
              <div id="carouselBrowse" class="carousel slide" data-ride="true" data-wrap="true">
  <ol class="carousel-indicators">
    <li data-target="#carouselBrowse" data-slide-to="0" class="active"></li>
    <li data-target="#carouselBrowse" data-slide-to="1"></li>
    <li data-target="#carouselBrowse" data-slide-to="2"></li>
    <li data-target="#carouselBrowse" data-slide-to="3"></li>
    <li data-target="#carouselBrowse" data-slide-to="4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="/browse/filters.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-1.png" alt="Category filter">
      </a>
    </div>
    <div class="carousel-item">
          <a href="/browse/table.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-2.png" alt="Table filter">
      </a>
    </div>
    <div class="carousel-item">
          <a href="/browse/organisms.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-3.png" alt="Organism">
      </a>
    </div>
    <div class="carousel-item">
          <a href="/browse/communities.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-4.png" alt="Community">
      </a>
    </div>
    <div class="carousel-item">
          <a href="/browse/annotations.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-5.png" alt="Annotation">
      </a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselBrowse" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselBrowse" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
              </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
</section>
<section id="download"> 
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(270deg, #fefefe, #eae6ff 100%);">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
              <div id="carouselDownload" class="carousel slide" data-ride="true" data-wrap="true">
  <ol class="carousel-indicators">
    <li data-target="#carouselDownload" data-slide-to="0" class="active"></li>
    <li data-target="#carouselDownload" data-slide-to="1"></li>
    <li data-target="#carouselDownload" data-slide-to="2"></li>
    <li data-target="#carouselDownload" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="https://webservice.wikipathways.org/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/download-1.png" alt="Web service API">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://data.wikipathways.org/current/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/download-2.png" alt="Download archive">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://sparql.wikipathways.org/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/download-3.png" alt="SPARQL">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://bioconductor.org/packages/rWikiPathways/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/download-4.png" alt="R package">
      </a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselDownload" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselDownload" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
              </div>
              </div>
            </div>
          </div>
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="container">
              <h2 style="font-family:Poppins; text-align:right"><b>Download and access</b><br/><span style="color: #6c757d;">Get pathway information in the format you need, including GPML (XML), GMT, RDF, SVG and PNG.  Access our content  from your favorite language. </span></h2>
              <div class="row-main" style="display:flex; flex-wrap: wrap;">
              <div class="col-2 mx-auto" style="display:flex;">
              </div>
              <div class="col-3 mx-auto" style="display:flex;">
                <div class="container">
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://data.wikipathways.org/current/gpml" target="_blank">GPML</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://data.wikipathways.org/current/gmt" target="_blank">GMT</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://data.wikipathways.org/current/svg" target="_blank">SVG</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://data.wikipathways.org" target="_blank">Archive</a>
                </div>
              </div>              
              <div class="col-3 mx-auto" style="display:flex;">
                <div class="container">
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://webservice.wikipathways.org/" target="_blank">API</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://sparql.wikipathways.org/" target="_blank">SPARQL</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://bioconductor.org/packages/rWikiPathways/" target="_blank">R</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://github.com/kozo2/pywikipathways" target="_blank">Python</a>
                </div>
              </div>
              <div class="col-3 mx-auto" style="display:flex;">
              </div>
              </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
</section>
<section id="analyze"> 
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(90deg, #fefefe, #eae6ff 100%);">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
                <h2 style="font-family:Poppins"><b>Analyze and Publish</b><br/><span style="color: #6c757d;">Choose from dozens of online and local software tools to perform pathway analysis. Visualize your data in the context of pathway diagrams. Publish results as images with links back to an active and dynamic database.</span></h2>
              <div class="row-main" style="display:flex; flex-wrap: wrap;">
              <div class="col-6 mx-auto" style="display:flex;">
                <div class="container" style="text-align:center;">
                <br/><a class="btn btn-sm btn-front w-100 my-1" style="max-width:180px;" href="/help.html">Analyze</a>
                <br/>
      <a href="https://pathvisio.org/" 
      title="PathVisio is a free open-source pathway analysis and drawing software which allows drawing, editing, and analyzing biological pathways." target="_blank">
      <img src="/assets/img/logo-pathvisio.png" height="55px" style="padding:2px 1px"/></a>
      <a href="http://apps.cytoscape.org/apps/wikipathways" 
      title="Cytoscape is an open source software platform for visualizing complex-networks and integrating these with any type of attribute data." target="_blank">
      <img src="/assets/img/logo-cytoscape.png" height="55px" style="padding:2px 2px" /></a>
      <a href="https://biit.cs.ut.ee/gprofiler/gost" title="g:Profiler is a public web server for characterising and manipulating gene lists." target="_blank">
      <img src="/assets/img/logo-gprofiler.png" height="55px" style="padding:2px 1px" /></a>
      <a href="https://www.webgestalt.org/" title="WebGestalt is designed for functional genomic, proteomic and large-scale genetic studies from which large number of gene lists." target="_blank">
      <img src="/assets/img/logo-webgestalt.png" height="55px" style="padding:2px 4px" /></a>
      <a href="https://amp.pharm.mssm.edu/Enrichr/" title="Enrichr is a comprehensive gene set enrichment analysis web server. Includes WikiPathways as one of their data sources." target="_blank">
      <img src="/assets/img/logo-enrichr.png" height="55px" style="padding:2px 8px" /></a>
      <a href="https://bioconductor.org/packages/clusterProfiler/" title="The clusterProfiler R package supports GO and pathway analysis performed as overrepresentation or GSEA." target="_blank">
      <img src="/assets/img/logo-clusterprofiler.png" height="55px" style="padding:2px 8px" /></a>
      <a href="/tools.html" style="font-size:1.0em; text-decoration:none;">and many more...</a>
                </div>
              </div>              
              <div class="col-3 mx-auto" style="display:flex;">
                <div class="container">
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="/cite.html">Cite</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="/help.html">Publish</a>
                <br/><a class="btn btn-sm btn-front w-100 my-1" href="https://wikipathways.tumblr.com/" target="_blank">Examples</a>
                </div>
              </div>
              <div class="col-2 mx-auto" style="display:flex;">
              </div>
              </div>
              </div>
            </div>
          </div>
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="container">
              <div id="carouselAnalyze" class="carousel slide" data-ride="true" data-wrap="true">
  <ol class="carousel-indicators">
    <li data-target="#carouselAnalyze" data-slide-to="0" class="active"></li>
    <li data-target="#carouselAnalyze" data-slide-to="1"></li>
    <li data-target="#carouselAnalyze" data-slide-to="2"></li>
    <li data-target="#carouselAnalyze" data-slide-to="3"></li>
    <li data-target="#carouselAnalyze" data-slide-to="4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="https://pathvisio.org/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-1.png" alt="PathVisio">
      </a>
    </div>
    <div class="carousel-item">
          <a href="http://apps.cytoscape.org/apps/wikipathways" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-2.png" alt="Cytoscape app">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://bioconductor.org/packages/clusterProfiler/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-3.png" alt="clusterProfiler R package">
      </a>
    </div>
    <div class="carousel-item">
          <a href="/cite.html">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-4.png" alt="How to cite">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://wikipathways.tumblr.com/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-5.png" alt="Example publications">
      </a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselAnalyze" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselAnalyze" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
              </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
</section>
{%- include_cached footer.html -%}
<div class="wrapper">
  <div class="thanks-wrapper">
    {%- include_cached thanks.html -%}
  </div>
</div>

