---
title: Help
redirect_from: 
 - /index.php/Help:Contents
 - /index.php/PathwayWidget
 - /index.php/Help:Guidelines
 - /index.php/Help:Guidelines_EditorPalette
 - /index.php/Help:DataVisualizationInCytoscape
---
<script>
  var div = document.getElementById("navbarNavAltMarkup");
  div.classList.add("show");
</script>

<div style="background:#eee; padding:20px 0px 0px 50px">
<h1>Help Topics</h1>
<div class="row">
    <div class="col text-nowrap">
        <a href="#investigate">Investigate</a>
            <ul>
                <li><a href="#viewer">Interactive viewer</a></li>
                <li><a href="#attributes">Attributes</a></li>
                <li><a href="#participants">Participants</a></li>
                <li><a href="#references">References</a></li>
                <li><a href="#editing">Editing</a></li>
            </ul>
    </div>
    <div class="col text-nowrap">
        <a href="#navigate">Navigate</a>
            <ul>
                <li><a href="#site">Site</a></li>
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

<div id="investigate">
<div id="viewer">
<h1>Interactive Pathway Viewer</h1>
<p>Each pathway has a dedicated page that includes an interactive view. Zoom in and out by scrollwheel, pan by click-n-drag, and click on genes, proteins and metabolites to open external pages in Scholia dedicated to each molecule. Here's an example:
</p>
<iframe src ="https://pathway-viewer.toolforge.org/?id=WP554" width="500px" height="350px" style="overflow:hidden;margin-left:200px;"></iframe>
  <div style="margin:-8px 0px 18px 445px; float:left">
    <input type="button" class="badge badge-secondary" value="view in new tab" style="display: inline; padding: 4px;"
    onclick="window.open(&#39;https://pathway-viewer.toolforge.org/?id=WP554&#39;, '_blank');"/>
  </div>
  <div class="dropdown" style="margin:-8px 0px 14px 4px; float:left">
    <button class="badge badge-secondary dropdown-toggle" style="padding: 4px;" type="button" id="dropdownMenuButton" data-toggle="dropdown"
      aria-haspopup="true" aria-expanded="false">
      download
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <a class="dropdown-item" href="/wikipathways-assets/pathways/WP554/WP554.png" download>Download PNG</a>
      <a class="dropdown-item" href="/wikipathways-assets/pathways/WP554/WP554.svg" download>Download SVG</a>
      <a class="dropdown-item" href="/wikipathways-assets/pathways/WP554/WP554.json" download>Download JSON</a>
      <a class="dropdown-item" href="/wikipathways-assets/pathways/WP554/WP554.gpml" download>Download GPML</a>
    <!-- <a class="dropdown-item" href="https://www.sejda.com/html-to-pdf?save-link={{site.url}}/pathways/WP554.html" target="_blank">Generate PDF of page</a> -->
    </div>
  </div>
  <div class="dropdown" style="margin:-8px 0px 10px 635px;">
    <button class="badge badge-secondary dropdown-toggle" style="padding: 4px;" type="button" id="dropdownMenuButton" data-toggle="dropdown"
      aria-haspopup="true" aria-expanded="false">
      options
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <a class="dropdown-item" href="../cite.html">How to Cite</a>
      <button class="dropdown-item copy-btn" type="button" to-copy="https://www.wikipathways.org/instance/WP554">Copy permalink</button>
      <button class="dropdown-item embed-btn" type="button" to-copy='<iframe src ="https://pathway-viewer.toolforge.org/?id=WP554" width="600px" height="300px" style="overflow:hidden;"></iframe>'>Copy embed code</button>
    {% if page.ndex %}
    <a class="dropdown-item" href="https://www.ndexbio.org/viewer/networks/427c38c3-da09-11eb-b666-0ac135e8bacf" target="_blank">Open in NDEx</a>
    {% endif %}
    </div>
  </div>
  <br/>
