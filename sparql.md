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
SELECT DISTINCT ?organism (str(?label) as ?name)
WHERE {
    ?concept wp:organism ?organism ;
      wp:organismName ?label .
}
```

[Open](https://bit.ly/3xhyaFq)

<h4>List pathways and their species</h4>

```sparql
SELECT DISTINCT (str(?title) as ?pathway) (str(?label) as ?organism)
WHERE {
    ?pw dc:title ?title ;
      wp:organism ?organism ;
      wp:organismName ?label .
}
```

[Open](https://bit.ly/3RUHVTO)

<h4>List the species captured in WikiPathways and the number of pathways per species</h4>

```sparql 
SELECT DISTINCT ?organism (str(?label) as ?name) (count(?pw) as ?pathwayCount)
WHERE {
    ?pw dc:title ?title ;
      wp:organism ?organism ;
      wp:organismName ?label .
}
ORDER BY DESC(?pathwayCount)
```

[Open](https://bit.ly/3HQcK7n)

<h4>List all pathways for species "Mus musculus"</h4>

The following query list all mouse pathways. `?wpIdentifier` is the link through identifiers.org,
`?pathway` points to the RDF version of WikiPathways and ?page is the revision which is loaded
in the SPARQL endpoint.

```sparql
SELECT DISTINCT ?wpIdentifier ?pathway ?page
WHERE {
    ?pathway dc:title ?title .
    ?pathway foaf:page ?page .
    ?pathway dc:identifier ?wpIdentifier .
    ?pathway wp:organismName "Mus musculus" .
 }
ORDER BY ?wpIdentifier
```

[Open](https://bit.ly/3Ym7b7R)

<h4>Get all pathways with a particular gene</h4>

List all pathways per instance of a particular gene or protein (`wp:GeneProduct`)

```sparql
SELECT DISTINCT ?pathway (str(?label) as ?geneProduct)
WHERE {
    ?geneProduct a wp:GeneProduct . 
    ?geneProduct rdfs:label ?label .
    ?geneProduct dcterms:isPartOf ?pathway .
    ?pathway a wp:Pathway .
    
    FILTER regex(str(?label), "CYP"). 
}
```

[Open](https://bit.ly/3YfLwxX)

<h4>Get all groups and complexes containing a particular gene</h4>

List all groups and complexes per instance of a particular gene or protein (`wp:GeneProduct`)

```sparql
SELECT DISTINCT ?pathway (str(?label) as ?geneProduct)
WHERE {
    ?geneProduct a wp:GeneProduct . 
    ?geneProduct rdfs:label ?label .
    ?geneProduct dcterms:isPartOf ?pathway .

    FILTER NOT EXISTS { ?pathway a wp:Interaction } .
    FILTER NOT EXISTS { ?pathway a wp:Pathway } .
    FILTER regex(str(?label), "CYP"). 
}
```

[Open](https://bit.ly/3K0O0fq)

<h4>Get all the genes on a particular pathway</h4>

List all the genes and proteins (`wp:GeneProduct`) associated with a particular pathway WPID.

  ```sparql
select distinct ?pathway (str(?label) as ?geneProduct) where {
    ?geneProduct a wp:GeneProduct . 
    ?geneProduct rdfs:label ?label .
    ?geneProduct dcterms:isPartOf ?pathway .
    ?pathway a wp:Pathway .
    ?pathway dcterms:identifier "WP1560" . 
}
```

[Open](https://bit.ly/3YKILVo)

<h4>Count the number of pathways per ontology term</h4>

In WikiPathways, pathways can be tagged with ontology terms from Pathway, Cell Line and Disease
ontology. The following query returns a pathway count for each term from any of the available
ontologies. These terms are collectively modeled as `wp:pathwayOntology`; but this includes
all ontologies, not just the "Pathway" ontology.

```sparql
SELECT DISTINCT ?pwOntologyTerm count(?pwOntologyTerm) as ?pathwayCount
 WHERE {
	?pathwayRDF wp:ontologyTag ?pwOntologyTerm .
 }
 ORDER BY DESC(?pathwayCount)
```

<h4>Count the number of pathways per curation tag</h4>

We can also count the number of pathways by curation and community tag:

```sparql
SELECT ?curationTag (count(DISTINCT ?pathway) as ?pathwayCount)
WHERE {
  ?pathway wp:ontologyTag ?curationTag .
  FILTER contains(STR(?curationTag), "Curation:")
}
ORDER BY DESC(?pathwayCount)
```

[Open](https://bit.ly/3XpFWrJ)

<h4>Get all pathways with a particular ontology term</h4>

In WikiPathways, pathways can be tagged with ontology terms from Pathway, Cell Line and Disease ontology. The following query returns a list of pathways tagged with [PW_0000296](http://bioportal.bioontology.org/ontologies/PW/?p=classes&conceptid=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FPW_0000296).

```sparql
PREFIX obo: <http://purl.obolibrary.org/obo/>

