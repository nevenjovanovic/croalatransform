(: join Ovid's three word clausulae with matching Vitezović's :)
(: use fuzzy search :)
(: 10571*8895 array :)
(: 1000 Ovid's clausulae = 69s search :)
(: total time for full search : 406146.74 ms :)
(: for $n in 1 to 1000 :)
for $ovid in collection("ovidfv2clau3")//tr (: [position()=$n] :)
let $vitezovic := collection("vitezovicfv2clau3")//tr
where $ovid/td[1][text() contains text { $vitezovic/td[1]/text() } using fuzzy]
return element tr {
  $ovid/td[1],
  $ovid/td[2],
  $vitezovic[td[1][text() contains text { $ovid/td[1]/text() } using fuzzy ]]/td[2]
}