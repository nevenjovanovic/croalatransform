(: post-processing verse for vitezović clausulae :)
let $cl := element v {
  for $vers in collection("vitezovicfv")//*:v
let $vid := $vers/@vid
let $n := $vers/*:l/@n
let $t := for $i in $vers/*:l//text() return normalize-space(replace($i, '[0-9\[\]\t/]', ''))
return element l { $vid , $n , $t }
}
return db:create("vitezovicfv", $cl , "vitezovicclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })