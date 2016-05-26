(: kazala za izdanje Henrikovih marginalija :)
(: 2 kazalo vrsta u Euang. :)
let $result :=
element div {
for $r at $count in collection("henrik")//*:record
let $pp := $r/TipMarg
let $c := string($count)
group by $pp
order by $pp
return element div {
  attribute class { "row-fluid"},
  element div {
    attribute class { "col-md-2 typus"},
    for $ty in data($pp)
    return switch($ty)
    case "komentar" return "commentum"
    case "leksik" return "copia verborum"
    case "naslov" return "titulus"
    case "naslov.interp" return "titulus aliis verbis"
    case "naslov.ponovljeno" return "titulus repetitis verbis"
    case "upozorenje" return "animadvertendum"
    default return ""
  },
  element div {
   attribute class { "col-md-4 notaid"},
   for $a in $c return
   element a {
     attribute href {"#euang.nota." || $a } , $a }
  } }
}
return element div { 
attribute class {"container-fluid"},
attribute id {"index.ratio"},
element h1 {"Index rationum et generum notationis"},
element h2 {"Insignitum verbis"},
for $r in $result/div[@class]
where not($r/div[@class][1]/empty(text()))
order by $r/div[@class][1]
return $r
}
