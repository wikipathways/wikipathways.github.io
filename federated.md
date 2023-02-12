---
title: WikiPathways Federated SPARQL queries
---

<h1>WikiPathways Federated SPARQL queries</h1>

<div style="background:#eee; padding:20px 0px 0px 50px">
<div class="row">
    <div class="col text-nowrap">
            <ul>
                <li><a href="#chembl">ChEMBL</a></li>
                <li><a href="#wikidata">Wikidata</a></li>
                <li><a href="#molmedb">MolMeDB</a></li>
            </ul>
    </div>
</div></div>

<h2 id="chembl">ChEMBL</h2>

<h3>all ChEMBL assays for pathways</h3>

```sparql
PREFIX chembl: <http://rdf.ebi.ac.uk/terms/chembl#>

SELECT ?pathway ?ensembl ?assay WHERE {
  {
    SELECT DISTINCT
      ?pathway ?ensembl
    WHERE {
      VALUES ?ensembl { <https://identifiers.org/ensembl/ENSG00000150093> }
      ?s wp:bdbEnsembl ?ensembl ;
         dcterms:isPartOf ?pathway .
    }
  }
  SERVICE <https://chemblmirror.rdf.bigcat-bioinformatics.org/sparql>  {
    OPTIONAL { ?assay a chembl:Assay ;
      chembl:hasTarget/chembl:hasTargetComponent/chembl:targetCmptXref ?ensembl . }
  }
} limit 100
```

[Open](https://bit.ly/40OKdI1)

<h3>all molecules targeting pathways</h3>

Here a limit is used too, as well as an IRI rewrite (from HTTPS to HTTP).

```sparql
PREFIX chembl: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX sio:    <http://semanticscience.org/resource/>

SELECT ?pathway ?ensembl ?molecule ?smiles WHERE {
  {
    SELECT DISTINCT
      ?pathway ?ensembl
    WHERE {
      ?s wp:bdbEnsembl ?ensembl ;
         dcterms:isPartOf ?pathway .
      ?pathway dcterms:identifier "WP15".
      
      ##The IRI for Ensembl from WikiPathways starts with https:// , where the one from ChEMBL starts with http:// , so we need to rewrite the IRI
    BIND(                      # Bind the created IRI into a new variable (called ?newIRI)
        IRI(                   # Convert the string back to an IRI
          CONCAT(              # Concatenate item 1 and 2 together as one string
               "http",        # First item to concat (more items can be added with a comma
              #Second item to concat:
               SUBSTR(         # Obtain a substring
                 STR(?ensembl), # Convert the Ensembl IRI from WikiPathways to a string,
                 6)            # removing the first 6 characters (<https)
        )) AS ?newIRI          # Name for the new variable 
    )
    }
  }
  SERVICE <https://chemblmirror.rdf.bigcat-bioinformatics.org/sparql>  {
    SELECT DISTINCT ?newIRI ?molecule ?smiles WHERE {
      ?assay a chembl:Assay ; chembl:hasTarget/chembl:hasTargetComponent/chembl:targetCmptXref ?newIRI .
      ?activity chembl:hasAssay ?assay ;
                chembl:hasMolecule ?molecule .
      OPTIONAL { ?molecule sio:SIO_000008 ?attrib . ?attrib a sio:CHEMINF_000018 ; sio:SIO_000300 ?smiles . }
    } limit 100
  }
}
```

<h2 id="wikidata">Wikidata</h2>

<h3>Metabolites in Wikipedia with InChIKeys from Wikidata</h3>

The corresponding query on Wikidata is [here](https://www.wikidata.org/wiki/User:Pathwaybot/query_examples#Lists_metabolites_in_WikiPathways_and_InChIKeys_from_Wikidata).

```sparql
PREFIX wdt: <http://www.wikidata.org/prop/direct/>

SELECT ?metabolite ?wikidata ?inchikey WHERE {
  {
    SELECT ?metabolite ?wikidata WHERE {
      ?metabolite a wp:Metabolite ;
        wp:bdbWikidata ?wikidata .
    } LIMIT 50
  }
  SERVICE <https://query.wikidata.org/sparql> {
    ?wikidata wdt:P235 ?inchikey .
  }
} LIMIT 50
```

[Open](https://bit.ly/3j2Dw0T)

<h2 id="molmedb">MolMeDB</h2>

<h3>Find all pathways, which link out to one compound in MolMeDB database</h3>

Find all pathways, which link out to one compound in MolMeDB database (http://identifiers.org/molmedb/MM00431) through Pubchem mapping.

```sparql
SELECT DISTINCT ?pathwayRes (str(?wpid) as ?pathway) (str(?title) as ?pathwayTitle) ((substr(str(?COMPOUND),46)) as ?PubChem) WHERE
{
  SERVICE <https://idsm.elixir-czech.cz/sparql/endpoint/molmedb> {
   <http://identifiers.org/molmedb/MM00431> skos:exactMatch ?COMPOUND.
   filter (strstarts(str(?COMPOUND), 'http://rdf.ncbi.nlm.nih.gov/pubchem/compound/CID'))
  }
  
  ?gene a wp:Metabolite ;
    dcterms:identifier ?id ;
    dcterms:isPartOf ?pathwayRes ;
    wp:bdbPubChem ?COMPOUND .
  
  ?pathwayRes a wp:Pathway ;
    wp:organismName "Homo sapiens" ;
    dcterms:identifier ?wpid ;
    dc:title ?title . 
}
```

Find which pathways out of a subset of pathway (in the VALUES clause), link out to one compound in
MolMeDB database (http://identifiers.org/molmedb/MM00431) through PubChem mapping.

```sparql
SELECT DISTINCT ?pathwayRes (str(?wpid) as ?pathway) (str(?title) as ?pathwayTitle) ((substr(str(?COMPOUND),46)) as ?PubChem) WHERE {
  SERVICE <https://idsm.elixir-czech.cz/sparql/endpoint/molmedb> {
    SERVICE <https://sparql.wikipathways.org/sparql> {
      VALUES ?wpid {"WP4224" "WP4225" "WP4571"}

    ?gene a wp:Metabolite ;
      dcterms:identifier ?id ;
      dcterms:isPartOf ?pathwayRes ;
      wp:bdbPubChem ?COMPOUND .

    ?pathwayRes a wp:Pathway ;
      wp:organismName "Homo sapiens" ;
      dcterms:identifier ?wpid ;
      dc:title ?title .
    }
    
    <http://identifiers.org/molmedb/MM00431> skos:exactMatch ?COMPOUND.
  }
}
```


