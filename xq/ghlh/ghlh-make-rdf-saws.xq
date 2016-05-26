(: mark types of translation :)
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare namespace dcterms="http://www.purl.org/dc/terms/";
declare namespace frbr="http://purl.org/vocab/frbr/core#";
declare namespace saws="http://purl.org/saws/ontology#";
declare namespace croala="http://croala.ffzg.unizg.hr/ghlh/elements#";
(: build a rdf record :)
let $rdf := element rdf:RDF {
for $w in collection("ghlh-got")//*:sentence/*:wds[@lnum='L1']/*:w
let $lang := $w/ancestor::*:aligned-text/*:language[@lnum='L1']/@xml:lang
let $sentence := $w/preceding-sibling::*:comment
let $head := $w/ancestor::*:sentence/*:wds[@lnum='L2']
let $refs := data($w/*:refs/@nrefs)
let $refsequence := tokenize($refs, ' ')
return if ($refsequence[2]) then
for $r in $refsequence
return element rdf:Description {
  attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-source/" || db:node-id($w) } ,
   element croala:wordform { 
   $lang ,
      data($w) }
     ,
  element saws:isLooseTranslationOf {
    element rdf:Description {
      attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-target/" || db:node-id($head/*:w[@n=$r])},
      element croala:wordform {
      data($head/*:w[@n=$r])}
    
  }
  },
    element dcterms:isPartOf { db:node-id($sentence) }
}
else if ($refsequence) then
element rdf:Description {
  attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-source/" || db:node-id($w) } ,
   element croala:wordform { 
   $lang ,
      data($w) }
     ,
  element saws:isDirectTranslationOf {
    element rdf:Description {
      attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-target/" || db:node-id($head/*:w[@n=$refsequence])},
      element croala:wordform {
      data($head/*:w[@n=$refsequence])}
    
  }
  },
    element dcterms:isPartOf { db:node-id($sentence) }
}
else 
element rdf:Description {
  attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-source/" || db:node-id($w) } ,
   element croala:wordform { 
   $lang,
      data($w) }
     ,
  element saws:isNotPresentIn {
    element rdf:Description {
      attribute rdf:about {"http://croala.ffzg.unizg.hr/ghlh/translation-target"}
    
  }
  },
    element dcterms:isPartOf { db:node-id($sentence) }
}
}
return db:create("ghlh-rdf", $rdf , 'ghlh-rdf.xml', map { 'ftindex': true(), 'intparse': true() })