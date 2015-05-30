(: which docs don't have particles :)
let $list := 
let $w := ("nempe", "quippe")
for $ff in collection("croala")//*:text[descendant::text() contains text {$w} any]
return db:path($ff)
for $i in collection("croala")/*:TEI
let $p := db:path($i)
order by $p
return if (not($list = $p)) then $p else()