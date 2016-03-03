DEFINE sql:log-enable 2

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

WITH <http://dbpedia.org>
INSERT {
  ?s skos:hiddenLabel ?hiddenLabel .
}
WHERE {
  ?s rdfs:label ?label .
  BIND (LCASE(?label) AS ?hiddenLabel)
}
