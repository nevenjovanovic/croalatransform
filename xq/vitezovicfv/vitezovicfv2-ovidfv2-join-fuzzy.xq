(: join Ovid's two word clausulae n > 9 with matching Vitezović's :)
(: use fuzzy search :)
(: 8666*7299 array :)
(: 1000 Ovid's clausulae = 69s search :)
(: total time for full search : 238742.65 ms :)
let $tbody := element tbody {
for $ovid in collection("ovidfv2clau2")//tr (: [position()=$n] :)
let $vitezovic := collection("vitezovicfv2clau2")//tr
where $ovid/td[1][text() contains text { $vitezovic/td[1]/text() }using fuzzy ]
order by $ovid/td[1]
return element tr {
  $ovid/td[1],
  $ovid/td[2],
  $vitezovic[td[1][text() contains text { $ovid/td[1]/text() } using fuzzy ]]/td[2]
}
}
return file:write("/home/neven/rad/ritter/reports/ovid2-vitezovic2-fuzzy.xml", $tbody)