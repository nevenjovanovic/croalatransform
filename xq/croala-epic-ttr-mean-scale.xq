element m { let $c := count(//canto)
for $i in //ep/canto/tt
order by $i/@ttr descending
return element a { 
element mean { $i/../@xml:id ,
$i/../@n ,
data($i/@ttr) },
element scale { data($i/@ttr)  - 38.9 } } }
