---
title: WikiPathways Metabolomics
redirect_from: /index.php/Help:WikiPathways_Metabolomics
---

<h1>WikiPathways Metabolomics</h1>

On this page we collect SPARQL queries to see the state of the Metabolome in WikiPathways. Triggered by
[Andra](https://new.wikipathways.org/authors/Andra)'s RDF / SPARQL work, curation started with metabolites
without database identifiers. But this soon led to the observation that metabolites are often not even
annotated as being a metabolite (using `<Label>` rather than `<DataNode>`).

<h2>The Data</h2>

The latest revision you can look up with:

```sparql
select (str(?o) as ?version) where {
  ?pw a void:Dataset ;
    dcterms:title ?o .
}
```

[Open](https://bit.ly/3RPETjw)

<h2>Metabolome</h2>

The following queries provide an overview of the Metabolome captures by WikiPathways.

The key type for metabolites is the `wp:Metabolite`. We can see all available properties with:

```sparql
select (str(?o) as ?version) where {
  ?pw a void:Dataset ;
    dcterms:title ?o .
}
```

[Open](https://bit.ly/3lo3VKo)

<h3>All Metabolites</h3>

We can get the count of metabolites datanodes in WikiPathways with:

```sparql
select count(distinct ?mb) where {
  ?mb a wp:Metabolite .
}
```

[Open](https://bit.ly/3lmiEpc)

As list:

```sparql
select distinct ?mb ?label where {
  ?mb a wp:Metabolite ;
     rdfs:label ?label .
}
```

[Open](https://bit.ly/3Yj0G5r)

Or metabolites for just zebrafish pathways:

```sparql
select distinct ?metabolite (str(?titleLit) as ?title) where {
  ?metabolite a wp:Metabolite ;
    dcterms:isPartOf ?pw .
  ?pw dc:title ?titleLit ;
    wp:organismName "Danio rerio" .
}
```

[Open](https://bit.ly/3Yj4F1P)

<h2>Metabolic Data Sources</h2>

<h3>Sorted by use</h3>

ChEBI, HMDB, and LIPID MAPS are the main data sources for identifiers:

```sparql
select str(?datasource) as ?source count(distinct ?identifier) as ?count
where {
  ?mb a wp:Metabolite ;
    dc:source ?datasource ;
    dc:identifier ?identifier .
} order by desc(?count)
```

[Open](https://bit.ly/3IniZRL)

<h3>All metabolites from one source</h3>

<h4>All KEGG identifiers</h4>

This SPARQL query lists all metabolite datanodes annotated with a KEGG
compound identifier:

```sparql
select distinct ?identifier
where {
  ?mb a wp:Metabolite ;
    dc:source "KEGG Compound" ;
    dc:identifier ?identifier .
} order by ?identifier
```

[Open](https://bit.ly/3loRJJk)

<h4>All HMDB identifiers</h4>

Return all HMDB identfiers with:

```sparql
select distinct ?identifier
where {
  ?mb a wp:Metabolite ;
    dc:source "HMDB" ;
    dc:identifier ?identifier .
} order by ?identifier
```

[Open](https://bit.ly/3XfUxFP)

<h2>Metabolic Pathways</h2>

Of general interest is the number of pathways per species:

```sparql
select distinct str(?orgName) as ?organism count(?pw) as ?pathways  where {
  ?pw wp:organism ?organismCode .
  ?organismCode rdfs:label ?orgName
} order by desc(?pathways)

<h3>Metabolomes</h3>

<h4>Human Metabolome</h4>

```sparql
select distinct ?mb where {
  ?mb a wp:Metabolite ;
    dcterms:isPartOf ?pw .
  ?pw wp:organism ncbi:9606 .
} order by ?mb
```

<h4>Arabodopsis thaliana Metabolome</h4>

```sparql
select distinct ?mb where {
  ?mb a wp:Metabolite ;
    dcterms:isPartOf ?pw .
  ?pw wp:organism ncbi:3702 .
} order by ?mb
```

<h3>Pathways with the most metabolites</h3>

```sparql
select ?pathway count(distinct ?mb) as ?mbCount
where {
  ?mb a wp:Metabolite ;
    dcterms:isPartOf ?pathway .
} order by desc(?mbCount)
```

<h3>Metabolites in the most Pathways</h3>

With the remark that BridgeDB is not involved yet: the results are based on metabolite datanodes, not unique metabolites.

```sparql
select ?mb count(distinct ?pathway) as ?pwCount
where {
  ?mb a wp:Metabolite ;
    dcterms:isPartOf ?pathway .
} order by desc(?pwCount)
```
