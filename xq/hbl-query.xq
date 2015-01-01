(: address to which we are sending the queries :)
let $url := ("http://hbl.lzmk.hr/clanak.aspx?id=BROJ")
(: for each item in sequence :)
for $i in (1 to 3, 5, 8 to 9)
let $parsed := (doc(replace($url, 'BROJ', string($i))))
return element lemma { $parsed//*:div[@class='clanak']//*:div[@class='tekst'] }