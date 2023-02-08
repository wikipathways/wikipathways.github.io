---
title: WikiPathways SPARQL queries
---

On [sparql.wikipathways.org](http://sparql.wikipathways.org/) WikiPathways content is replicated
in a SPARQL endpoint. Queries can be performed in three ways:

1. Either go to the endpoint directly and create your own SPARQL query.
2. Copy and paste an example query listed below in the endpoint.
3. Adapt a code examples to programmatically make a SPARQL query

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
