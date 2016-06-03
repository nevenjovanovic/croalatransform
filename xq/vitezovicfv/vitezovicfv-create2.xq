(: vitezovicfv-create2: create db of lines to easier analyse clausulae :)

let $cl := element claus {
  for $l in collection("vitezovic-epistolae2")//*:l[not(@xml:lang='hrv')]
  let $n := $l/@n
  let $t := for $i in $l//text() return normalize-space(replace($i, '[0-9\[\]\{\}\t/]', ''))
return element v { attribute vid {db:node-pre($l)} , $n, $t }
}
return db:create("vitezovicfv2", $cl , "vitezovicversus2.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })