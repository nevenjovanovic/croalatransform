declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:wc($input) {
  count(tokenize($input, '\W+')[. != ''])
};
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};
let $stat :=
for $s in //*:text

let $lw := croala:wc(data($s))
let $per := $s/..//*:profileDesc/*:creation/*:date/@period
group by $per
order by $per
return element p { 
element lp { data($per) },
element name { for $n in $s/..//*:fileDesc/@xml:id return element doc { data($n) } },
element id { for $n in db:node-pre($s) return element doc {$n} },
element gen { for $n in $s/..//*:profileDesc/*:textClass/*:keywords[@scheme='genre']/*:term return $n },
element lw { for $n in $lw return element wc {$n} }
}
return file:write("/home/neven/ownCloud/documents/tirol/alatyr/alatyr-idx.xml", element words { $stat })