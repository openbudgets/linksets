DEFINE sql:log-enable 2

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

INSERT {
  GRAPH <http://data.openbudgets.eu/resource/linkset/cpa-to-dbpedia-via-sparql> {
    ?source skos:closeMatch ?target .
  }
}
WHERE {
  GRAPH <http://data.openbudgets.eu/resource/codelist/cpa> {
    ?source a skos:Concept ;
      skos:hiddenLabel ?label .
  }
  GRAPH <http://dbpedia.org> {
    ?target rdfs:label ?label .
  }
}
