declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:wc($input) {
  count(tokenize($input, '\W+')[. != ''])
};
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};
let $stat :=
element words { 
for $s in //*:text[not(parent::*:group)]
(: let $lw := croala:wc(data($s)) :)
let $id := $s/..//*:fileDesc/@xml:id
let $per := $s/ancestor::*:TEI//*:profileDesc[1]/*:creation[1]/*:date[1]/@period
group by $per
order by $per
return element p { 
element lp { $per },
element wc { for $i in $s return element n { $i/..//*:fileDesc/@xml:id ,
  attribute target {db:node-pre($i) }  ,
  count(ft:tokenize($i))  } },
element gen { 
let $n := $s/..//*:profileDesc[1]/*:textClass/*:keywords[@scheme='genre']/*:term
return for $i in distinct-values($n) return element o {$i} }
}
}
return (: $stat :)

 file:write("/home/neven/ownCloud/documents/tirol/alatyr/croala-idx.xml",  $stat )