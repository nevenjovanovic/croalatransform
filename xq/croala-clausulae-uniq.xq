for $broj in element p { let $c := //*:c
for $v in distinct-values($c)
let $count := count($c[. = $v])
return element v { 
element vb { $v } , 
element cnt { $count}
}
}
for $a in $broj//v
where fn:number($a/cnt/text()) = 1
return $a