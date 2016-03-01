PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

DELETE {
  GRAPH <http://data.openbudgets.eu/resource/linkset/cl-geo-to-dbpedia> {
    ?source skos:closeMatch ?target .
  }
}
WHERE {
  {
    SELECT ?target (MAX(STRLEN(?notation)) AS ?maxNotationLength)
    WHERE {
      GRAPH <http://data.openbudgets.eu/resource/linkset/cl-geo-to-dbpedia> {
        ?source skos:closeMatch ?target .
      }
      GRAPH <http://data.openbudgets.eu/resource/codelist/cl-geo> {
        ?source skos:notation ?notation .
      }
    }
    GROUP BY ?target
    HAVING (COUNT(DISTINCT ?source) > 1)
  }
  GRAPH <http://data.openbudgets.eu/resource/linkset/cl-geo-to-dbpedia> {
    ?source skos:closeMatch ?target .
  }
  GRAPH <http://data.openbudgets.eu/resource/codelist/cl-geo> {
    ?source skos:notation ?notation .
    FILTER (STRLEN(?notation) < ?maxNotationLength)
  }
}
