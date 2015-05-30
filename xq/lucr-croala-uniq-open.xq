declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:tda ($f) {
  element td {
  element a {
attribute href { "http://solr.ffzg.hr/basex/node/croala/" || $f } ,
$f
}
}
};
declare function croala:opendb ($n) {
  db:open-pre("croala",$n)
};

declare function croala:filen ($fn) {
  substring-before(db:path(croala:opendb($fn)), '.')
};

declare function croala:clausula ($n) {
  for $a in 0 to 2
  let $b := 2 - $a
  return ft:tokenize(string-join(croala:opendb($n)//text()[not(ancestor::*:note)], ' '))[last() - $b]
};
(: return all unique croala lines with Lucr. clausulae :)
element tbody { 
for $l in distinct-values(for $i in collection("lucretius-croala-ft-fuz")//tr[2]/td[2]/a/@href
return data($i))
let $f := xs:integer(substring-after(data($l), '/croala/'))
let $clau := croala:clausula($f)
return element tr { 
 croala:tda($f) , 
 element td { croala:filen($f) } ,
 element td { string-join(db:open-pre("croala", $f)//text()[not(ancestor::*:note)], ' ') },
 element td {
   attribute class { "clausula"} ,
$clau
}
}
}