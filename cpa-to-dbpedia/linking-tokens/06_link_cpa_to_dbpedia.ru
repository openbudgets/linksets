DEFINE sql:log-enable 2

PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

INSERT {
  GRAPH <http://data.openbudgets.eu/resource/linkset/cpa-to-dbpedia> {
    ?source skos:narrowMatch ?target .
  }
}
WHERE {
  GRAPH <http://data.openbudgets.eu/resource/codelist/cpa> {
    ?source a skos:Concept ;
      skos:hiddenLabel ?label .
  }
  GRAPH <http://dbpedia.org> {
    ?target skos:hiddenLabel ?label .
  }
}
