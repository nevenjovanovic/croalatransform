declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: calculate frequencies of particles :)
(: 1 in collections 2 in texts 3 in divs :)

declare function croala:partstat ($db, $what ) {
  let $divs := collection($db)//*[name()=$what and not(descendant::*[name()=$what])]
for $d in $divs
let $did := db:node-pre($d)
let $dpath := db:path($d)
where count(ft:tokenize($d)) gt 200 and count(ft:tokenize($d)) lt 295000
return element tr {
  element td { 
  element a {
    attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || $did } , $dpath
  } } ,
  
for $w in ("nam", "enim",  "autem", "igitur", "ergo", "nempe", "quippe", ".idelicet", "scilicet")
let $wc := count(ft:tokenize($d))
let $pc := ft:count($d[descendant::text() contains text {$w} using wildcards])
let $norm := round(1000 * $pc div $wc * 100) div 100
return 
  element td {
    attribute ref { $w } , $norm }
}
};

croala:partstat ("croala", "text" )