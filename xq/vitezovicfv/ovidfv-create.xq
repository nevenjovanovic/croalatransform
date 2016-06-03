(: ovidfv-create: create a db of Ovid's verses :)

let $cl := element claus {
  for $l in collection("ovid-pdl2")//*:l
  let $n := $l/@n
let $t := for $i in $l//text()[not(ancestor::*:note)] return normalize-space(replace($i, '[0-9\[\]\t/]', ''))
return element v { 
attribute vid {db:node-pre($l)} , 
attribute target {$l/ancestor::div/@n[matches(.,'urn')]} ,
$n,
$t }
}
return db:create("ovidfv2", $cl , "ovidclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })