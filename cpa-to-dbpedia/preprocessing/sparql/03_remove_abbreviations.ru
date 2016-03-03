DEFINE sql:log-enable 2

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

WITH <http://dbpedia.org>
DELETE {
  ?s rdfs:label ?label .
}
WHERE {
  ?s rdfs:label ?label .
  FILTER REGEX(STR(?label), "^[A-Z]{2,}.*$")
}
