(: post-processing verse for clausulae :)
let $cl := element claus {
  for $vers in collection("pdillclausulae")//*:v
  let $attrs := $vers/@*
let $t := for $i in $vers/*:l//text() return normalize-space(replace($i, '[0-9\t/]', ''))
return element l { $attrs , $t }
}
return db:create("pdillfv", $cl , "pdillclausulae.xml", map { 'ftindex': true(), 'intparse': true() })