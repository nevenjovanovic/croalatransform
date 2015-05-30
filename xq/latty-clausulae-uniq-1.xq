declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:clausulae () {
let $claus := 
for $i in collection("latty")//*:TEI//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
return element l {
  $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:del or parent::*:sic[parent::*:choice])]
}
return 
for $aa in 
  for $e in $claus 
  return element c { ft:tokenize($e)[last() - 1] , ft:tokenize($e)[last()] }
order by $aa
return $aa
};
let $c := croala:clausulae()
let $dv := distinct-values($c)
for $d in $dv
where count($c[.=$d]) = 1
return $d