SELECT ?pathway (str(?titleLit) AS ?title)
WHERE {
  ?pathwayRDF wp:ontologyTag obo:PW_0000296 ;
              foaf:page ?pathway ;
              dc:title ?titleLit .
}
```

[Open](https://bit.ly/3AUyBYs)

<h4>Get all ontology terms for a particular pathway</h4>

List all the ontology terms tagged on a particular pathway.

```sparql
SELECT (?o as ?pwOntologyTerm) (str(?titleLit) as ?title) ?pathway 
WHERE {
  ?pathwayRDF wp:ontologyTag ?o ;
    foaf:page ?pathway ;
    dc:title ?titleLit ;
    dcterms:identifier "WP1560" . 
  FILTER (! regex(str(?pathway), "group"))
}
```

[Open](https://bit.ly/3jTAlft)

<h4>Get all Reactome pathways</h4>

List all the ontology terms tagged on a particular pathway.

```sparql
SELECT DISTINCT ?pathway (str(?titleLit) as ?title)
WHERE {
  ?pathway wp:ontologyTag cur:Reactome_Approved ;
           dc:title ?titleLit .
}
```

[Open](https://bit.ly/3YHGD0t)

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

[Open](https://bit.ly/3E1CvR4)

<h4>Count amount of lipids per LIPID MAPS ontology class</h4>

Counts unique LIPID MAPS identifier (provided by BridgeDb) for the fatty acid (FA) class, other examples are provided as a comment.

```sparql
select count(distinct ?lipidID) as ?IndividualLipidsPerClass_FA
where {     ?metabolite a wp:Metabolite ;
    dcterms:identifier ?id ;
    dcterms:isPartOf ?pathwayRes ;
    wp:bdbLipidMaps ?lipidID .
  ?pathwayRes a wp:Pathway ;
              wp:organismName "Homo sapiens" ; 
    dcterms:identifier ?wpid ;
    dc:title ?title .
  FILTER regex(str(?lipidID), "FA" ). # Other classes: GL, GP, SP, ST, PR, SL, PK
}
```

[Open](https://bit.ly/33iCc56)

<h4>Find pathways per LIPID MAPS ontology class, sorted on amount of unique lipids</h4>

Filter all unique LIPID MAPS identifier (provided by BridgeDb) for the fatty acid (FA) class, and find all pathways with individual lipids in there.

```sparql
select distinct ?pathwayRes (str(?wpid) as ?pathway) (str(?title) as ?pathwayTitle) (count(distinct ?lipidID) AS ?FA_LipidsInPWs)
where {     ?metabolite a wp:Metabolite ;
    dcterms:identifier ?id ;
    dcterms:isPartOf ?pathwayRes ;
    wp:bdbLipidMaps ?lipidID .
  ?pathwayRes a wp:Pathway ;
              wp:organismName "Homo sapiens" ; 
    dcterms:identifier ?wpid ;
    dc:title ?title .
  FILTER regex(str(?lipidID), "FA" ). # Fatty acids, Other classes: GL, GP, SP, ST, PR, SL, PK
}
ORDER BY DESC(?FA_LipidsInPWs
```

[Open](https://bit.ly/3YfOeDD)

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

<h4>Get all datasources currently captured in WikiPathways</h4>

```sparql
SELECT DISTINCT (str(?datasourceLit) as ?datasource)
WHERE {
  ?concept dc:source ?datasourceLit
}
```

[Open](https://bit.ly/3K0vmEh)

<h4>Get the number of entries per datasource in WikiPathways</h4>

```sparql
SELECT (str(?datasourceLit) as ?datasource)
       (count(DISTINCT ?dataNode) as ?numberEntries)
WHERE {
  ?concept dc:source ?datasourceLit ;
    wp:isAbout ?dataNode .
} 
ORDER BY DESC(?numberEntries)
```

[Open](https://bit.ly/3Ki1iV5)

<h4>Return all compounds annotated with the "ChEMBL compound" as data source and the pathways they are in</h4>

```sparql
SELECT DISTINCT ?identifier ?pathway
WHERE {
  ?concept dcterms:isPartOf ?pathway . ?pathway a wp:Pathway .
  ?concept dc:source "ChEMBL compound" .
  ?concept dc:identifier ?identifier .        
}
```

<h3>Literature queries</h3>

<h4>Articles cited by Reactome but not by WikiPathways</h4>

```sparql
SELECT (COUNT(DISTINCT ?pubmed) AS ?count)
WHERE {
  ?pubmed a       wp:PublicationReference .
  MINUS { ?pubmed dcterms:isPartOf/wp:ontologyTag cur:AnalysisCollection }
  { ?pubmed dcterms:isPartOf/wp:ontologyTag cur:Reactome_Approved }
}
```

[Open](https://bit.ly/3xcbFSu)

<h4>Articles cited by WikiPathways but not by Reactome</h4>

```sparql
SELECT (COUNT(DISTINCT ?pubmed) AS ?count)
WHERE {
  ?pubmed a       wp:PublicationReference .
  { ?pubmed dcterms:isPartOf/wp:ontologyTag cur:AnalysisCollection }
  MINUS { ?pubmed dcterms:isPartOf/wp:ontologyTag cur:Reactome_Approved }
}
```

[Open](https://bit.ly/3Yqcpzp)

<h4>Articles cited by both Reactome and WikiPathways</h4>

```sparql
SELECT (COUNT(DISTINCT ?pubmed) AS ?count)
WHERE {
  ?pubmed a       wp:PublicationReference .
  { ?pubmed dcterms:isPartOf/wp:ontologyTag cur:AnalysisCollection }
  { ?pubmed dcterms:isPartOf/wp:ontologyTag cur:Reactome_Approved }
}
```

[Open](https://bit.ly/3YnCsHv)	

