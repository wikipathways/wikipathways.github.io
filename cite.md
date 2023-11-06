---
title: Cite
redirect_from: /index.php/How_to_cite_WikiPathways
---
<h1>How to Cite</h1>
<p>Depending on how you use WikiPathways, please consider citing one or more of the following articles:</p>
<h2>Citing the WikiPathways project</h2>
<ul>
    <li>In general, we recommend citing either our latest <i>NAR</i> database article or the original 2008 <i>PLoS Biology</i> article:
    <ul>
        <li><a href="https://doi.org/10.1093/nar/gkad960" target="_blank">Agrawal a, et al. <b>(2023)</b> WikiPathways 2024: next generation pathway database. <i>NAR</i></a>.</li>
        <li><a href="https://doi.org/10.1371/journal.pbio.0060184" target="_blank">Pico AR, et al. <b>(2008)</b> WikiPathways: Pathway Editing for the People. <i>PLoS Biol</i></a>. </li>
    </ul>
    </li>
    <li>Potentially-relevant topics are highlighted in our other project articles:
        <ul>
            <li><b>Biological interactions</b>: <a href="https://doi.org/10.1371/journal.pone.0263057" target="_blank">Miller RA, et al. <b>(2022)</b> Understanding signaling and metabolic paths using semantified and harmonized information about biological interactions. <i>PLoS ONE</i></a>.</li>
            <li><b>Metabolomics, QA, WikiPathways Academy</b>: <a href="https://doi.org/10.1093/NAR/gkx1064" target="_blank">Slenter DN, et al. <b>(2018)</b> WikiPathways: a multifaceted pathway database bridging metabolomics to other omics research. <i>NAR</i></a>.</li>
            <li><b>Growth, Reactome, Pathway Widget</b>: <a href="https://dx.doi.org/10.1093/NAR/gkv1024" target="_blank">Kutmon M, et al. <b>(2016)</b> WikiPathways: capturing the full diversity of pathway knowledge. <i>NAR</i></a>.</li>
            <li><b>RDF, SPARQL, vocabularies, nanopublications</b>: <a href="https://doi.org/10.1371/journal.pcbi.1004989" target="_blank">Waagmeester A, et al. <b>(2016)</b> Using the semantic web for rapid integration of WikiPathways with other biological online data resources. <i>PLoS Comput Biol</i></a>.</li>
            <li><b>Communities, Ontologies, Linkouts</b>: <a href="https://doi.org/10.1093/nar/gkr1074" target="_blank">Kelder T, et al. <b>(2012)</b> WikiPathways: building research communities on biological pathways. <i>NAR</i></a> or <a href="https://doi.org/10.1093/NAR/gkaa1024" target="_blank">Martens M, et al. <b>(2021)</b> WikiPathways: connecting communities. <i>NAR</i></a>.</li>
            <li><b>Web service</b>: <a href="https://doi.org/10.1371%2Fjournal.pone.0006447" target="_blank">Kelder T, et al. <b>(2009)</b> Mining Biological Pathways Using WikiPathways Web Services. <i>PLoS One</i></a>.</li>
        </ul>
    </li>
</ul>

<div id="citepathway">
<h2>Citing individual pathways</h2>
<ul>
    <li><b>To cite a specific pathway</b>, use its permalink, for example: <a href="https://www.wikipathways.org/instance/WP254">https://www.wikipathways.org/instance/WP254</a>. The permalink for each pathway is available from the <b>Share pathway</b> icon <span title="Share pathway" style="color: #FF8120; background-color: #FFFFFF; font-size: 1.0em;"><i class="fa fa-share"></i></span> under the pathway. When citing the live version of a pathway, attribution of individual authors is not necessary since it is continuously tracked and displayed on each pathway page.</li>
    <li>The full citation, which includes the permanen link, is also available from the <b>Share pathway</b> icon <span title="Share pathway" style="color: #FF8120; background-color: #FFFFFF; font-size: 1.0em;"><i class="fa fa-share"></i></span> under the pathway; for example "Zambon AC, Pico A, Kelder T, Coort S, Angelika A, Lawlor B, Iersel MV, Gillespie M, Hanspers K, Bouwman J, Riutta A, Nuno N, Willighagen E, Summer-Kutmon M, Kalafati M, Josip J, Anam A. Apoptosis (WP254) [Internet] Last edited: 2021-05-27. Available from: https://www.wikipathways.org/instance/WP254."</li>
    <li><b>To cite a <i>specific version</i> of a pathway</b>, we recommend downloading the pathway as PNG from the <b>Download pathway as...</b> icon <span title="Download pathway as..." style="color: #FF8120; background-color: #FFFFFF; font-size: 1.0em;"><i class="fa fa-download"></i></span> under the pathway, and uploading it to Zenodo to generate a DOI that you can then reference in your paper. Alternatively, your can upload another image file or figure that you have made using WikPathways content. An example Zenodo record can be found <a href="https://zenodo.org/record/7058753#.YxowGOzMI7R" target="_blank">here</a>. Follow these steps:
        <ol>
            <li>Log in to <a href="https://zenodo.org/" target="_blank">Zenodo</a>. Accounts are free.</li>
            <li>Go to the <a href="https://zenodo.org/deposit/new?c=wikipathways" target="_blank">WikiPathways community upload page</a>.</li>
            <li>Upload a PNG of the pathway you want to reference.</li>
            <li>Complete the fields and click "Publish".</li> 
        </ol>
    </li>
    <li><b>Once your paper is published, <i>Add a citation</i> to the corresponding pathway page(s)</b>:</li>
        <ol>
            <li>To complete these steps, first make sure you are logged in to your <a href="https://github.com/" target="_blank">GitHub account</a>.</li>
            <li>Find the corresponding pathway on WikiPathways, for example <a href="https://wikipathways.org/pathways/WP4629.html">WP4629</a>.</li>
            <li>In the <b>Cited In</b> section, click the pencil icon to edit the list. This will open a new browser tab with the "citedin_lookup.yaml" file open in edit mode.</li>
            <li>Click anywhere in the editable area and use <b>Ctrl+F</b> to search for the WPID, for example "WP4629".</li>
            <li>If the PMCID or DOI for the publication has not already been added, add an entry under the relevant WPID in the following format: <code>- link: PMC9603647</code>.</li>
            <li>Enter a commit message ("added citation for WP4629") and click "Commit changes".</li>
        </ol>
</ul> 
