---
title: WikiPathways SPARQL queries
redirect_from: /index.php/Help:WikiPathways_SPARQL_queries
---

<h1>WikiPathways SPARQL queries</h1>

On [sparql.wikipathways.org](http://sparql.wikipathways.org/) WikiPathways content is replicated
in a SPARQL endpoint. Queries can be performed in three ways:

1. Either go to the endpoint directly and create your own SPARQL query.
2. Copy and paste an example query listed below in the endpoint.
3. Adapt a code examples to programmatically make a SPARQL query

This project is written up in the "[Using the Semantic Web for Rapid Integration of WikiPathways with Other Biological Online Data Resources](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004989)" paper.

<h2>Notification</h2>

Due to an Apache update, we are now creating RDF data according to SPARQL 1.1. 
However, our SPARQL-endpoint running on Virtuoso is still using SPARQL 1.0. 
This influences the way to query strings, and might affect federated queries.
Please remove the `^^xsd:string suffix`, as shown in the example below.

![](/assets/img/SPARQL11.png)

<h2>Example queries</h2>

<h3>Prefixes</h3>

Within the example queries, we have omitted the prefixes. These prefixes are automatically used in the SPARQL endpoint. The following prefixes are used in the WikiPathways RDF:

```
PREFIX gpml:    <http://vocabularies.wikipathways.org/gpml#>
PREFIX wp:      <http://vocabularies.wikipathways.org/wp#>
PREFIX cur:     <http://vocabularies.wikipathways.org/wp#Curation:>
PREFIX wprdf:   <http://rdf.wikipathways.org/>
PREFIX biopax:  <http://www.biopax.org/release/biopax-level3.owl#> 
PREFIX cas:     <https://identifiers.org/cas/>
PREFIX dc:      <http://purl.org/dc/elements/1.1/> 
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf:    <http://xmlns.com/foaf/0.1/> 
PREFIX ncbigene:<https://identifiers.org/ncbigene/>
PREFIX pubmed:  <http://www.ncbi.nlm.nih.gov/pubmed/> 
PREFIX rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos:    <http://www.w3.org/2004/02/skos/core#>
PREFIX xsd:     <http://www.w3.org/2001/XMLSchema#> 
```

<h3>Metadata queries</h3>

List the information about the data sets in the SPARQL endpoint:

```sparql
select distinct ?dataset (str(?titleLit) as ?title) ?date ?license where {
  ?dataset a void:Dataset ;
    dcterms:title ?titleLit ;
    dcterms:license ?license ;
    pav:createdOn ?date .
}
```
[Open](https://bit.ly/3mYFmT5)

<h3>Pathway-oriented queries</h3>

<h4>Get the species currently in WikiPathways with their respective URI's</h4>

```sparql
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#>
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>

SELECT DISTINCT ?organism (str(?label) as ?name)
WHERE {
    ?concept wp:organism ?organism ;
      wp:organismName ?label .
}
```

<h4>List pathways and their species</h4>

```sparql
PREFIX dc:      <http://purl.org/dc/elements/1.1/> 
PREFIX wp:     <http://vocabularies.wikipathways.org/wp#>

SELECT DISTINCT (str(?title) as ?pathway) (str(?label) as ?organism)
WHERE {
    ?pw dc:title ?title ;
      wp:organism ?organism ;
      wp:organismName ?label .
}
```

<h3>LIPID MAPS-related queries</h3>

<h4>Count the number of lipids per pathways in WikiPathways with LIPID MAPS identifier</h4>

Converts all Metabolite identifiers to LipidMaps (provided by BridgeDb), and create
an ordered list of pathways including lipid compounds.

```sparql
prefix lipidmaps:      <https://identifiers.org/lipidmaps/>

select distinct ?pathwayRes (str(?wpid) as ?pathway)
       (str(?title) as ?pathwayTitle)
       (count(distinct ?lipidID) AS ?LipidsInPWs)
where {
  ?metabolite a wp:Metabolite ;
    dcterms:identifier ?id ;
    dcterms:isPartOf ?pathwayRes ;
    wp:bdbLipidMaps ?lipidID .
  ?pathwayRes a wp:Pathway ;
              wp:organismName "Homo sapiens" ; 
    dcterms:identifier ?wpid ;
    dc:title ?title .
}
ORDER BY DESC(?LipidsInPWs)
```

<h3>Data statistics-oriented queries</h3>

<h4>Count the number of metabolites per species</h4>

Though strictly speaking, it guesstimates it, because it counts the number of unique metabolite identifiers. Normalization in the RDF generation code ensures we do not double count metabolites with identifiers from different databases, but it still differentially counts metabolites with different charge states.

```sparql
PREFIX gpml:    <http://vocabularies.wikipathways.org/gpml#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX dc:      <http://purl.org/dc/elements/1.1/>
PREFIX rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 

select (count(distinct ?metabolite) as ?count) (str(?label) as ?species) where {
  ?metabolite a wp:Metabolite ;
    dcterms:isPartOf ?pw .
  ?pw dc:title ?title ;
    wp:organism ?organism ;
    wp:organismName ?label .
} GROUP BY ?label ORDER BY DESC(?count)
````


<h3>Interaction-oriented queries</h3>

<h4>Get all interactions for a particular datanode</h4>

Find all interactions that are connected to a particular datanode. (wp:Interaction).

```sparql
PREFIX gpml:    <http://vocabularies.wikipathways.org/gpml#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX dc:      <http://purl.org/dc/elements/1.1/>
PREFIX rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 

#Find all interactions that are connected to a particular datanode.

SELECT DISTINCT ?interaction ?pathway  WHERE {

   ?pathway a wp:Pathway .
   ?interaction dcterms:isPartOf ?pathway . 
   ?interaction a wp:Interaction . 
   ?interaction wp:participants <https://identifiers.org/ensembl/ENSG00000125845> .   
}
```



<h3>Datasource-oriented queries</h3>



<h3>Curators-oriented queries</h3>



<h3>Literature queries</h3>





