declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:texts($input as item()+) as node()* {
   collection("croala")//tei:TEI[descendant::tei:textClass/tei:keywords[@scheme='biblio/croala-catalogus-aetatum.xml#gen01']/tei:term[contains(text(), $input)]]//tei:body//tei:div[contains(@type, 'liber') and position()=1]
};

(: fileId here :)
let $a := croala:texts(('epica'))
(: find cantos :)
for $d in $a
let $n := $d/(tei:l[1]|tei:lg[1]/tei:l[1])
return element prv { 
attribute id {db:node-id($d/ancestor::tei:TEI)} , 
$d/@n , 
$n }