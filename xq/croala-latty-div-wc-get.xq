declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

let $xml := element tbody { 
for $idx in 
for $i in //*:text[not(ancestor::*:text)]
for $dc in $i//*:div[not(descendant::*:div)]
let $wc := count(ft:tokenize($dc))
order by $wc descending
return element tr { 
element td { base-uri($dc) || ":" || db:node-pre($dc)},
element td { attribute class {"wc"} , $wc }
}

return $idx
}
return csv:serialize($xml)