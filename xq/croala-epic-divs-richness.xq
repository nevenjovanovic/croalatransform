declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:texts($input as item()+) as node()* {
   collection("croala")//tei:TEI[descendant::tei:textClass/tei:keywords[@scheme='biblio/croala-catalogus-aetatum.xml#gen01']/tei:term[contains(text(), $input)]]//tei:body//tei:div[contains(@type, 'liber')]
};
(: return wordcount for each word in verses :)
declare function croala:wc($input as item()+) as node()* {
for $words in ft:tokenize(string-join($input//tei:l//text(), ' '))
group by $w := $words
let $count := count($words)
order by $count descending
return <entry count="{ $count }">{ $w }</entry>
};
(: calculate lexical richness: count of word types divided by words total :)
declare function croala:lexicrich($input as item()+ , $wrdc as xs:integer) as item() {
  number(data($input)) div $wrdc * 100
};

(: calculate lexical richness for each div :)
(: genre mark here :)
for $a in croala:texts(('epica'))
(: count words in cantos :)
let $wc := count(ft:tokenize(string-join($a//tei:l//text(), ' ')))
let $b := croala:wc($a)
return element canto { $a/@type , $a/@n , $a/ancestor::tei:TEI//tei:fileDesc/@xml:id ,
for $c in $b
return element w { 
attribute lexr { croala:lexicrich($c/@count, $wc) } , 
$c/@count , 
attribute word { data($c) }
 }
} 