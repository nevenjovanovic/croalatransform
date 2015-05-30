declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: round a number :)
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};
let $aet := "16xx"
let $dbidx := "cl-idx"
let $vl := count(collection($dbidx)//d[db[.="latty"] and aet[contains(., $aet)]])
let $vc := count(collection($dbidx)//d[db[.="croala"] and aet[contains(., $aet)]])
let $ranges := for $values in
  let $ttr := distinct-values(collection($dbidx)//d/ttr)
  for $n in $ttr 
  return $n
let $v := collection($dbidx)//d[aet[contains(.,$aet)] and ttr[.=$values]]
let $cc := count($v/db[.="croala"])
let $cl := count($v/db[.="latty"])
order by number($values) descending
return if ($cc > 0 and $cl > 0) then element tr { 
element td { 
  element a { attribute href {"http://solr.ffzg.hr/basex/ttrdiv/" || $values } , $values } }, 
element td { croala:round2($cl, $vl) }, 
element td { croala:round2($cc, $vc) }
 }
 else ()
return element blockquote {
  element p { "Aetas: " || $aet},
  element p { "Div in LatTy: " || $vl} ,
  element p {"Div in CroALa: " || $vc} ,
  element table { 
  element thead {
    element tr {
      element td { "TTR"},
      element td { "Div in LatTy"},
      element td { "Div in CroALa"}
    }
  },
  element tbody { $ranges } }
}