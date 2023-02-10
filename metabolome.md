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

Or metabolites for just zebrafish pathways:

```sparql
select distinct ?metabolite (str(?titleLit) as ?title) where {
  ?metabolite a wp:Metabolite ;
    dcterms:isPartOf ?pw .
  ?pw dc:title ?titleLit ;
    wp:organismName "Danio rerio" .
}
```




