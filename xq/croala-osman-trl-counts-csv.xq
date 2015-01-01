declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:wc($input) {
  count(tokenize($input, '\W+')[. != ''])
};
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};
let $stat :=
for $s in //*:div[@xml:lang='hrv']
let $hc := $s/@n
let $l := db:open("osmanlathrv","getaldic-v-osmanides.xml")//*:div[@xml:lang='lat' and @n=$hc ]
let $sw := croala:wc(string-join($s//*:l/text(), ' '))
let $lw := croala:wc(string-join($l/*:l/text(), ' '))
return element p { 
element c { data($hc) } , 
element hn { db:node-id($s) } , 
element hl { count($s//*:l) } , 
element hw { $sw } , 
element ln { db:node-id($l) } , 
element ll { count($l/*:l) } , 
element lw { $lw } , 
element hrla { croala:round2($lw, $sw) }
}
return csv:serialize(element st { $stat } )