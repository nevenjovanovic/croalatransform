declare namespace tei = "http://www.tei-c.org/ns/1.0";
let $n := 
(: this can be a function :)
element n { let $a := //tei:TEI[descendant::tei:fileDesc[@xml:id='kunic-r-ilias-libri']]
(: find cantos :)
for $d in $a//tei:body/tei:div
return element td { $d/@n , count($d//tei:l) } 
}
return 
for $i in $n/td 
return element p { $i/@n , round((data($i) div sum(data($n/td))) * 1000) div 10 }