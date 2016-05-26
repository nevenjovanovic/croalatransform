(: post-processing verse for clausulae :)
let $cl := element v {
  for $vers in collection("croalafv")//*:v
let $vid := $vers/@vid
let $t := for $i in $vers/*:l//text()[not(ancestor::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:ptr or parent::*:sic[parent::*:choice])] return normalize-space(replace($i, '[0-9\t/]', ''))
return element l { $vid , $t }
}
return db:create("croalafv", $cl , "croalaclausulae.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })