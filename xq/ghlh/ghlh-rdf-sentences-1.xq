(: list sentences as frbr works / linguistic objects :)
declare namespace ecrm = "http://erlangen-crm.org/current/";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";
for $sentlist in distinct-values(
  for $s in //*:comment
let $s0 := replace($s,'grc1*-|hrv1*-|lat1*-', '')
return replace($s0,"http://solr.ffzg.hr/ghlh/","")
)
return element rdf:Description {
  attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-alignment"} ,
  element ecrm:E33_Linguistic_Object { $sentlist }
}