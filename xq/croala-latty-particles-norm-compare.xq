(: calculate frequency for particles in divs over 1000 words :)
let $csv := element csv {
let $divs := collection("latty")//*:div[not(descendant::*:div)]
for $d in $divs
let $did := db:node-pre($d)
let $dpath := db:path($d)
return element tr {
  element td { $dpath } ,
  element td { $did } ,
for $w in ("nam", "autem", "nempe", "enim",  "igitur", "ergo")
let $wc := count(ft:tokenize($d))
let $pc := ft:count($d[descendant::text() contains text {$w}])
let $norm := round(1000 * $pc div $wc * 100) div 100
return 
  element td { $norm }
}
}
return csv:serialize($csv)