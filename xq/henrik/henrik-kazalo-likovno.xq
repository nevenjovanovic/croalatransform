(: kazala za izdanje Henrikovih marginalija :)
(: 5 kazalo primarnih grafičkih oznaka u Euang. :)
let $result :=
for $r at $count in //*:record
let $crit := ("vitis", "manicula", "n caudata", "flosculus", "saeptum", "verba sublineata")
where $r/Sadržaj[.=$crit]
let $pp := $r/Sadržaj
let $c := string($count)
group by $pp
order by $pp
return element div {
  attribute class {"row-fluid"},
  element div {
    attribute class { "col-md-2 locus"},
    data($pp)
  },
  element div {
    attribute class { "col-md-4 margnum"},
  for $a in $c return
   element a {
     attribute href {"#euang.nota." || $a } , $a }
  } }
return element div {
  attribute class {"container-fluid"},
  attribute id {"insign.imag"},
  element h2 {"Insignitum imagunculis tantum"},
  $result
}
