(: post-processing verse for Ovid's clausulae :)
let $cl := element v {
  for $vers in collection("ovidfv")//*:v
let $vid := $vers/@vid
let $target := $vers/@target
let $n := $vers/*:l/@n
let $t := for $i in $vers/*:l//text()[not(parent::*:note)] return normalize-space(replace($i, '[0-9\[\]\t/]', ''))
return element l { $vid , $target , $n , $t }
}
return db:create("ovidfv", $cl , "ovidclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })