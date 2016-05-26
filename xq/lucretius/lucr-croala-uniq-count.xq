(: return number of unique croala lines with Lucr. clausulae, as csv :)
let $csv1 := element csv1 {
let $csv := 
element csv { 
for $l in distinct-values(for $i in //tr[2]/td[2]/a
let $name := data($i)
return substring-after(data($i/@href), '/croala/') || "," || substring-before(data($name), '.xml') )
let $f := substring-after($l,',')
group by $f
return element r { 
element f { $f } , element c { count($l) } }
}
for $a in $csv/r
order by $a/f
return $a
}
return csv:serialize($csv1)