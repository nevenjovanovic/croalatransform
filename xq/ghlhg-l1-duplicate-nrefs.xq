(: nrefs sequences in L1 appearing more than once - several L1 words pointing to the same L2 sequence :)
(: return sentence node-pre, sentence filename, total number of nrefs, number of duplicate nrefs :)
for $nr in (db:node-pre(//*:sentence)) 
for $sentence in db:open-pre("ghlh-got", $nr)/*:wds[@lnum="L1"]
let $values := $sentence/*:w/*:refs/@nrefs
return element sent {
  attribute target { data($sentence/*:comment) }, 
attribute id {$nr},
attribute nreftot { count($values/..) },
attribute nrefdup { count($values[index-of($values, .)[2]]/..) } ,
$values[index-of($values, .)[2]]/.. }

