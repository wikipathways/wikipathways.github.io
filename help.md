---
title: Help
---

<div style="background:#eee; padding:20px 0px 0px 50px">
<h1>Contents</h1>
<div class="row">
    <div class="col text-nowrap">
        <a href="#explore">Explore</a>
            <ul>
                <li><a href="#viewer">Interactive viewer</a></li>
                <li><a href="#attributes">Attributes</a></li>
                <li><a href="#participants">Participants</a></li>
                <li><a href="#references">References</a></li>
            </ul>
    </div>
    <div class="col text-nowrap">
        <a href="#navigate">Navigate</a>
            <ul>
                <li><a href="#search">Search</a></li>
                <li><a href="#browse">Browse</a></li>
                <li><a href="#communities">Communities</a></li>
                <li><a href="#authors">Authors</a></li>
            </ul>
    </div>
    <div class="col text-nowrap">
        <a href="#participate">Participate</a>
            <ul>
                <li><a href="#create">Create</a></li>
                <li><a href="#curate">Curate</a></li>
                <li><a href="#code">Code</a></li>
                <li><a href="#analyze">Analyze</a></li>
                <li><a href="#publish">Publish</a></li>
            </ul>
    </div>
</div></div>

<div id="explore">
<div id="viewer">
<h1>Interactive Pathway Viewer</h1>
<p>Each pathway has a dedicated page that includes an interactive view. Zoom in and out by scrollwheel, pan by click-n-drag, and click on genes, proteins and metabolites to open external pages in Scholia dedicated to each molecule. Here's an example:
</p>
<iframe src ="https://pathway-viewer.toolforge.org/?id=WP554" width="500px" height="350px" style="overflow:hidden;margin-left:200px;"></iframe>
<p><b><i>Pro-tip:</i></b> Click on the "option" button in the lower-right to download the pathway in one of a variety of formats, or to view the pathway in its own window to help you explore the details. This is also where you'll find a permalink for the page that you can cite and embed code so you can include this interactive viewer in your own web site.
</p>
</div>
<div id="attributes">
<h1>Pathway Attributes</h1>
<p>In addition to the title and description at the top of each pathway page, you'll also find (in order):
<ul>
<li>the status of the pathway, including last-edited date, whether new edits are under review and if it passes all curation checks</li>
<li>all the authors that have contributed to that pathway over the years</li>
<li>links to any publications citing this pathway</li>
<li><a class="btn btn-sm btn-organism btn-pill" style="font-size:small" href="browse/organisms.html"> Organism</a> represented by the pathway</li>
<li><a class="btn btn-sm btn-community btn-pill" style="font-size:small" href="browse/communities.html"> Communities</a> that are interested in the pathway</li>
<li><a class="btn btn-sm btn-annotation btn-pill" style="font-size:small" href="browse/annotations.html"> Annotation</a> from Pathway, Disease and Cell Type ontologies </li>
<li>links to any publications citing this pathway</li>
</ul>
</p>
</div>
<div id="participants">
<h1>Participants in a Pathway</h1>
<p>A table of participants lists the names, types, and sources for every identified gene, protein and small molecule in a given pathway. 
</p>
<p><b><i>Pro-tip:</i></b> Click on the "option" button in the lower-right to download the complete table which includes mappings to many common identifiers. This button also includes functionality to query external services, like <a href="https://drugst.one/">Drugst.One</a>, using the list of participants as the query input.
</p>
</div>
<div id="references">
<h1>Literature References</h1>
<p>As authors construct a pathway or make new additions, they add literature references to the bibliography of a given pathway. The reference list also includes links to PubMed, Europe PMC and Scholia. The references can also be downloaded as a table (see the "option" button).
</p>
</div></div>

<hr>
<div id="navigate">
<div id="search">
<h1>Search for Pathways</h1>
<p>The WikiPathways collection can be searched by gene symbol, pathway name or other keywords, either directly in the Search field at the top of each page and on the front page, or using the <a href="/browse/table.html">table view</a>. For example, search for your favorite pathway by a word from the title (i.e. "Statin"), or your favorite gene either by symbol (i.e. "BRCA1").</p> 

