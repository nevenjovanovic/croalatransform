(: join Ovid's one word clausulae n > 6 with matching Vitezović's :)
(: use non-fuzzy search :)
(: 1159*1034 array :)
(: 1000 Ovid's clausulae = 69s search :)
(: total time for full search : 3918.81 ms :)
(: for $n in 1 to 1000 :)
let $tbody := element tbody {
for $ovid in collection("ovidfv2clau1")//tr (: [position()=$n] :)
let $vitezovic := collection("vitezovicfv2clau1")//tr
where $ovid/td[1][text() contains text { $vitezovic/td[1]/text() }]
order by $ovid/td[1]
return element tr {
  $ovid/td[1],
  $ovid/td[2],
  $vitezovic[td[1][text() contains text { $ovid/td[1]/text() } ]]/td[2]
}
}
return file:write("/home/neven/rad/ritter/reports/ovid1-vitezovic1.xml", $tbody)