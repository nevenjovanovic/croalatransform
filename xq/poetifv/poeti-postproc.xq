(: post-processing verse for clausulae :)
let $cl := element v {
  for $vers in collection("pdillclausulae")//*:v
let $vid := $vers/@vid
let $t := for $i in $vers/*:l//text() return normalize-space(replace($i, '[0-9\t/]', ''))
return element l { $vid , $t }
}
return db:create("pdillfv", $cl , "pdillclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })