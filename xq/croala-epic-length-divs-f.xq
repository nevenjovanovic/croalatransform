declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:texts($input as item()+) as node()* {
   collection("croala")//tei:TEI[descendant::tei:textClass/tei:keywords[@scheme='biblio/croala-catalogus-aetatum.xml#gen01']/tei:term[contains(text(), $input)]]//tei:body//tei:div[contains(@type, 'liber')]
};

(: fileId here :)
let $a := croala:texts(('epica'))
(: find cantos :)
for $d in $a
let $n := count($d//tei:l)
where $n lt 200
return element tr { 
element td {data($d/ancestor::tei:TEI//tei:fileDesc/@xml:id) } ,
element td { attribute type {"canto"} , data($d/@n) } , element td { 
attribute type {"verses"} , $n } 
}