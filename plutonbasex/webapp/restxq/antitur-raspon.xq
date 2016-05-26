let $krit := 
for $a in 1500 to 1510
return $a
for $r in collection("croantiturcica")//*:record
let $a := $r/*:Autor
let $g := xs:integer(replace($r/*:Godina, '-01-01', ''))
where $g > 1499 and $g < 1574
group by $a
return element tr { 
element td { $a } , 
if ($krit = $g) then for $item in $g return element td {$item}
else element td {"*"}}