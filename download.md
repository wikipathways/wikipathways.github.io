---
title: Download
redirect_from: 
 - /index.php/Download_Pathways
 - /index.php/Help:FileFormats
---
<div id="download">
<h1>Download and Access</h1>
<h2>GPML: Graphical Pathway Markup Language</h2>
<ul>
<li>Download an organism-specific <a href="https://data.wikipathways.org/current/gpml" target="_blank"> GPML archive</a> of pathways.</li>
<li>Download individual pathways in GPML format from each pathway page by accessing the <b>Download pathway as...</b> icon under the pathway graphic.</li>
<li>Access pathways via the <a href="https://pathvisio.org/plugins/wikipathways.html" target="_blank">WikiPathways plugin</a> in PathVisio to open a pathway in GPML format.</li>
</ul>
<h2>GMT: Gene Matrix Transposed</h2>
<ul>
<li>Download the latest organism-specific <a href="https://data.wikipathways.org/current/gmt" target="_blank">GMT</a> file for Gene Set Enrichment Analysis.</li>
</ul>
<h2>RDF: Resource Description Framework</h2>
<ul>
<li>Read about the <a href="rdf.html">WikiPathways RDF model</a>.</li>
<li>Query the WikiPathways content in <a href="https://sparql.wikipathways.org/" target="_blank">RDF format</a>.</li>
<li>Download all pathways in <a href="http://data.wikipathways.org/current/rdf" target="_blank">Turtle syntax</a>.</li>
<li>Download Reactome pathways in gpml and RDF format from the <a href="https://github.com/wikipathways/reactome-gpml" target="_blank">Reactome gpml repo</a>.</li>
</ul>
<h2>SVG: Scalable Vector Graphics</h2>
<ul>
<li>Download individual pathways in SVG format from each pathway page by accessing the <b>Download pathway as...</b> icon under the pathway graphic.</li>
<li>Download all SVG files of the latest <a href="http://data.wikipathways.org/current/svg" target="_blank">monthly release</a>.</li>
</ul>
<h2>PNG: Portable Network Graphics</h2>
<ul>
<li>Download individual pathways in PNG format from each pathway page by accessing the <b>Download pathway as...</b> icon under the pathway graphic.</li>
</ul>
<h2>Archive</h2>
<ul>
<li>Access all <a href="https://data.wikipathways.org/" target="_blank">monthly releases</a> of the WikiPathways content.</li>
<li>Access citeable DOIs for any <a href="https://zenodo.org/communities/wikipathways/search?file_type=gmt" target="_blank">GMT</a> or <a href="https://zenodo.org/communities/wikipathways/search?q=GPML&file_type=zip" target="_blank">GPML</a> release of WikiPathways content via Zenodo.</li>
</ul>
</div>
<hr>
<div id="api">
<h1>Programmatic Access</h1>
<p>The archive of current and past collections of pathways in various formats is accessible programmatically. Depending on your preferences, there are many ways to identify and access a collection of pathways or individual pathways:</p>
<ul>
<li><a href="https://github.com/wikipathways/rwikipathways" target="_blank">rWikiPathways</a> is an R package that provides programmatic access to WikiPathways content in multiple data and image formats, including official monthly release files and convenient GMT read/write functions. For example, a helper function called downloadPathwayArchive will retrieve the latest file for you per species and format, e.g.:<br /> 
<code>downloadPathwayArchive(organism="Mus musculus”, format=‘gmt’)</code></li>
<li><a href="https://github.com/kozo2/pywikipathways" target="_blank">pywikipathways</a> is a Python package for the WikiPathways API and provides the same functions as the rWikiPathways package.</li>
<!-- <li>Individual pathways can be downloaded in multiple formats via the <a href="https://webservice.wikipathways.org/ui/" target="_blank">WikiPathways API.</li> -->
<!-- <li>Filename pattern allows you to infer the filename of the latest collection given the current date. For example, since we always release our archive collections on the 10th of each month, you know that the latest filename is the nearest prior date matching that pattern, e.g., 20180910 would be the current file from Sep 10 to Oct 10, 2018. Caution: this might break if for some unforeseen reason we are unable to produce the archive on schedule.</li> -->
<li>Bash scripting allows you to scrape the currently available filenames and guarantee that you are getting the latest file no matter what the name might be. Here is an example of a one-liner to get a list of all the current GMT files:<br />
<code>echo "cat //html/body/div/table/tbody/tr/td/a" |  xmllint --html --shell http://data.wikipathways.org/current/gmt/ | grep -o -E ">(.*gmt)<" | sed -E 's/(<|>)//g'</code>
<br>
And here is a version that would return the latest GMT for mouse:<br />
<code>echo "cat //html/body/div/table/tbody/tr/td/a" |  xmllint --html --shell http://data.wikipathways.org/current/gmt/ | grep -o -E ">.*Mus_musculus.gmt<" | sed -E 's/(<|>)//g'</code></li>
</ul>
</div>
