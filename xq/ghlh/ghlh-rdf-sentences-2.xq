(: list sentences as frbr works / linguistic objects :)
declare namespace ecrm = "http://erlangen-crm.org/current/";
declare namespace frbr="http://purl.org/vocab/frbr/core#";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";
for $sentlist in //*:aligned-text
  let $s := $sentlist//*:comment
  let $s0 := $sentlist/*:sentence[1]/*:wds[1]/*:comment[1]
  let $s0r := if (matches($s0,'lat')) then replace(replace($s0,'(lat1*)-(.*)-([0-9]+)\.txt', '$1:$2.$3'),"http://solr.ffzg.hr/ghlh/","urn:cts:latinLit:")
  else if (matches($s0,'grc')) then replace(replace($s0,'(grc1*)-(.*)-([0-9]+)\.txt', '$1:$2'),"http://solr.ffzg.hr/ghlh/","urn:cts:GreekLit:")
  else()
return element rdf:Description {
  attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-alignment"} ,
  element ecrm:E33_Linguistic_Object { 
  attribute rdf:resource { "http://data.perseus.org/citations/" || $s0r },
  $s0r } ,
  for $i in $s return
  element frbr:Expression {
    element rdf:Description {
    element ecrm:E33_Linguistic_Object { 
    attribute rdf:resource { data($i) }
  }
  }
  }
}