(: return clausulae from croala, takes 27600 ms :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:lucr () {
let $repetit :=  element r {
let $claus :=
for $i in collection("croala")/*:TEI//*:l[not(ancestor-or-self::*/@xml:lang)]
return element l {
attribute id { db:node-pre($i) },
if ($i/@n) then 
attribute n { data($i/@n) }
else 
attribute n { count($i/preceding-sibling::*:l) + 1 
}
 ,
  for $t in $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:sic[parent::*:choice])] return replace($t, '[0-9]', '')
}
for $aa in 
for $e in $claus
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@id ,
$e/@n ,
ft:tokenize($e)[last() - 2] , ft:tokenize($e)[last() - 1] , ft:tokenize($e)[last()] }
else()
return $aa
}

return element ls {
$repetit/c
}
};
let $lst := element list { 
for $a in croala:lucr()/c
order by ft:tokenize($a)[last() - 1]
return $a }
return db:create("croalaclausulae", $lst , "clausulae-croala.xml")