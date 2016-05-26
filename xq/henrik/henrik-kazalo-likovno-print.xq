(: kazala za izdanje Henrikovih marginalija :)
(: 5 kazalo primarnih grafičkih oznaka u Euang. :)
let $result :=
for $r at $count in collection("henrik")//*:record
let $crit := ("vitis", "manicula", "n caudata", "flosculus", "saeptum", "verba sublineata")
where $r/Sadržaj[.=$crit]
let $pp := $r/Sadržaj
let $c := string($count)
group by $pp
order by $pp
return element p {
  attribute class {"index"},
  element b {
    
    data($pp)
  },
  " ",
  element span {
    attribute class { "margnum"},
  string-join($c , ', ')
  } }
return element div {
  element h2 {"Insignitum imagunculis tantum"},
  $result
}
