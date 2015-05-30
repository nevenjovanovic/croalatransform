declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: return a list of Greek words :)

declare function croala:ttr ($types, $list, $ttr) {
  element table {
    element thead {
    element tr { "Tokens:", count($list/*:text) },
    element tr { "Types:", count($types) },
    element tr { "TTR:" , $ttr }
},
element tbody {
for $w in $types
let $freq := count($list/*:text[. eq $w])
order by $freq descending
return 
element tr {
  element td { $w },
  element td { $freq }
}
}
}

};

declare function croala:latidx ($lang) {
for $s in collection("ghlh-got")//*:aligned-text[*:language[@xml:lang=$lang]]/*:sentence/*:wds[@lnum="L2"]/*:w/*:text[text()]
order by $s
return $s
};
let $list :=
let $a := croala:latidx("hrv")
return element list {$a}
let $types := distinct-values($list/*:text)
let $ttr := round(count($list/*:text) div count($types))
return
croala:ttr($types, $list, $ttr)