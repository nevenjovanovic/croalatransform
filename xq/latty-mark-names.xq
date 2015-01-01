declare namespace croala='http://croala.ffzg.unizg.hr';
(: a function to mark names in a text node :)
(: problem -- cannot mark several names in the same node in one update :)
declare function croala:pname($string, $node) {
for $a in db:open-pre("latty", $node) 
return 
 ft:mark($a[. contains text {$string}], 'persName')
};
declare function croala:namup($node, $nodeb) {
  copy $c := db:open-pre("latty", $node)
  modify replace node $c with $nodeb
  return $c
};
(: open database with list of names :)
let $n := collection("imena")
for $a in $n//*:name[. contains text {"a.*"} using wildcards] 
(: return index nodes of results in text database :)
for $wcount in db:node-pre(collection("latty")//*:text//text()[. contains text {$a}])
where $wcount != 0
return croala:namup($wcount,croala:pname($a,$wcount[1]))