<p><b><i>Pro-tip:</i></b> Use the buttons in the lower-right to download the pathway in one of a variety of formats, or to view the pathway in its own window to help you explore the details. Under <b>options</b> you'll find a permalink for the page that you can cite and embed code so you can include this interactive viewer in your own web site.
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
<p><b><i>Pro-tip:</i></b> Click on the <b>options</b> button in the lower-right to download the complete table which includes mappings to many common identifiers. This button also includes functionality to query external services, like <a href="https://drugst.one/">Drugst.One</a>, using the list of participants as the query input.
</p>
</div>
<div id="references">
<h1>Literature References</h1>
<p>As authors construct a pathway or make new additions, they add literature references to the bibliography of a given pathway. The reference list also includes links to PubMed, Europe PMC and Scholia. The references can also be downloaded as a table (see the <b>options</b> button).
</p>
</div><div id="editing">
<h1>How to Edit</h1>
<p>To edit the pathway diagram and properties such as title, description, and participants, you should use our PathVisio drawing tool. See the <a href="#create">Create</a> section below.  In addition to the pathway model, you can also edit the <b>Cited In</b> and <b>Communities</b> sections directly on the site. Click on the pencil icons <span title="Edit cited in" style="color: #666; font-size: 1.0em;"><i class="fa fa-pencil"></i></span> near the section headers on each pathway page.
</p>
</div></div>

<hr>
<div id="navigate">
</div><div id="site">
<h1>Navigating the Website</h1>
<p>At the top of every page is a clickable logo that will take you to the home page, a search bar (see below), and a menu icon <span style="width: 26px; height: 22px; display:inline-block;border: gray;border-width: 1px;border-style: solid; background-image: url(&quot;data:image/svg+xml;charset=utf8,%3Csvg viewBox='-5 -2 36 34' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E&quot;)"></span>. The menu provides quick links to common pages. At the bottom of every page is a footer with information and links, including:
</p>
<ul>
<li>the status of the overall site and when it was last updated</li>
<li>a declaration of our CC0 waiver on all pathway content</li>
<li>a column of external links for our code repository, social media, and public forum</li>
<li>a few columns of common resource links related to using WikiPathways</li>
</ul>
</div>
<div id="search">
<h1>Search for Pathways</h1>
<p>The WikiPathways collection can be searched by gene symbol, pathway name or other keywords, in the Search field at the top of each page. By default, the first 40 results will appear on the search results page. You can also include organism, ontology annotations, WPIDs, and even last-edited dates in your query. Multi-term queries are processed as AND queries. Here are some example queries:</p>
<ul>
<li>Search for your favorite pathway by a word from the title, i.e. "Statin".</li>
<li>Search your favorite gene by symbol, i.e. "BRCA1".</li>
<li>Search for all human pathways that include ACE2 and aldosterone with the query "ace2 aldosterone human".</li>
<li>Search for all cancer pathways updated in 2023 with the query "cancer 2023".</li>
</ul> 

<p>The <a href="/browse/table.html">Table</a> view of the current collection offers a nice way to interactively explore pathways by searching for various parameters. The table displays all pathways, and offers search fields at the top of each column to filter the table. Additional sort options become available when the filtered set is fewer than 200 pathways. Example usage:</p>
<ul>
<li>To see all pathways related to adipogenesis in humans, type "adipogenesis" in the search field at the top of the <b>Pathway Title</b> column, and type "Homo sapiens" in the search field at the top of the <b>Organism</b> column.</li>
<li>To see all mouse pathways edited in 2022, type "Mus musculus" in the search field at the top of the <b>Organism</b> column and type "2022" in the search field at the top of the <b>Last Edited</b> column.</li>
</ul>
<div id="browse">
<h1>Browse Pathways</h1>
<p>The <a href="/browse/filters.html">Filters</a> page displays content in either gallery or list view, which can be filtered by multiple categories. Additional sort options become available when the filtered set is fewer than 200 pathways. Example usage:</p>
<ul>
<li>To see all human pathways cancer pathways sorted by newest pathway, select <b>Homo sapiens</b> from <b>Organism</b>, <b>disease of cellular proliferation</b> from <b>Disease Ontology</b> and click the <b>Date</b> button at the top.</li>
<li>To see all yeast classic metabolic pathways sorted by title, select <b>Saccharomyces cerevisiae</b> from <b>Organism</b>, <b>classic metabolic pathway</b> from <b>Pathway Ontology</b>, then click the <b>Title</b> button at the top.</li>
</ul>
<p>The WikiPathways collection can be browsed by shared attributes:  
{% assign sorted_browse = site.browse | where_exp:"item","item.btn-class contains 'pill'" | sort: "order" %}
{% for bp in sorted_browse %}
    <a class="btn btn-sm {{bp.btn-class}}" href="{{bp.url}}"> {{ bp.display-title }}</a>
{% endfor %}, as well as by <a class="btn btn-sm btn-front" style="font-size:small" href="browse/authors.html"> Authors</a> or by whether they are 
 <a class="btn btn-sm btn-front" style="font-size:small" href="browse/new.html"> New</a> or recently
  <a class="btn btn-sm btn-front" style="font-size:small" href="browse/updated.html"> Updated</a>.
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
<p>Each of the <a href="/browse/authors.html">authors</a> who has contributed to WikiPathways has their own profile page. In addtion to a standard biographicial field and professional linkouts, these pages provide a gallery listing of all the pathways edited by a given author. Click on the pencil icons <span title="Edit cited in" style="color: #666; font-size: 1.0em;"><i class="fa fa-pencil"></i></span> next to your name to edit your user profile. See the sections below to learn more about how to contribute to WikiPathways while enabling your own research.</p>
<p><b><i>Pro-tip:</i></b> Your profile picture comes directly from your associated GitHub account. Update your avatar on <a href="https://github.com/settings/profile">your GitHub settings page</a> to update the picture shown in your WikiPathways author profile.
</p>
</div></div>

