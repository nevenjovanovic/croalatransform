(: ovidfv-create: create a db of Ovid's verses :)

let $cl := element claus {
  for $l in collection("ovid-pdl")//*:l
return element v { 
attribute vid {db:node-pre($l)} , 
attribute target {$l/ancestor::div/@n[matches(.,'urn')]} ,
$l }
}
return db:create("ovidfv", $cl , "ovidclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })