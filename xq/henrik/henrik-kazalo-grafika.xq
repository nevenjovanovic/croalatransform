(: kazala za izdanje Henrikovih marginalija :)
(: 2 kazalo vrsta u Euang. :)
for $r at $count in //*:record
let $pp := $r/dodatno
let $c := string($count)
group by $pp
order by $pp
return element div {
  element span {
    attribute type { "locus"},
    data($pp)
  },
  element span {
    attribute type { "margnum"},
   string-join($c, ', ')
  } }

