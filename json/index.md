---
title: JSON API
#redirect_from: 
# - /index.php/Help:WikiPathways_Webservice/API
# - /index.php/Help:WikiPathways_Webservice
---

<h1>JSON API for WikiPathways</h1>
This set of JSON files contain all the information needed to replace the prior, deprecated web services. This new approach supports bulk actions with better performance, providing results for all pathways with a single query. The client libraries, such as rWikiPathways, now use these files instead of the deprecated web services while maintaining (and even adding to) the same functionality. These JSON files are generated from the WikiPathways database and are updated in real time with every change. 

<h2>List</h2>
<dl>
    <dt><a href="./listOrganisms.json">listOrganisms.json</a></dt>
    <dd>A list of all organisms in WikiPathways as an array of latin genus species values all under the `organisms` key.</dd>
    <dt><a href="./listPathways.json">listPathways.json</a></dt>
    <dd>A list of all pathways in WikiPathways organized by organism. The `organisms` key has an array of arrays containing each organism's `latin`, `two-letter-code` and `common` key-value pairs, plus a `pathways` key that has an array of arrays containing each pathway's `id`, `url`, `name`, `species`, `revision` key-value pairs.</dd>
    <dt><a href="./listCommunities.json">listCommunities.json</a></dt>
    <dd>A list of all communities in WikiPathways as an array of arrays containing descriptive keys for each community, plus a `pathways` key that has an array of arrays containing each pathway's `id`, `url`, `name`, `species`, and `revision` key-value pairs, all under the `communities` key.</dd>
</dl>

<h2>Get</h2>
<dl>
    <dt><a href="./getCounts.json">getCounts.json</a></dt>
    <dd>Summary statistics for the WikiPathways database, including the number of `organisms`, `pathways`, `authors`, and `communities` as key-value pairs.</dd>
    <dt><a href="./getPathwayInfo.json">getPathwayInfo.json</a></dt>
    <dd>Key metadata for every pathway in WikiPathways. The `pathwayInfo` key contains an array of arrays containing each pathway's `id`, `url`, `name`, `species`, `revision`, `authors`, `description` and `citedin` key-value pairs.</dd>
    <dt><a href="./getPathwaysByOntologyTerm.json">getPathwaysByOntologyTerm.json</a></dt>
    <dd>A listing of all pathways associated with each top-level ontology term in WikiPathways. The `terms` key contains an array of arrays containing each term's `id`, `name`, and `ontology` key-value pairs, plus a `pathways` key that has an array of arrays containing each pathway's `id`, `url`, `name`, `species`, and `revision` key-value pairs.</dd>
    <dt><a href="./getOntologyTermsByPathway.json">getOntologyTermsByPathway.json</a></dt>
    <dd>A listing of all ontology terms associated with each pathway in WikiPathways. The `pathways` key contains an array of arrays containing each pathway's `id`, plus a `terms` key that has an array of arrays containing each term's `id`, `name`, `ontology` and `parent` key-value pairs.</dd>
</dl>

<h2>Find</h2>
Note: these files have the same basic struture as the `getPathwayInfo.json` file, but with additional key-value pairs <b>(in bold)</b>.
<dl>
    <dt><a href="./findPathwaysByText.json">findPathwaysByText.json</a></dt>
    <dd>Relevant text metadata for every pathway in WikiPathways. The `pathwayInfo` key contains an array of arrays containing each pathway's `id`, `url`, `name`, `species`, `revision`, `authors`, `description`, `citedin`, <b>`datanodes`</b>, and <b>`annotations`</b> key-value pairs.</dd>
    <dt><a href="./findPathwaysByXref.json">findPathwaysByXref.json</a></dt>
    <dd>Relevant metadata plus external references (Xrefs) for the genes, proteins and metabolites for every pathway in WikiPathways. The `pathwayInfo` key contains an array of arrays containing each pathway's `id`, `url`, `name`, `species`, `revision`, `authors`, `description`, and <b>a series of Xref key-value pairs</b>, e.g., <b>`ncbigene`</b>, <b>`uniprot`</b> and <b>`chebi`</b>.</dd>
    <dt><a href="./findPathwaysByLiterature.json">findPathwaysByLiterature.json</a></dt>
    <dd>Relevant metadata plus citation IDs and text for every pathway in WikiPathways. The `pathwayInfo` key contains an array of arrays containing each pathway's `id`, `url`, `name`, `species`, `revision`, `authors`, `description`, <b>`refs`</b> and <b>`citations`</b> key-value pairs.</dd>
    <dt><a href="./findPathwaysByOrcid.json">findPathwaysByOrcid.json</a></dt>
    <dd>Relevant metadata plus author ORCIDs for every pathway in WikiPathways. The `pathwayInfo` key contains an array of arrays containing each pathway's `id`, `url`, `name`, `species`, `revision`, `authors`, `description`, and <b>`orcids`</b> key-value pairs.</dd>
</dl>