<p>The <a href="/browse/table.html">table view</a> of the current collection offers a nice way to interactively explore pathways by searching for various parameters. The table displays all pathways, and entering for example keywords, WPIDs or other parameters in the search fields at the top of each column filters the table. For example:</p>
<ul>
<li>To see all pathways related to adipogenesis in humans, type <b>adipogenesis</b> in the search field at the top of the <b>Pathway Title</b> column, and type <b>Homo sapiens</b> in the search field at the top of the <b>Organism</b> column.</li>
<li>To see all mouse pathways edited in 2022, type <b>Mus musculus</b> in the search field at the top of the <b>Organism</b> column and type <b>2022</b> in the search field at the top of the <b>Last Edited</b> column.</li>
</ul>
<div id="browse">
<h1>Browse Pathways</h1>
<p>The <a href="/browse/filters.html">browse page</a> displays content in either gallery or list view, which can be filtered by a combination of parameters. For example:</p>
<ul>
<li>To see all human pathways cancer pathways sorted by newest pathway, select <b>Homo sapiens</b> from <b>Organism</b>, <b>disease of cellular proliferation</b> from <b>Disease Ontology</b> and click the <b>Date</b> button at the top.</li>
<li>To see all yeast classic metabolic pathways sorted by title, select <b>Saccharomyces cerevisiae</b> from <b>Organism</b>, <b>classic metabolic pathway</b> from <b>Pathway Ontology</b>, then click the <b>Title</b> button at the top.</li>
</ul>
<p>The WikiPathways collection can be browsed by shared attributes:  
{% assign sorted_browse = site.browse | where_exp:"item","item.btn-class contains 'pill'" | sort: "order" %}
{% for bp in sorted_browse %}
    <a class="btn btn-sm {{bp.btn-class}}" href="{{bp.url}}"> {{ bp.display-title }}</a>
{% endfor %}. As well as by <a class="btn btn-sm btn-front" style="font-size:small" href="browse/authors.html"> Authors</a> or by whether they are 
 <a class="btn btn-sm btn-front" style="font-size:small" href="browse/new.html"> New</a> or recently
  <a class="btn btn-sm btn-front" style="font-size:small" href="browse/updates.html"> Updated</a>.
</p>
</div>
<div id="communities">
<h1>Join a Community</h1>
<p>WikiPathways <a href="/browse/communities.html">Communities</a> organize pathways specific to a research area or organism. Community pages are designed to make it easier to explore relevant pathway content, learn more about the community and to organize pathway curation.</p>
<ul>
<li>To contribute pathway content to a community, refer to each <a href="/browse/communities.html">community page</a> for details on how to contribute.</li>
<li>To learn how to create or edit a community page, see our <a href="/help_communities.html">Communities Help</a>.</li>
</ul>
</div>
<div id="authors">
<h1>Get Recognition</h1>
<p>Each of the <a href="/browse/authors.html">authors</a> who has contributed to WikiPathways has their own profile page. In addtion to a standard biographicial field and professional linkouts, these pages provide a gallery listing of all the pathways edited by a given author. See the sections below to learn more about how to contribute to WikiPathways while enabling your own research.</p>
</div></div>

<hr>
<div id="participate">
<div id="create">
<h1>Create Content</h1>
<ul>
<li>Get started as a <a href="/contribute.html">WikiPathways Contributor</a> today!</li>
<li>Learn everything about creating and editing pathways, from the basics to advanced topics at the <a href="https://wikipathways.github.io/academy/" target="_blank">WikiPathways Academy</a>.</li>
<li>For more detailed information on making pathway models, see <a href="https://doi.org/10.1371/journal.pcbi.1009226" target="_blank">Ten simple rules for creating reusable pathway models for computational analysis and visualization</a>.</li>
<li>Check out the <a href="https://www.youtube.com/channel/UCTkyLj_4u6V4M5lUmyuOGDw">PathVisio YouTube Channel</a> for videos on how to use PathVisio for pathway editing.</li> 
</ul>
</div>
<div id="curate">
<h1>Curate Changes</h1>
<p>To maintain WikiPathways as a high-quality pathway resource, a weekly rotation of community editors work to ensure the quality of new content and edits to existing content. Our <a href="https://new.wikipathways.org/academy/qaprotocol.html" target="_blank">Quality Assurance Protocol</a> checks for the following things:</p>
<ul>
<li>Do pathway nodes have valid database identifiers?</li>
<li>Are interactions properly connected to nodes?</li>
<li>Do pathway titles conform to guidelines?</li>
<li>Are all pathways tagged with appropriate ontology tags, and does each pathway have a useful description?</li>
</ul>
<p>Anyone is welcome to join as a Community Editor. Please <a href="https://github.com/wikipathways/wikipathways-help/discussions" target="_blank">contact us</a> if you are interested.</p>
</div>
<div id="code">
<h1>Code New Features</h1>
<p>Want to join the WikiPathways Development Community? Visit our <a href="https://github.com/wikipathways/wikipathways-development" target="_blank">GitHub repo</a> to learn more.</p>
</div>
<div id="analyze">
<h1>Analyze Your Data</h1>
<p>WikiPathways models can be used for data visualization and analysis in many tools:</p>
<ul>
    <li>Learn how to use WikiPathways in <a href="/analyze.html">enrichment analysis, data visualization in PathVisio and Cytoscape, and querying the WikiPathways RDF.</a></li>
    <li>See a listing of all <a href="/tools.html">tools supporting WikiPathways</a>.</li>
