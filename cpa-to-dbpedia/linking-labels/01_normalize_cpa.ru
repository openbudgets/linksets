DEFINE sql:log-enable 2

PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

WITH <http://data.openbudgets.eu/resource/codelist/cpa>
INSERT {
  ?concept skos:hiddenLabel ?hiddenLabel .
}
WHERE {
  ?concept a skos:Concept ;
    skos:prefLabel ?prefLabel .
  BIND (STRLANG(REPLACE(STR(?prefLabel), "( and related)? services$", ""), "en") AS ?hiddenLabel)
}
