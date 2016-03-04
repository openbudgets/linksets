DEFINE sql:log-enable 2

PREFIX dbo:  <http://dbpedia.org/ontology/>

WITH <http://dbpedia.org>
DELETE {
  ?s ?p ?o .
}
WHERE {
  {
    SELECT DISTINCT ?s
    WHERE {
      ?s dbo:wikiPageDisambiguates [] .
    }
    ORDER BY ?s
  }
  ?s ?p ?o .
}
