let $string := "http://solr.ffzg.hr/basex/rest/croalabib?query=element+w+{count(//*:pubPlace[@ref='BROJ'])}"
let $a := //lemma
for $l in distinct-values($a/l[not(contains(text(), ' ')) and node()]),
$f in distinct-values($a[l=$l]/n)
order by $f
return
element grad {
element ime { $f } ,
element a { attribute href { replace($string , 'BROJ' , $l) } , $l }
}

