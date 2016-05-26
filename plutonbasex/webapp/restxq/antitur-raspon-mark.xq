let $autori := 
element table {
for $r in collection("croantiturcica")//*:record
let $g := xs:integer(replace($r/*:Godina, '-01-01', ''))
where $g > 1499 and $g < 1574
let $aut := $r/*:Autor
group by $aut
return element td { $aut }
}

return element tbody {
for $p in $autori//td
let $a := 1500 to 1550
return element tr { $p , 
for $n in $a 
return if (collection("croantiturcica")//*:record[Autor=$p and matches(Godina, xs:string($n))]) then element td { 
element b { "*" } }
else element td { "-" }  }
}