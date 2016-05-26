(: vitezovicfv-create: create clausulae db :)

let $cl := element claus {
  for $l in collection("vitezovic-epistolae")//*:l[not(@xml:lang='hrv')]
return element v { attribute vid {db:node-pre($l)} , $l }
}
return db:create("vitezovicfv", $cl , "vitezovicclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })