(:croalafv-renais-create: create clausulae db :)
(:use just a subset of documents in croala0:)


let $cl := element claus {
  (: centuries :)
  for $value in ("09xx","10xx","11xx","12xx","13xx","14xx","15xx","16xx")
  
  for $l in collection("croala0")/*:TEI[*:teiHeader/*:profileDesc[1]/*:creation[1]/*:date[1][matches(@period,$value)]]//*:l[not(@xml:lang) and not(parent::*:note) and not(ancestor::*:div/@xml:lang=('grc','ita','hrv','srp'))]
return element v { 
attribute vid {db:node-pre($l)} , 
attribute target {db:path($l)},
attribute period {$value} ,
$l }
}
return db:create("croalafvren", $cl , "croalaclausulaeren.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })