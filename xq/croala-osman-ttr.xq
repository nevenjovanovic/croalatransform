(: divide each canto into sets of 15 lines :)
(: get type / token ratio for sets :)
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
let $n := 
for $a in 
for $i in db:open("osmanlathrv","getaldic-v-osmanides.xml")//*:body/*:div/*:div
for $l in $i/*:l[position() mod 15 eq 1]
let $c := 1 to 14
return element lg { $l , $l/following-sibling::*:l[position()=$c] }
let $tc := count(distinct-values(croala:ttc($a)))
let $wc := count(croala:ttc($a))
return element lg { croala:round2($tc, $wc) }
return string-join($n, ',')