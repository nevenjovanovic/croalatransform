(: kazala za izdanje Henrikovih marginalija :)
(: 6 kazalo kombinacija u Euang. :)
let $list :=
for $r at $count in collection("henrik")//*:record
let $pp := $r/Kombinacija
let $c := string($count)
group by $pp
order by $pp
return element p {
  attribute class { "index"},
  element b {
    attribute class { "typus"},
    data($pp)
  },
  " ",
  element span {
   attribute class { "notaid"},
   
   string-join($c , ', ')
  } }
return 
element div {
  attribute id {"index.comb"},
  element h1 {"Index signorum combinatorum"},
$list
}