DEFINE sql:log-enable 2

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

DELETE {
  GRAPH <http://dbpedia.org> {
    ?s ?p ?o .
    ?inS ?inP ?s .
  }
}
WHERE {
  {
    SELECT ?s
    WHERE {
      {
        SELECT DISTINCT ?s
        WHERE {
          GRAPH <http://dbpedia.org/labels> {
            ?s rdfs:label ?label .
            FILTER CONTAINS(?label, "(disambiguation)")
          }
        }
        ORDER BY ?s
      }
    }
  }
  GRAPH <http://dbpedia.org> {
    ?s ?p ?o .
    OPTIONAL {
      ?inS ?inP ?s .
    }
  }
}
