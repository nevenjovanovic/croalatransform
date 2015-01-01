(: get type / token ratio for poetic divs in latin :)
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:wc($input) {
  count(tokenize($input, '\W+')[. != ''])
};
declare function croala:ttc($input) {
  tokenize(translate(lower-case(string-join($input//text(), ' ')), '0123456789', ' '), '\W+')[. != '']
}; 
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};
let $n := element cs {
for $a in 
for $i in db:open("osmanlathrv","sivrich-anacreont.xml")//*:body//*:div[@xml:lang='lat'][descendant::*:l]
for $l in $i
return element lg { $l/*:l  }
let $tc := count(distinct-values(croala:ttc($a)))
let $wc := count(croala:ttc($a))
where $wc ne 0
return element p { croala:round2($tc, $wc) }
}
return string-join($n/*:p, ',')