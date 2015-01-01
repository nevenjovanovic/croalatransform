declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:wc($input) {
  count(tokenize($input, '\W+')[. != ''])
};
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};
let $a := db:open("croala","sivrich-anacreont.xml")
let $s :=
for $b in $a//*:body//*:div[*:div[@xml:lang='ita'] and *:div[@xml:lang='lat']]
let $la := $b//*:div[@xml:lang='lat']
let $it := $b//*:div[@xml:lang='ita']
let $txt := croala:wc(string-join($b//*:div[@xml:lang='ita']//*:l//text()[not(parent::*:ref)], ' '))
let $txtl := croala:wc(string-join($b//*:div[@xml:lang='lat']//*:l//text()[not(parent::*:ref)], ' '))
where count($it//*:l) gt 4 and count($it//*:l) lt 325
return element c { element id {db:node-id($b)} , 
element it { count($it//*:l)} , 
element itc { $txt } , 
element la { count($la//*:l) } , 
element lac { $txtl } , 
element itla { croala:round2($txtl, $txt) },
element litla {croala:round2(count($la//*:l),count($it//*:l))}
}
return csv:serialize(element s {$s})