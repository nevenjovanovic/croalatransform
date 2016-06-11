(: join Ovid's incipits with matching Vitezović's :)
(: use non-fuzzy search :)
(: for 3- 2- 1-word incipits :)
(: total time for full search : 346830.2 ms :)
let $map := map { 
"ovidfv2inc2": "vitezovicfv2inc2",
"ovidfv2inc1" : "vitezovicfv2inc1",
"ovidfv2inc3" : "vitezovicfv2inc3"
}
for $ovidc in map:keys($map)
let $tbody := element tbody {
for $ovid in collection($ovidc)//tr
let $vitezovic := collection(map:get($map,$ovidc))//tr
where $ovid/td[1][text() contains text { $vitezovic/td[1]/text() }]
order by $ovid/td[1]
return element tr {
  $ovid/td[1],
  $ovid/td[2],
  $vitezovic[td[1][text() contains text { $ovid/td[1]/text() } ]]/td[2]
}
}
let $filename := "/home/neven/rad/ritter/reports/" || $ovidc || "-vitezovic-incipit.xml"
return file:write($filename, $tbody)