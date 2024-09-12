---
title: How to Contribute
redirect_from: /index.php/Help:Authors
---
<h1>Information for WikiPathways Authors</h1>
<p><b>We invite all interested researchers and authors to participate in the WikiPathways project!</b> Here you'll find information about getting started as an author, requirements for pathway models, and our review process.</p>

<hr>
<h2>Getting Started</h2>
<ol>
    <li style="margin-bottom: 10px;"><a href="https://www.github.com" target="_blank"><b>Create a GitHub Account</b></a>
        <br />A free GitHub account is required to create or edit pathways at WikiPathways.</li>
    <li style="margin-bottom: 10px;"><a href="https://classic.wikipathways.org/index.php?title=Special:UserLogin&type=signup" target="_blank"><b>Create a WikiPathways account</b></a>
        <br />A free WikiPathways account is required to create or edit pathways at WikiPathways during our <a href="/help.html#move_from_classic">move from the classic WikiPathways site</a>.</li>
    <li style="margin-bottom: 10px;"><a href="https://academy.wikipathways.org/stages/wp-custom-user-page/" target="_blank"><b>Customize your WikiPathways user page</b></a>
        <br />Customize your WikiPathways user page with relevant information about yourself, including websites, social media and more!</li>
    <li style="margin-bottom: 10px;"><a href="http://academy.wikipathways.org/stages/walk-install-pv/" target="_blank"><b>Install Tools and Resources</b></a>
        <br />To create and edit WikiPathways pathway models, you will need the pathway editor PathVisio with the WikiPathways plugin installed.</li>
    <li style="margin-bottom: 10px;"><b>Learn!</b><ul>
    <li>Learn everything about creating and editing pathways, from the basics to advanced topics at the <a href="https://academy.wikipathways.org/" target="_blank">WikiPathways Academy</a>.</li>
    <li>Check out the <a href="https://youtu.be/OrnOu7RGXKQ" target="_blank">PathVisio tutorial video</a> by TogoTV (DOI: <a href="https://doi.org/10.7875/togotv.2023.078" target="_blank">https://doi.org/10.7875/togotv.2023.078</a>) and the <a href="https://www.youtube.com/channel/UCTkyLj_4u6V4M5lUmyuOGDw" target="_blank">PathVisio YouTube Channel</a> to learn how to use PathVisio.</li>
    <li>For in-depth information on pathway curation, see <a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1009226" target="_blank">Ten simple rules for creating reusable pathway models for computational analysis and visualization</a>.</li>
    </ul></li>
    <li style="margin-bottom: 10px;"><b>Author: Create or Edit a Pathway Model</b>
        <br />
<div class="card-deck">
    <div class="card" style="width: 12rem; padding: 3px;">
    <div class="card-body" style="padding-right: 5px; padding-bottom:5px;">
    <p class="card-title"><b>Create a Pathway from Published Literature</b></p>
    <p class="card-text" style="font-size: 1em;">Browse our suggested pathway modeling tasks to find a published pathway of interest to you. Then create a pathway model and publish it at WikiPathways! The suggested pathways are selected based on novelty in terms of genes or disease focus.</p>
    </div>
    <ul class="list-group list-group-flush">
    <li class="list-group-item"><a href="https://github.com/wikipathways/pathway-curation-tasks/issues?q=is%3Aopen+is%3Aissue+label%3APFOCR" target="_blank">Pathway modeling tasks</a></li>
    <li class="list-group-item"><a href="http://academy.wikipathways.org/stages/fig-met-1-overview/" target="_blank">Step-by-step guide</a></li>
  </ul>
  </div>
<div class="card" style="width: 12rem; padding: 3px;">
  <div class="card-body" style="padding-right: 5px; padding-bottom:5px;">
    <p class="card-title"><b>Improve an Existing Pathway</b></p>
    <p class="card-text" style="font-size: 1em;">Help improve WikiPathways by editing existing pathway models that are in need of improvement. These tasks include adding datanode identifiers, connecting interactions, updating labels, improving layout as well as larger tasks like completing an unfinished pathway.</p>
    </div>
    <ul class="list-group list-group-flush">
    <li class="list-group-item"><a href="https://github.com/wikipathways/pathway-curation-tasks/issues?q=is%3Aopen+is%3Aissue+label%3A%22needs+work%22" target="_blank">High-priority tasks</a></li>
    <li class="list-group-item"><a href="https://github.com/wikipathways/pathway-curation-tasks/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22" target="_blank">Beginner tasks</a></li>
  </ul>
  </div>
</div>
</li>
    <li style="margin-bottom: 5px;"><a href="https://github.com/wikipathways/wikipathways-help/discussions" target="_blank">
<b> Engage: Join the WikiPathways Community</b></a>
        <br />Join the public discussion on pathway authoring and other WikiPathways-related topics.</li>
</ol>
<hr>
<h2>Review Process</h2>
<p>All new pathways and edits to existing pathways are subject to review by a combination of automated tests and human review. 
All new pathways will be reviewed by a reviewer from our "Reviewer of the week" group. If edits are needed, authors will be conatcted by the reviewer. Once an edit or new pathway is approved, it will be available on the new site. This process typically takes 5-7 days right now.</p>
<p>Our reviewers use our <a href="https://wikipathways.org/academy/qaprotocol.html" target="_blank">Quality Assurance Protocol</a> to check for the following things:
<ul>
<li>Do pathway nodes have valid database identifiers?</li>
<li>Are interactions properly connected to nodes?</li>
<li>Do pathway titles conform to guidelines?</li>
<li>Do pathways have appropriate ontology tags, and does each pathway have a useful description?</li>
</ul>
<p>Anyone is welcome to join the Reviewer Roster. Please <a href="https://github.com/wikipathways/wikipathways-help/discussions" target="_blank">contact us</a> if you are interested.</p>
<hr>
<h2>Requirements for Pathway Content</h2>
<p>Pathway models published at WikiPathways must meet specific criteira for quality and completeness, to ensure that the content is useful, both for direct human consumption, and for computational analysis:</p>
<ul>
<li>All interactions between genes, proteins and other pathway objects must be connected</li>
<li>>90% of datanodes (genes, proteins, metabolites etc.) must be annotated with external database references</li>
<li>Each pathway must have a complete description, meaning a minimum of 2-3 sentences summarizing the process that the pathway describes</li>
<li>Each pathway must have at least one literature reference</li>
<li>Each pathway must have a minimum of one pathway ontology term</li>
<li>Pathway titles must adhere to our <a href="https://github.com/wikipathways/wikipathways-faq/discussions/24" target="_blank">pathway title guidelines</a></li>
</ul>
