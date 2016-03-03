DEFINE sql:log-enable 2

PREFIX dbo:  <http://dbpedia.org/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

WITH <http://dbpedia.org>
DELETE {
  ?redirect dbo:wikiPageRedirects ?target ;
    rdfs:label ?label .
}
INSERT {
  ?target rdfs:label ?label .
}
WHERE {
  ?redirect dbo:wikiPageRedirects ?target ;
    rdfs:label ?label .
}
