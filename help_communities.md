---
title: Help Communities
redirect_from: /index.php/Help:WikiPathways_Portals
---
<div id="update community">
<h1>Updating an Existing Community Page</h1>
<p>To make simple edits to existing community pages, for example updating the list of pathways, you can make the edits directly in the GitHub web interface (described here). A GitHub account is required. You can also make the same type of edits using a local clone (described below).</p>
<h2>Define or Update the Pathway Set</h2> 
<p>The pathway set defined for each Community is simply a flat file list of all WikiPathways Identifiers (WPIDs) relevant for that Community. The list of pathway IDs for each Community is stored in the wikipathways-database repository, in the <a href="https://github.com/wikipathways/wikipathways-database/tree/main/communities" target="_blank">communities directory</a>.</p>
<ol>
<li>Navigate to the relevant Community page.</li>
<li>Click the <b>Edit community pathways</b> button (pencil icon) next to the <b>Community Pathways</b> list on the Community page.</li>
<li>Make the edit directly in the GitHub web interface (i.e. add or delete WPIDs for the community) and click <b>Commit changes....</b> when done.</li>
</ol>
<hr>
<h2>Edit a Community Page</h2>
<p>All Commuity pages are designed using the same template layout, and the content of each Community is defined in a markdown file in the <a href="https://github.com/wikipathways/wikipathways.github.io/tree/main/_communities" target=_blank>communities directory</a>. In order to be processed correctly by Jekyll, the markdown file must have a YAML <b>front matter</b> block at the beginning of the file, defining a set of custom variables. The front matter must be contained within a set of triple-dashed lines (---). After the front matter code, the file can contain additional html for custom content. The variables defined for WikiPathways Communities are:</p>
<ul>
<li>display-name: The name of the Community displayed on the <a href="https://wikipathways.org/browse/communities.html" target=_blank>Communities</a> page</li>
<li><b>title</b></li>
<li><b>description</b>: Text describing the Community</li>
<li><b>short-description</b>: One or two sentences describing the Community, displayed on the <a href="https://wikipathways.org/browse/communities.html" target=_blank>Communities</a> page</li>
<li><b>logo</b>: a link to a png image (optional)</li>
<li><b>logo-link</b>: URL for an external resource (optional)</li>
<li><b>logo-height</b>: Override default height of 40px (optional)</li>
<li><b>support</b>: Text describing any funding support for the Community (optional)</li>
<li><b>contribute</b>: Text describing how to contribute to the community (optional)</li>
<li><b>community-tag</b>: The relevant community tag. This should match the filename of the text file with the list of Community pathways The pathway display on the Community page is automatically generated based on this tag</li>
<li><b>redirect_from</b>: Partial URL on the old WikiPathways site to redirect from</li>
</ul>
<p>As an example, the below image shows the markdown for the <a href="https://wikipathways.org/communities/aop.html" target=_blank>Adverse Outcome Pathways</a> Community.<br /><br />
<img src="/assets/img/help/MarkdownExample.png" alt="Markdown Example" width="700">
</p>
<ol>
<li>Navigate to the relevant Community page.</li>
<li>Click the <b>Edit community pathways</b> button (pencil icon) next to the title of the Communit at the top of the Community page.</li>
<li>Edit the .md file directly in the GitHub web interface and click <b>Commit changes....</b> when done.</li>
</ol>
</div>    
<hr>
<div id="create community">
<h1>Creating a New Community Page</h1>
<p>
<h2>Clone Necessary Repositories</h2>
<p>To create a new Community page, you will need to make edits to two repositories. If you have write access to these, you can simply commit your changes, otherwise create a pull request. You can edit the files (markdown and text) in any text editor, but a code editor is recommended, for example <a href="https://code.visualstudio.com/" target=_blank>Visual Studio Code</a>.</p>
<ol>
<li>Clone <a href="https://github.com/wikipathways/wikipathways-database" target=_blank>wikipathways-database</a>.</li>
<li>Clone <a href="https://github.com/wikipathways/wikipathways.github.io" target=_blank>wikipathways.github.io</a>.</li>
<li>For wikipathways.github.io, refer to the <a href="https://github.com/wikipathways/wikipathways.github.io#readme">README</a> for instructions on how to build the site locally for testing purposes.</li>
</ol>
<h2>Create a new Community page</h2>
<ol>
<li>In your local clone of the <b>wikipathways.github.io</b> repo, create a new .md file in the communities directory. <b>Pro-tip</b>: copy an existing file and rename it.</li>
<li>Edit the contents of the variables for your Community.</li>
<li>Save the .md file and either push the change to GitHub (if you have write permissions) or create a pull request.</li>
</ol>
<h2>Add a pathway list for a new Community page</h2>
<ol>
<li>Create a simple .txt file with the relevant WPIDs listed as <b>one column, no header</b>.</li>
<li>Give the the .txt file a name that can also be used as the <b>community-tag</b>. These two must be identical. In the example above (AOP Community), the name of the pathway list file and the community-tag is "AOP".</li>
<li>If you have write permissions push the change to GitHub, otherwise create a pull request.</li>
</ol>
</div>