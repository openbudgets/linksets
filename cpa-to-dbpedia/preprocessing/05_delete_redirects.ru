DEFINE sql:log-enable 2

PREFIX dbo:  <http://dbpedia.org/ontology/>

WITH <http://dbpedia.org>
DELETE WHERE {
  ?redirect dbo:wikiPageRedirects ?target .
}
