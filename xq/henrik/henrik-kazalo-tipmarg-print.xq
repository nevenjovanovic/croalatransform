(: kazala za izdanje Henrikovih marginalija :)
(: 2 kazalo vrsta u Euang. :)
let $result :=
element div {
for $r at $count in collection("henrik")//*:record
let $pp := $r/TipMarg
let $c := string($count)
group by $pp
order by $pp
return
  element p {
    element b {
    attribute class { "typus"},
    for $ty in data($pp)
    return switch($ty)
    case "komentar" return "commentum"
    case "leksik" return "copia verborum"
    case "naslov" return "titulus"
    case "naslov.interp" return "titulus aliis verbis"
    case "naslov.ponovljeno" return "titulus repetitis verbis"
    case "upozorenje" return "animadvertendum"
    default return ""
  }
  , " ",
  string-join($c, ', ') }
}
return element div {
element h1 {"Index rationum et generum notationis"},
element h2 {"Insignitum verbis"},
for $r in $result/p
where not($r/b/empty(text()))
order by $r/b
return $r
}
