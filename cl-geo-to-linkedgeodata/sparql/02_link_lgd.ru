PREFIX lgdo: <http://linkedgeodata.org/ontology/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

INSERT {
  GRAPH <http://data.openbudgets.eu/resource/linkset/cl-geo-to-linkedgeodata> {
    ?source skos:exactMatch ?target .
  }
}
WHERE {
  GRAPH <http://data.openbudgets.eu/resource/codelist/cl-geo> {
    ?source a skos:Concept ;
      skos:notation ?code .
  }
  GRAPH <http://linkedgeodata.org> {
    ?target lgdo:ref%3ANUTS ?code .
  }
}
