(: kazala za izdanje Henrikovih marginalija :)
(: 6 kazalo kombinacija u Euang. :)
let $list :=
for $r at $count in collection("henrik")//*:record
let $pp := $r/Kombinacija
let $c := string($count)
group by $pp
order by $pp
return element div {
  attribute class { "row-fluid"},
  element div {
    attribute class { "col-md-4 typus"},
    data($pp)
  },
  element div {
   attribute class { "col-md-8 notaid"},
   for $a in $c return
   element a {
     attribute href {"#euang.nota." || $a } , $a }
  } }
return 
element div {
  attribute class {"container-fluid"},
  attribute id {"index.comb"},
  element h1 {"Index signorum combinatorum"},
$list
}