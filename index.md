---
layout: home2
title: Home
reviewer_roster:
- Andra
- DeSl
- Jmillanacosta
- Eweitz
- Ash iyer
- Elisson nl
- AlexanderPico
- Khanspers
- Tabbassidaloii
- YuanyuanDuan1
- Fehrhart
- alexandra-valeanu
- Mkutmon
- Susan

redirect_from: 
- /index.php/WikiPathways
- /index.php/wikipathways
- /index.php/Pathway
- /index.php/Special:UserLogin
- /index.php/
- /index.ph
- /pathway-finder
---
{%- include_cached header.html %}
<section id="intro"> 
    <div class="wrapper">   
      <div class="outer-container">
        <div class="row-main py-4" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3 px-4">
              <div class="container" style="margin-left:25px;">
                <h2 style="font-family:Poppins; line-height:1.4; font-weight: normal"><b>WikiPathways</b> is an open science platform for biological pathways contributed, updated, and used by the research community.
                </h2>
                <a class="btn btn-sm btn-front my-1" href="/about.html">Read more</a>
                <a class="btn btn-sm btn-front my-1" href="https://youtu.be/oSyoDU2r4Q0" target="_blank">Video tour</a>
                <div style="display:flex; align-items:center; font-size:14px; margin-top:10px;">
                  <span>Powered by:</span>
                  <a href="https://pathvisio.org" target="_blank">
                    <img src="/assets/img/logo-pathvisio-name.png" title="PathVisio is our pathway modeling tool" alt="PathVisio" style="height: 35px; margin: 0px 0px 8px 5px">
                  </a>
                  <span>&nbsp; & &nbsp;</span>
                  <a href="https://www.bridgedb.org" target="_blank">
                    <img src="/assets/img/logo-bridgedb.png" title="BridgeDb supports all our identifiers and organisms" alt="BridgeDB" style="height: 30px; margin-left: 5px;">
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
                <a href="/pathways/WP554.html">
                  <div class="wp554-gif"></div> 
                </a>
                <p style="color: #6c757d;text-align: left">Interact with diagrams with clickable genes, drugs, and pathways.</p>
              </div>
            </div>
          </div>
          <div class="col-1 mx-auto" style="display:flex;"></div>
        </div>
      </div>
    </div>
