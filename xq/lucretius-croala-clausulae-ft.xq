let $t := collection("lucretius-croala")/*
for $lucretid in for $i in $t/cl
where $i[ft/cn!='0']
return data($i/@id)
let $lucretl := db:open-pre("lucretius",$lucretid)
let $lucretbk := $lucretl/ancestor::*:div1/@n
let $lucretln := if ($lucretl/@id) then data($lucretl/@id) 
else count($lucretl/preceding-sibling::*:l[parent::*:div1]) + 1
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
  $lucretl
}
}