<hr>
<div id="participate">
<div id="create">
<h1>Create Content</h1>
<p>You can contribute to WikiPathways by creating new pathway models or by improving existing models:</p>
<ul>
<li>Get started as a <a href="/contribute.html">WikiPathways Contributor</a> today!</li>
<li>Learn everything about creating and editing pathways, from the basics to advanced topics at the <a href="https://wikipathways.github.io/academy/" target="_blank">WikiPathways Academy</a>.</li>
<li>For more detailed information on making pathway models, see <a href="https://doi.org/10.1371/journal.pcbi.1009226" target="_blank">Ten simple rules for creating reusable pathway models for computational analysis and visualization</a>.</li>
<li>Check out the <a href="https://www.youtube.com/channel/UCTkyLj_4u6V4M5lUmyuOGDw">PathVisio YouTube Channel</a> for videos on how to use PathVisio for pathway editing.</li> 
</ul>
</div>
<div id="curate">
<h1>Curate Changes</h1>
<p>To maintain WikiPathways as a high-quality pathway resource, a weekly rotation of community editors work to ensure the quality of new content and edits to existing content. Our <a href="https://wikipathways.org/academy/qaprotocol.html" target="_blank">Quality Assurance Protocol</a> checks for the following things:</p>
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
<li><b>PNG:</b> The link to the PNG version of a pathway image has the URL pattern <code>https://www.wikipathways.org/wikipathways-assets/pathways/{WPID}/{WPID}.png</code>.</li>
<li><b>SVG:</b> The link to the SVG version of a pathway image has the URL pattern <code>https://www.wikipathways.org/wikipathways-assets/pathways/{WPID}/{WPID}.svg</code></li>
<li><b>JSON:</b> The link to the JSON version of a pathway has the URL pattern <code>https://www.wikipathways.org/wikipathways-assets/pathways/{WPID}/{WPID}.json</code></li>
<li><b>GPML:</b> Using the option <b>Dowbload GPML</b> will downloaded the GPML code for the pathway. The URL pattern to access this file is <code>https://www.wikipathways.org/wikipathways-assets/pathways/{WPID}/{WPID}.gpml</code></li>
<li><b>Participants:</b> Using the option <b>Download TSV</b> option will downloaded a TSV-formatted table of the data nodes for the pathway. The URL pattern to access this file is <code>https://gitcdn.link/cdn/wikipathways/wikipathways.github.io/main/_data/{WPID}-datanodes.tsv</code></li>
<li><b>References:</b> Using the option <b>Download TSV</b> will downloaded a TSV-formatted table of the literature for the pathway. The URL pattern to access this file is <code>https://gitcdn.link/cdn/wikipathways/wikipathways.github.io/main/_data/{WPID}-bibliography.tsv</code></li>
</ul>
<a id="widget"/>
<h2>Visualizing Data on Pathways</h2>
<p>You can achieve quick and easy pathway visualizations highlighting multiple nodes with mulitple colors in a single pathway using our interactive pathway viewer.</p>
<p><b><i>Pro-tip:</i></b> Click the <b>View full size</b> button in the lower-right corner of the pathway viewer. This will open a new tab where you can immediately add node names and colors to the url as paramaters (e.g., "?red=ACE").
</p>
<ul>
<li><b>Highlight nodes by label and color:</b> Nodes specified by node label; <code>https://pathway-viewer.toolforge.org/embed/WP554?red=ACE</code>.</li>
<li><b>Highlight multiple nodes by label and color:</b> Multilpe nodes specified; <code>https://pathway-viewer.toolforge.org/embed/WP554?red=ACE&lightgreen=AGT</code>.</li>
<li><b>Highlight node by xref and color:</b> Nodes specified by the external reference identifier assigned to them; <code>https://pathway-viewer.toolforge.org/embed/WP554?red=Ensembl_ENSG00000159640</code>.</li>

