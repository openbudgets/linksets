DEFINE sql:log-enable 2

PREFIX dbo:  <http://dbpedia.org/ontology/>

WITH <http://dbpedia.org>
DELETE {
  ?redirect dbo:wikiPageRedirects ?target .
}
WHERE {
  ?redirect dbo:wikiPageRedirects ?target .
}
