declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare namespace dcterms="http://www.purl.org/dc/terms/";
declare namespace frbr="http://purl.org/vocab/frbr/core#";
declare namespace croala="http://croala.ffzg.unizg.hr/ghlh/elements#";
let $rdf := element rdf:RDF {
for $w in collection("ghlh-got")//*:sentence/*:wds[@lnum='L1']/*:w
let $sentence := $w/preceding-sibling::*:comment
let $head := $w/ancestor::*:sentence/*:wds[@lnum='L2']
let $refs := data($w/*:refs/@nrefs)
for $r in tokenize($refs, ' ')
return element rdf:Description {
  attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-source"} ,
   element croala:wordform { 
      data($w) }
     ,
  element frbr:translation {
    element rdf:Description {
      attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-target"},
      element croala:wordform {
      data($head/*:w[@n=$r])}
    
  }
  },
    element dcterms:isPartOf { db:node-id($sentence) }
}
}
return $rdf