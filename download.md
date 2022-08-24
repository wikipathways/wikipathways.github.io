---
title: Download
---
<div id="download">
<h2>Download and Access</h2>
<br>
<h5>GPML: Graphical Pathway Markup Language</h5>
<ul>
<li>Download an organism-specific <a href="https://data.wikipathways.org/current/gpml" target="_blank"> GPML archive</a> of pathways.</li>
<li>Download individual pathways in GPML format from each pathway page by accessing the <b>options</b> drop-down under the pathway graphic.</li>
<li>Access pathways via the <a href="https://pathvisio.org/plugins/wikipathways.html" target="_blank">WikiPathways plugin</a> in PathVisio to open a pathway in GPML format.</li>
</ul>
<h5>GMT: Gene Matrix Transposed</h5>
<ul>
<li>Download the latest organism-specific <a href="https://data.wikipathways.org/current/gmt" target="_blank">GMT</a> file for Gene Set Enrichment Analysis.</li>
</ul>
<h5>RDF: Resource Description Framework</h5>
<ul>
<li>Query the WikiPathways content in <a href="https://sparql.wikipathways.org/" target="_blank">RDF format</a>.</li>
<li>Download all pathways in <a href="http://data.wikipathways.org/current/rdf" target="_blank">Turtle syntax</a>.</li>
</ul>
<h5>SVG: Scalable Vector Graphics</h5>
<ul>
<li>Download individual pathways in SVG format from each pathway page by accessing the <b>options</b> drop-down under the pathway graphic.</li>
<li>Download all SVG files of the latest <a href="http://data.wikipathways.org/current/svg" target="_blank">monthly release</a>.</li>
</ul>
<h5>PNG: Portable Network Graphics</h5>
<ul>
<li>Download individual pathways in PNG format from each pathway page by accessing the <b>options</b> drop-down under the pathway graphic.</li>
</ul>
<h5>PDF: Portable Document Format</h5>
<ul>
<li>Download individual pathways in PDF format from each pathway page by accessing the <b>options</b> drop-down under the pathway graphic.</li>
</ul>
<h5>Archive</h5>
<ul>
<li>Access all <a href="https://data.wikipathways.org/" target="_blank">monthly releases</a> of the WikiPathways content.</li>
</ul>
</div>
<hr>
<div id="api">
<h2>Programmatic Access</h2>
<p>The archive of current and past collections of pathways in various formats is accessible programmatically. Depending on your preferences, there are many ways to identify and acess the collection or pathways you need.</p>
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