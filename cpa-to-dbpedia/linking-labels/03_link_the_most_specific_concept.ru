DEFINE sql:log-enable 2

PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

DELETE {
  GRAPH <http://data.openbudgets.eu/resource/linkset/cpa-to-dbpedia> {
    ?broader skos:closeMatch ?target .
  }
}
WHERE {
  GRAPH <http://data.openbudgets.eu/resource/linkset/cpa-to-dbpedia> {
    ?broader skos:closeMatch ?target .
    ?narrower skos:closeMatch ?target .
  }
  GRAPH <http://data.openbudgets.eu/resource/codelist/cpa> {
    ?broader skos:narrower ?narrower . 
  }
}