</section>
<section id="browse">
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(0deg, #fefefe, #eaeaff 100%);">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient">
              <div class="container">
              <div id="carouselBrowse" class="carousel slide" data-ride="true" data-wrap="true" style="margin-bottom: 25px;">
  <ol class="carousel-indicators" style="margin-bottom:-25px;">
    <li data-target="#carouselBrowse" data-slide-to="0" class="active"></li>
    <li data-target="#carouselBrowse" data-slide-to="1"></li>
    <li data-target="#carouselBrowse" data-slide-to="2"></li>
    <li data-target="#carouselBrowse" data-slide-to="3"></li>
    <li data-target="#carouselBrowse" data-slide-to="4"></li>
  </ol>
  <div class="carousel-inner" style="width:76%; margin-left: 12%;">
    <div class="carousel-item active">
      <a href="/browse/filters.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-1.png" alt="Filters">
      </a>
    </div>
    <div class="carousel-item">
          <a href="/browse/table.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-2.png" alt="Table">
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
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="container">
                  <h1 style="font-family:Linux Libertine; text-align:right;">Browse for Pathways</h1><h2 style="font-family:Poppins; text-align:right;color: #6c757d;line-height:1.4; font-weight: normal">Explore the full breadth and depth of pathway knowledge. Discover pathways of interest by organism, communities of domain experts, and ontology annotations.</h2>
                <div class="row mx-auto" style="display:flex; flex-wrap: wrap;">            
                  <div class="col-3" style="display:flex; margin-left:0px;">
                    <div class="container">
                    <span style="font-family:Linux Libertine; font-weight: bold;margin-left: 17px;font-size: larger;">Collections:</span>
      {% assign sorted_browse = site.browse | where_exp:"item","item.btn-class contains 'pill'" | sort: "order" %}
      {% for bp in sorted_browse %}
        <a class="btn btn-sm {{bp.btn-class}} w-100" style="font-size:large" href="{{bp.url}}" title="{{bp.tooltip}}"> {{ bp.display-title }}</a>
      {% endfor %}           
                    </div>
                  </div>
                  <div class="col-3 mx-auto>" style="display:flex; margin-left:auto">
                    <div class="container">
      {% assign sorted_browse = site.browse | where:"btn-class","btn-front" | sort: "order" %} 
      {% for bp in sorted_browse %}
        {% assign order_check = bp.order | modulo: 2 %}
        {% if order_check != 0 %}
        <a class="btn btn-sm {{bp.btn-class}} w-100 my-2" style="font-size:large" href="{{bp.url}}" title="{{bp.tooltip}}"> {{ bp.display-title }}</a>
        {% endif %}
      {% endfor %}           
                    </div>
                  </div>
                  <div class="col-3 mx-auto>" style="display:flex;">
                    <div class="container">
      {% assign sorted_browse = site.browse | where:"btn-class","btn-front" | sort: "order" %} 
      {% for bp in sorted_browse %}
        {% assign order_check = bp.order | modulo: 2 %}
        {% if order_check == 0 %}
        <a class="btn btn-sm {{bp.btn-class}} w-100 my-2" style="font-size:large" href="{{bp.url}}" title="{{bp.tooltip}}"> {{ bp.display-title }}</a>
        {% endif %}
      {% endfor %}           
                    </div>
                  </div>
                </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
</section>
<section id="join">
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(0deg, #fefefe, #eaeaff 100%);">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-4 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container" style="margin-left:25px;">
                <h1 style="font-family:Linux Libertine; ">Share Your Knowledge</h1><h2 style="font-family:Poppins; color: #6c757d;line-height:1.4; font-weight: normal"> Join hundreds of other scientists by contributing your pathway knowledge.</h2>
                    <a class="btn btn-sm btn-front my-2" href="/help.html#create">Contribute</a>
                    <a class="btn btn-sm btn-front my-2" href="http://academy.wikipathways.org/" target="_blank">Learn</a>
                    <a class="btn btn-sm btn-front my-2" href="https://github.com/wikipathways/wikipathways-development" target="_blank">Code</a>
                <br /><br /><h2 style="font-weight: normal;">Reviewer of the Week</h2>
                {% assign pick =  "now" | date:"%W" | minus: 1 | modulo: page.reviewer_roster.size %}
                {% assign cauth = site.authors | where: "username", page.reviewer_roster[pick] | first  %}
                <div class="card mb-3" style="max-width: 300px; padding:5px;">
                  <div class="row no-gutters">
                    <div class="col-md-4">
                      <img src="https://github.com/{{cauth.github}}.png" style="object-fit: cover; border-radius: 50%; width: 75px; margin: 5px;" class="card-img" alt="No photo">
                    </div>
                    <div class="col-md-8">
                      <div class="card-body">
                        <h5 class="card-title">{{cauth.realname}}</h5>
                        <p class="card-text"></p>
                        <a href="{{cauth.url}}" class="btn btn-sm btn-info">View profile</a>
                      </div> 
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-7 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
              <a href="/stats">
                <div class="stats-gif"></div>  
              </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>
<section id="analyze"> 
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(0deg, #fefefe, #eaeaff 100%);">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
             <div id="carouselAnalyze" class="carousel slide" data-ride="true" data-wrap="true">
  <ol class="carousel-indicators" style="margin-bottom:-25px;">
    <li data-target="#carouselAnalyze" data-slide-to="0" class="active"></li>
    <li data-target="#carouselAnalyze" data-slide-to="1"></li>
    <li data-target="#carouselAnalyze" data-slide-to="2"></li>
    <li data-target="#carouselAnalyze" data-slide-to="3"></li>
    <li data-target="#carouselAnalyze" data-slide-to="4"></li>
  </ol>
  <div class="carousel-inner" style="width:76%; margin-left: 12%;">
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
          <a href="https://www.ncbi.nlm.nih.gov/pmc/?term=(wikipathways)&report=imagesdocsum&dispmax=100" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-5.png" alt="Publications using WikiPathways">
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
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="container">
                            <h1 style="font-family:Linux Libertine; text-align:right;">Analyze and Publish</h1><h2 style="font-family:Poppins; text-align:right; line-height:1.4; color: #6c757d; font-weight: normal;">Choose from dozens of tools to perform pathway analysis. Visualize your data in the context of pathway diagrams. Publish results as images linked to an active database.</h2>
              <div class="row mx-auto" style="display:flex; flex-wrap: wrap;">
              <div class="col-0 mx-auto" style="display:flex;">
              </div>
              <div class="col-6 mx-auto" style="display:flex;">
                <div class="container" style="text-align:center;">
                <a class="btn btn-sm btn-front w-100 my-2" style="max-width:180px;" href="/analyze.html">Analyze</a>
                <br/>
      <a href="https://pathvisio.org/" 
      title="PathVisio is a free open-source pathway analysis and drawing software which allows drawing, editing, and analyzing biological pathways." target="_blank">
      <img src="/assets/img/logo-pathvisio.png" alt="PathVisio logo" height="55px" style="padding:2px 1px"/></a>
      <a href="http://apps.cytoscape.org/apps/wikipathways" 
      title="Cytoscape is an open source software platform for visualizing complex-networks and integrating these with any type of attribute data." target="_blank">
      <img src="/assets/img/logo-cytoscape.png" alt="Cytoscape logo" height="55px" style="padding:2px 2px" /></a>
      <a href="https://biit.cs.ut.ee/gprofiler/gost" title="g:Profiler is a public web server for characterising and manipulating gene lists." target="_blank">
      <img src="/assets/img/logo-gprofiler.png" alt="gprofiler logo" height="55px" style="padding:2px 1px" /></a>
      <a href="https://www.webgestalt.org/" title="WebGestalt is designed for functional genomic, proteomic and large-scale genetic studies from which large number of gene lists." target="_blank">
      <img src="/assets/img/logo-webgestalt.png" alt="webgestalt logo" height="55px" style="padding:2px 4px" /></a>
      <a href="https://amp.pharm.mssm.edu/Enrichr/" title="Enrichr is a comprehensive gene set enrichment analysis web server. Includes WikiPathways as one of their data sources." target="_blank">
      <img src="/assets/img/logo-enrichr.png" alt="Enrichr logo" height="55px" style="padding:2px 8px" /></a>
      <a href="https://bioconductor.org/packages/clusterProfiler/" title="The clusterProfiler R package supports GO and pathway analysis performed as overrepresentation or GSEA." target="_blank">
      <img src="/assets/img/logo-clusterprofiler.png" alt="clusterProfiler logo" height="55px" style="padding:2px 8px" /></a>
      <a href="/tools.html" style="font-size:1.0em; text-decoration:none;">and many more...</a>
                </div>
              </div>              
              <div class="col-3 mx-auto" style="display:flex;">
                <div class="container">
                <a class="btn btn-sm btn-front w-100 my-2" href="/cite.html">Cite</a>
                <a class="btn btn-sm btn-front w-100 my-2" href="/help.html#publish">Publish</a>
                <a class="btn btn-sm btn-front w-100 my-2" href="https://www.ncbi.nlm.nih.gov/pmc/?term=wikipathways&report=imagesdocsum&dispmax=100" target="_blank">Examples</a>
                </div>
              </div>
              </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
</section>
<section id="download"> 
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(0deg, #fefefe, #eaeaff 100%);">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
              <h1 style="font-family:Linux Libertine; ">Download and Access</h1><h2 style="font-family:Poppins; line-height:1.4; color: #6c757d; font-weight: normal;">Get pathway information in the format you need, including GPML (XML), GMT, SVG, <a href="download.html">and more</a>.  Programmatically access our content in multiple ways.</h2>
              <div class="row mx-auto" style="display:flex; flex-wrap: wrap;">
                <div class="col-3 px-0" style="display:flex;">
                  <div style="width:150px;">
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://data.wikipathways.org/current/gpml" target="_blank">GPML</a>
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://data.wikipathways.org/current/gmt" target="_blank">GMT</a>
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://data.wikipathways.org/current/svg" target="_blank">SVG</a>
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://data.wikipathways.org" target="_blank">Archive</a>
                  </div>
                </div>              
                <div class="col-3" style="display:flex; margin-left:40px;">
                  <div style="width:150px;">
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://webservice.wikipathways.org/" target="_blank">API</a>
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://sparql.wikipathways.org/" target="_blank">SPARQL</a>
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://bioconductor.org/packages/rWikiPathways/" target="_blank">R</a>
                  <a class="btn btn-sm btn-front w-100 my-2" href="https://github.com/kozo2/pywikipathways" target="_blank">Python</a>
                  </div>
                </div>
                <div class="col-3 mx-auto" style="display:flex;">
                </div>
              </div>
              </div>
            </div> 
          </div>
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="container">
              <div id="carouselDownload" class="carousel slide" data-ride="true" data-wrap="true">
  <ol class="carousel-indicators" style="margin-bottom:-25px;">
    <li data-target="#carouselDownload" data-slide-to="0" class="active"></li>
    <li data-target="#carouselDownload" data-slide-to="1"></li>
    <li data-target="#carouselDownload" data-slide-to="2"></li>
    <li data-target="#carouselDownload" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner" style="width:76%; margin-left: 12%;">
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
  </div>
</div>
</section>
<div style="margin-bottom:8px;"></div> 
{%- include_cached footer.html -%}
<div style="background-color:#EEEEEE"> 
  <div class="wrapper">
    <div class="thanks-wrapper">
      {%- include_cached thanks.html -%}
    </div>
  </div>
</div>
