(: return clausulae from Perseus' Lucretius :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:lucr () {
let $repetit :=  element r {
let $claus :=
for $i in collection("lucretius")//*:TEI.2//*:l
return element l {
attribute id { db:node-pre($i) },
if ($i/@n) then 
attribute n { data($i/parent::div1/@n) || "." || data($i/@n) }
else 
attribute n { data($i/parent::div1/@n) || "." || count($i/preceding-sibling::*:l) + 1 
}
 ,
  $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:sic[parent::*:choice])]
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
attribute count {count($repetit/c)} ,
$repetit/c
}
};

element idx {
let $claus := croala:lucr()
for $c in $claus/c
let $s := 
 if (string-length(ft:tokenize($c)[last()]) > 10) then ft:tokenize($c)[last()]
 else if (string-length(ft:tokenize($c)[last() - 1]) <= 3) 
  then $c
 else concat(ft:tokenize($c)[last() - 1] , " ", ft:tokenize($c)[last()])
let $cro1 := collection("croala")//*:l[text() contains text {$s}]
let $cro2 := collection("croala")//*:l[text() contains text {$s} using fuzzy]
return element cl {
   $c/@id ,
   $c/@n ,
  element lucr { data($c) } ,
   element ft { 
   element cn { count($cro1) } ,
   element nod { db:node-pre($cro1) }
 } ,
 element fz {
   element cn { count($cro2) } ,
   element nod { db:node-pre($cro2)} }
 }
}