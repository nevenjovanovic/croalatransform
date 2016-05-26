declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: return all Lucretius' clausulae with parallels in croala db :)
declare function croala:allud($t) {
  for $i in $t/cl
  where $i[ft/cn!='0']
  return element ln { $i/@id , data($i/ft/nod) }
};

declare function croala:croalan ($croaladata) {
  for $lucretid in $croaladata
return for $nn in tokenize($lucretid, ' ') 
let $croalanod := db:open-pre("croala",xs:integer($nn))
return 
element a { 
attribute href {"http://solr.ffzg.hr/basex/node/croala/" || $nn },
db:path($croalanod) }

};

declare function croala:lucretn($lucrdata) {
for $lucretl in $lucrdata
let $lucr1 := db:open-pre("lucretius",$lucretl)
let $lucretbk := $lucr1/ancestor::*:div1/@n
let $lucretln := if ($lucr1/@id) then data($lucr1/@id) 
else count($lucr1/preceding-sibling::*:l[parent::*:div1]) + 1
let $perseus := "http://data.perseus.org/citations/urn:cts:latinLit:phi0550.phi001.perseus-lat1:"
order by $lucretbk , $lucretln
return element tr {
  element td {
    element a {
  attribute href { $perseus || data($lucretbk) || "." || $lucretln } ,
  data($lucretbk) || "." || $lucretln
}
},
element td {
  $lucr1
}
}
};
let $t := collection("lucretius-croala2")/*
for $skup in croala:allud($t)
let $lc := croala:lucretn(data($skup/@id))
return element table { $lc , 
element tr {
  element td { count(for $a in tokenize(data($skup), ' ') return $a)} ,
  element td {
  croala:croalan(data($skup)) }
} }