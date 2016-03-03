DEFINE sql:log-enable 2

PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

WITH <http://data.openbudgets.eu/resource/codelist/cpa>
DELETE WHERE {
  ?concept skos:hiddenLabel ?hiddenLabel .
}
