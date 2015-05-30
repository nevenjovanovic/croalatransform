declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: calculate frequencies of particles :)
(: 1 in collections 2 in texts 3 in divs :)
(: return number of 0 results :)

declare function croala:partstat ($db, $what ) {
  for $w in ("nam", "enim",  "autem", "igitur", "ergo", "nempe", "quippe", ".idelicet", "scilicet")
  let $divs := collection($db)//*[name()=$what and not(descendant::*[name()=$what])]
for $d in $divs
where count(ft:tokenize($d)) gt 200 and count(ft:tokenize($d)) lt 295000
let $wc := count(ft:tokenize($d))
let $pc := ft:count($d[descendant::text() contains text {$w} using wildcards])
let $norm := round(1000 * $pc div $wc * 100) div 100
where $norm eq 0
return 
  element td {
    attribute ref { $w } , count($d) }
 

};

for $a in croala:partstat ("croala", "div" )
let $b := $a/@ref
group by $b
order by count($a) descending
return element tr { 
element td { $b } , 
element td { count($a) } }