</ul>
</div>
<div id="publish">
<h1>Publish Pathway Figures</h1>
<h2>Citing WikiPathways</h2>
<p>If you include WikiPathways in your publications, please review our <a href="/cite.html">How to Cite</a> page for details on referencing the WikiPathways project.</p>
<h2>Downloading and Accessing Individual Pathways</h2>
<p>On each pathway page, a set of options for download and links is a available in the <b>options</b> drop-down under pathway image, the <b>Participants</b> table and the <b>References</b> list. Each of these options can also be accessed directly by using the below URL patterns:</p>
<!-- <img src="/assets/img/help/DownloadOptions.png" alt="Markdown Example" width="600"> -->
<ul>
<li><b>Permalink</b>: The permanent link to a specific pathway has the pattern <code>https://www.wikipathways.org/instance/{WPID}</code>.</li>
<li><b>Embed code</b>: The code to embed a pathway image into webpage has the pattern <code>&lt;iframe src ="https://pathway-viewer.toolforge.org/?id={WPID}`" width="600px" height="300px" style="overflow:hidden;"&gt;&lt;/iframe&gt;</code>.</li>
<li><b>Full size image:</b> The link to a full size pathway image has the URL pattern <code>https://pathway-viewer.toolforge.org/?id={WPID}</code></li>
<li><b>PNG:</b> The link to the PNG version of a pathway image has the URL pattern <code>https://assets.wikipathways.org/pathways/{WPID}/{WPID}.png</code>.</li>
<li><b>SVG:</b> The link to the SVG version of a pathway image has the URL pattern <code>https://assets.wikipathways.org/pathways/{WPID}/{WPID}.svg</code></li>
<li><b>GPML:</b> Using the option <b>Dowbload GPML</b> will downloaded the GPML code for the pathway. The URL pattern to access this file is <code>https://gitcdn.link/cdn/wikipathways/wikipathways-database/main/pathways/{WPID}/{WPID}.gpml</code></li>
<li><b>Participants:</b> Using the option <b>Download TSV</b> option will downloaded a TSV-formatted table of the data nodes for the pathway. The URL pattern to access this file is <code>https://gitcdn.link/cdn/wikipathways/wikipathways.github.io/main/_data/{WPID}-datanodes.tsv</code></li>
<li><b>References:</b> Using the option <b>Download TSV</b> will downloaded a TSV-formatted table of the literature for the pathway. The URL pattern to access this file is <code>https://gitcdn.link/cdn/wikipathways/wikipathways.github.io/main/_data/{WPID}-bibliography.tsv</code></li>
</ul>
<a id="widget"/>
<h2>Visualizing Data on Pathways</h2>
<p>If you want to include data visualizations of pathway figures in your publication, refer to our <a href="https://cytoscape.org/cytoscape-tutorials/protocols/wikipathways-app/#/title" target="_blank">tutorial</a> describing data visualization on pathways in Cytoscape. From this workflow, you can get high-resolution images to include in manuscript, posters and other publications.</p>
<p>You can also achieve a simpler visualization with just a few nodes highlighted, you can use our interactive pathway viewer. Nodes can matched by label("label") or external reference("xref") and colors("colors") can be specified by name or hexadecimal code. Some data mapping is possible when specifying nodes by xref.</p>
<ul>
<li><b>Highlight nodes by label and color:</b> Nodes specified by node label; <code>https://pathway-viewer.toolforge.org/?id=WP528&lightgreen=PEMT" width="600px" height="300px" style="overflow:hidden;</code>.</li>
<li><b>Highlight multiple nodes by label and color:</b> Multilpe nodes specified; <code>https://pathway-viewer.toolforge.org/?id=WP528&lightgreen=PEMT&pink=Choline&lightblue=CHKA" width="600px" height="300px" style="overflow:hidden;</code>.</li>
<li><b>Highlight node by xref and color:</b> Nodes specified by the external reference identifier assigned to them; <code>https://pathway-viewer.toolforge.org/?id=WP528&lightgreen=Entrez_Gene_10400&pink=CAS_62-49-7&lightblue=Entrez_Gene_1119</code>.</li>
<li><b>Highlight node by xref and color:</b> Nodes specified using Ensembl identifiers, while the pathway uses NCBI Gene identifiers for nodes; <code>https://pathway-viewer.toolforge.org/?id=WP528&yellow=Ensembl_ENSG00000110721,Ensembl_ENSG00000161217</code>.</li>
<br /><p>To embed either of these as an iframe, simply add the iframe tag and parameters like so: <br />
<code>&lt;iframe src ="https://pathway-viewer.toolforge.org/?id=WP528&yellow=Ensembl_ENSG00000110721,Ensembl_ENSG00000161217" width="600px" height="300px" style="overflow:hidden;"&gt;&lt;/iframe&gt;</code> <br />
This code will produce the following iframe:</p>
<br />
<iframe src ="https://pathway-viewer.toolforge.org/?id=WP528&yellow=Ensembl_ENSG00000110721,Ensembl_ENSG00000161217" width="600px" height="300px" style="overflow:hidden;"></iframe>
</ul>
</div></div>

<hr>
<div id="faq">
<h1>FAQ</h1>
<p>Have a question? See if the answer is in our collection of <a href="https://github.com/wikipathways/wikipathways-faq/discussions" target="_blank">frequently asked questions</a>.</p>
</div>
<!-- <h2>Request Web service access</h2>
<p>To request web service access for an existing WikiPathways account (for WikiPathways plugin in PathVisio), contact kristina.hanspers[AT]gladstone.ucsf.edu.</p> -->