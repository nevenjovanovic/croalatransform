declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:wc($input) {
  count(tokenize($input, '\W+')[. != ''])
};
let $a := db:open("croala","sivrich-anacreont.xml")
for $b in $a//*:body//*:div[*:div[@xml:lang='ita'] and *:div[@xml:lang='lat']]
let $la := $b//*:div[@xml:lang='lat']
let $it := $b//*:div[@xml:lang='ita']
let $txt := croala:wc(string-join($b//*:div[@xml:lang='ita']//*:l//text()[not(parent::*:ref)], ' '))
let $txtl := croala:wc(string-join($b//*:div[@xml:lang='lat']//*:l//text()[not(parent::*:ref)], ' '))
return element c { element id {db:node-id($b)} , element it { count($it//*:l)} , element itc { $txt } , element la { count($la//*:l) } , element lac { $txtl } , element itla { round($txtl div $txt * 100) div 100 } }