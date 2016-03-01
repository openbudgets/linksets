PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

DELETE {
  GRAPH <http://data.openbudgets.eu/resource/linkset/cl-geo-to-dbpedia> {
    ?nonpreferredSource skos:closeMatch ?target .
  }
}
WHERE {
  {
    SELECT ?preferredSource ?target
    WHERE {
      GRAPH <http://data.openbudgets.eu/resource/codelist/cl-geo> {
        ?preferredSource skos:notation ?notation .
        FILTER STRENDS(?notation, "_CAP")
      }
      GRAPH <http://data.openbudgets.eu/resource/linkset/cl-geo-to-dbpedia> {
        ?preferredSource skos:closeMatch ?target .
      }
    }
  }
  GRAPH <http://data.openbudgets.eu/resource/linkset/cl-geo-to-dbpedia> {
    ?nonpreferredSource skos:closeMatch ?target .
    FILTER (!sameTerm(?preferredSource, ?nonpreferredSource))
  }
}
