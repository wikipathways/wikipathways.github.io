---
title: The WikiPathways Semantic Web Portal
redirect_from: /index.php/Portal:Semantic_Web
---

<h1>The WikiPathways Semantic Web Portal</h1>

This portal describes the Semantic Web features of the WikiPathways databases, such as the
[Resource Description Framework](https://www.w3.org/RDF/) (RDF) translation, the ontology,
and the new nanopublications.

The WikiPathways RDF is provided as part of the monthly releases and contains the _Curated_ and
_Reactome_ pathways. The RDF is split in two parts, the GPMLRDF part which contains a direct
translation of the content in the GPML files, and a WPRDF part which contains the biology
represented in the GPML

<h2>The WikiPathways Vocabularies</h2>

The [WikiPathways vocabularies](http://vocabularies.wikipathways.org/) are for the semantic
information about the pathway, data nodes, and interactions and the GPML vocabulary is for
the graphical information about how the pathway diagram is laid out and represented.

<h2>How to cite</h2>

If you use the RDF, vocabularies, or nanopublication, please cite the following paper:

```
Waagmeester, A., Kutmon, M., Riutta, A., Miller, R., Willighagen, E. L., Evelo, C. T., Pico, A. R.,
Jun. 2016. Using the semantic web for rapid integration of WikiPathways with other biological
online data resources. PLoS Comput Biol 12 (6), e1004989+. doi:10.1371/journal.pcbi.1004989 .
```
For the pathway content, please follow these [How to cite](cite.md) WikiPathways instructions.

<h2>Snorql Interface</h2>

Visit our new Snorql interface at [sparql.wikipathways.org](https://sparql.wikipathways.org).
The image below explains which steps you can take:

1: Select a query from the list
2: Press the green query button to execute your selected query
3: View the results on the same page
4: You can select your own list of example queries from github, by adding the link.

![Snorql UI with the 4 steps indicated by red arrows](/assets/img/NewSnorqlInterface.png "NEW Snorql Interface for SPARQL Endpoint")

<h2>Notification</h2>

Due to an Apache update, we are now creating RDF data according to SPARQL 1.1. 
However, our SPARQL-endpoint running on Virtuoso is still using SPARQL 1.0. 
This influences the way to query strings, and might affect federated queries.
Please remove the `^^xsd:string suffix`, as shown in the example below.

![](/assets/img/SPARQL11.png)

<h2>SPARQL Examples</h2>

We provide [a SPARQL endpoint](http://sparql.wikipathways.org/sparql) where data queries can be done.

<h3>WikiPathways Example SPARQL Queries</h3>

We have a large collection of [general example queries](sparql.md) and [metabolite-related example queries](metabolome.md).

For example, to list all pathways per instance of a particular gene or protein (wp:GeneProduct), you can use the following SPARQL:

```sparql
PREFIX wp:      <http://vocabularies.wikipathways.org/wp#>
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dcterms: <http://purl.org/dc/terms/>

SELECT DISTINCT
   ?pathway 
   (str(?label) as ?geneProduct)
WHERE {
    ?geneProduct a wp:GeneProduct . 
    ?geneProduct rdfs:label ?label .
    ?geneProduct dcterms:isPartOf ?pathway .
    ?pathway a wp:Pathway .
    
    FILTER regex(str(?label), "CYP"). 
}
```

<h2>Downloads</h2>

The Semantic Web WikiPathways comes in two flavors: as RDF (beta) and as nanopublications (very experimental).

<h3>The RDF</h3>
You can download the WikiPathways RDF from [here](http://data.wikipathways.org/current/rdf/).

The WikiPathways RDF is split in two parts, the GPMLRDF part which contains a direct translation of the content in the GPML files, and a WPRDF part which contains harmonized biological information present in the GPML.

<h2>Code examples</h2>

<h3>Perl</h3>

There is an [RDF api](http://www.perlrdf.org/) available. Below is an example that
extracts the data by converting the query into a url and extracts the data as CSV.

```perl
#!/usr/bin/perl
 
use LWP::Simple;
use URI::Escape;
my $sparql = "SELECT DISTINCT ?wpIdentifier ?elementneedsattention ?elementLabel
WHERE {
    ?pathway dc:title ?title .
    ?elementneedsattention a gpml:requiresCurationAttention .
    ?elementneedsattention dcterms:isPartOf ?pathway .
    ?elementneedsattention rdfs:label ?elementLabel . 
    ?pathway wp:organism ?organism .
    ?pathway foaf:page ?page .
    ?pathway dc:identifier ?wpIdentifier .
    ?organism rdfs:label \"Mus musculus\"^^<http://www.w3.org/2001/XMLSchema#string> .
 }
ORDER BY ?wpIdentifier";
 
my $url = 'https://sparql.wikipathways.org/sparql?default-graph-uri=&query='.uri_escape($sparql).'&format=text%2Fcsv&timeout=0&debug=on';
 
my $content = get $url;
die "Couldn't get $url" unless defined $content;
 
print $content;
```

<h3>Java</h3>

For Java there are several options, but we user here the Jena Framework:

```java
import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;

public class javaCodeExample {

	public static void main(String[] args) {
		String sparqlQueryString = "SELECT * WHERE {?s ?p ?o} LIMIT 10";
		Query query = QueryFactory.create(sparqlQueryString);
		QueryExecution queryExecution = QueryExecutionFactory.sparqlService("https://sparql.wikipathways.org/sparql", query);
		ResultSet resultSet = queryExecution.execSelect();
		while (resultSet.hasNext()) {
			QuerySolution solution = resultSet.next();
			System.out.print(solution.get("s"));
			System.out.print("\t"+solution.get("p"));
			System.out.println("\t"+solution.get("o"));
		}
	}
}
```

<h3>Bioclipse</h3>

The below code works in both the JavaScript and the Groovy console:

```javascript
 rdf.sparqlRemote(
     "https://sparql.wikipathways.org/sparql",
     "SELECT DISTINCT ?p WHERE { ?s ?p ?o }"
   )
```

<h3>Command line</h3>

For quick and easy querying, we recommend to use curl (Linux and OS X)

```shell
curl -F "query=SELECT * WHERE {?s ?p ?o} LIMIT 10" https://sparql.wikipathways.org/sparql
```

<h2>Support</h2>

The research leading to these results has received support from the Innovative Medicines Initiative Joint Undertaking under grant agreement no. 115191, resources of which are composed of financial contribution from the European Union's Seventh Framework Programme (FP7/2007-2013) and EFPIA companies’ in-kind contribution.
