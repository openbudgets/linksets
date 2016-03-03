# Solution for splitting from:
# <http://answers.semanticweb.com/questions/19162/split-and-trim-strings-in-sparql/27544>

DEFINE sql:log-enable 2

PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

WITH <http://data.openbudgets.eu/resource/codelist/cpa>
INSERT {
  ?concept skos:hiddenLabel ?hiddenLabel .
}
WHERE {
  VALUES ?n { "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" } # Split at most 10 conjoined items

  ?concept skos:prefLabel ?prefLabel .
  FILTER CONTAINS(?prefLabel, " and ")
  BIND (CONCAT("^((?! and ).+ and ){", ?n,"} *") AS ?skipN)
  BIND (STRLANG(LCASE(REPLACE(REPLACE(?prefLabel, ?skipN, ""), " and .*$", "")), "en") as ?hiddenLabel)
}
