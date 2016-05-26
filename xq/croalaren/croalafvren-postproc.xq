(: post-processing verse for renaissance clausulae :)
let $cl := element claus {
  for $vers in collection("croalafvren")//*:claus/*:v
let $t := 
for $i in $vers/*:l return normalize-space(replace($i, '[0-9\t/]', ''))
return element l { $vers/@* , $t }
}
return db:create("croalafvren", $cl , "croalaclausulaeren.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })