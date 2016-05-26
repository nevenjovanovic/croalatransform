(: parse with morpheus :)
(: record to database :)
let $morph := ('http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=lat&amp;word=REPLACE_WORD&amp;engine=morpheuslat')
let $res := element result {
for $i in distinct-values(collection("croalafvclau1")//*:c[string-length(text()) gt 10])
let $q := doc(replace($morph, 'REPLACE_WORD',$i))
return element annotation { $q/*:RDF/*:Annotation/*:hasTarget/*:Description/@*:about , $q//*:dict }
}
return db:create("croalafvmorpheus11", $res , "croalaparsed11.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })