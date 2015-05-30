(: return clausulae from Latin l elements and information on them :)
let $claus := element tbody { 
for $v in 
(: for $i in //*:TEI[descendant::*:creation/*:date[contains(@period,'15xx')]]//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)] :)
for $i in //*:TEI//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
return element l {
  attribute base { fn:base-uri($i)},
  attribute nodeid { db:node-pre($i) } ,
  attribute period { data($i/ancestor::*:TEI/descendant::*:profileDesc[1]/*:creation/*:date/@period) },
  attribute genre { data($i/ancestor::*:TEI/descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term) },
  $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:del or parent::*:sic[parent::*:choice])]
}
let $lv := distinct-values(for $a in ft:tokenize($v) return replace(replace($a, '[\W\d]', ''),'[vV]','u'))
return element tr { 
element td { data($v/@base )},
element td { data($v/@nodeid) } ,
element td { data($v/@period) } ,
element td { data($v/@genre) } ,
element td {
$lv } }
}
(: return db:create("clausulaecroala", $claus, "clausulae.xml",  map {"intparse" : true()}) :)
return 
element table { 
element thead { 
element tr {
  element td { "Versus: " || count($claus//tr)} } },
$claus }