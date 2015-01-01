declare default element namespace "http://www.tei-c.org/ns/1.0";
element listBibl {
let $list := doc("/home/neven/rad/croala-r/biblio/autori/radno/juric-nostri-croala-id.xml")
let $t := $list//*:ref[@type="croala"]/@target
for $i in //*:biblStruct/*:monogr[*:author/*:ref[@target=$t]]
order by $i/*:author/*:ref[@target=$t]/@target
return element bibl { 
attribute xml:id { concat("opus",generate-id($i/..)) } ,
$i/*:author ,
element title { normalize-space(string-join($i/*:title,'')) } ,
$i/*:imprint/*:date,
element relatedItem {
  attribute type { "tisak" } ,
  element ref {
    attribute target { data($i/ancestor::*:biblStruct/@xml:id) } ,
    data($i/*:imprint/*:pubPlace) ,
    data($i/*:imprint/*:date)
  }
}
 }
}