<p>If you want even more control over your pathway visualizations, like editing and adding objects, then refer to our <a href="https://cytoscape.org/cytoscape-tutorials/protocols/wikipathways-app/#/title" target="_blank">tutorial</a> describing data visualization on pathways in Cytoscape. From this workflow, you can get high-resolution images to include in manuscript, posters and other publications.</p>

<h2>Embedding Pathway Visualizations in Web Pages</h2>
<p>You can easily embed a simple pathway diagram in any web page using the embed code that is available in the <b>options</b> drop-down under the pathway image. This code has the following pattern:</p>
<br />
<code>&lt;iframe src ="https://pathway-viewer.toolforge.org/?id={WPID}`" width="600px" height="300px" style="overflow:hidden;"&gt;&lt;/iframe&gt;</code>.
<p>An example of embedding of a WikiPathways pathway diagram in a website can be found on the <a href="https://www.lipidmaps.org/resources/pathways/wikipathways/WP4345" target="_blank">LIPIDMAPS</a> website.</p>
<br />
<p>It is also possible to embed a pathway with node visualization (described above) in a similar way, simply by adding the iframe tag and parameters like so: <br />
<code>&lt;iframe src ="https://pathway-viewer.toolforge.org/embed/WP554?red=ACE&lightgreen=AGT" width="600px" height="300px" style="overflow:hidden;"&gt;&lt;/iframe&gt;</code> <br />
This code will produce the following iframe:</p>
<br />
<iframe src ="https://pathway-viewer.toolforge.org/embed/WP554?red=ACE&lightgreen=AGT" width="500px" height="350px" style="overflow:hidden;"></iframe>
</ul>
<br />
</div></div>

<hr>
<a id="move_from_classic"/>
<h1>Move from classic WikiPathways</h1>
<p>We are still in the process of moving from the classic WikiPathways site, and during this time some aspects of the site will work differently:</p>
<ul>
    <li>Uploading pathway content and making edits to pathways will <b>require a WikiPathways account</b>, since content is still being deposited to the classic site (<a href="https://classic.wikipathways.org/" target="_blank">https://classic.wikipathways.org/</a>). Once the move is complete, a GitHub account will be sufficient to upload/edit pathways at WikiPathways.</li>
    <li>This website <b>contains only approved pathways</b> that have undergone review. Consequently, newly uploaded pathways will be immediately available on the classic site (<a href="https://classic.wikipathways.org/" target="_blank">https://classic.wikipathways.org/</a>), but will not be visible on this site until they are completed and approved. Once a pathway is uploaded to WikiPathways classic, the process of including them on the new site is as follows:</li>
        <ul>
            <li><b>Pathways under construction</b>: If your pathway is still under construction, keep the "Under Construction" tag. You can keep working on the pathway and it will stay on the classic site.</li>
            <li><b>Completed pathways</b>: If your pathway is complete, remove the "Under Construction" tag. The pathway will be reviewed by our Curators. Once it is approved, it will be made available on the new site. This process typically takes 5-7 days right now.</li>
        </ul>
</ul>

<hr>
<div id="faq">
<h1>FAQ</h1>
<p>Have a question? See if the answer is in our collection of <a href="https://github.com/wikipathways/wikipathways-faq/discussions" target="_blank">frequently asked questions</a>.</p>
</div>
<!-- <h2>Request Web service access</h2>
<p>To request web service access for an existing WikiPathways account (for WikiPathways plugin in PathVisio), contact kristina.hanspers[AT]gladstone.ucsf.edu.</p> -->

<script>

  const copyBtn = document.querySelector('.copy-btn');
  const toCopy = document.querySelector('.copy-btn').getAttribute('to-copy');

  copyBtn.addEventListener('click', () => {
    navigator.clipboard.writeText(toCopy)
      .then(() => {
        toCopy.value = '';
      })
      .catch(err => {
        console.log('Something went wrong', err);
      })
  });

  const embedBtn = document.querySelector('.embed-btn');
  const toEmbed = document.querySelector('.embed-btn').getAttribute('to-copy');

  embedBtn.addEventListener('click', () => {
    navigator.clipboard.writeText(toEmbed)
      .then(() => {
        toEmbed.value = '';
      })
      .catch(err => {
        console.log('Something went wrong', err);
      })
  });
</script>
