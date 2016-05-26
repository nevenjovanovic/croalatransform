(:croalafv-create: create clausulae db :)

let $cl := element claus {
  for $l in collection("croala0")//*:l[not(@xml:lang) and not(parent::*:note) and not(ancestor::*:div/@xml:lang=('grc','ita','hrv','srp'))]
return element v { attribute vid {db:node-pre($l)} , $l }
}
return db:create("croalafv", $cl , "croalaclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })