(: kazala za izdanje Henrikovih marginalija :)
(: 1 kazalo lokacija u Euang. :)
let $index :=
for $r at $count in //*:record
let $pp := $r/Str
let $c := string($count)
group by $pp
return element div {
  attribute class { "row-fluid"},
  element div {
    attribute class { "col-md-2 pagina"},
    element b { data($pp) }
  },
  element div {
   attribute class { "col-md-4 notaid"},
   for $a in $c return
   element a {
     attribute href {"#euang.nota." || $a } , $a }
  } }

return element div {
  attribute class {"container-fluid"},
  attribute id {"index.paginarum"},
  element h1 {"Index paginarum in editione Coloniensi 1529"},
  $index
}