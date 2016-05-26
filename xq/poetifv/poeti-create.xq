(: poeti-create: create clausulae db for Poeti d'Italia :)

  for $l in collection("poetiditalia")//*:l
let $node := element v { attribute vid {db:node-pre($l)} , $l }
return $node