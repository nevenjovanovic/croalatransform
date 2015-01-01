(: address to which we are sending the queries :)
let $url := ("http://www.perseus.tufts.edu/hopper/CTS?request=GetPassage&amp;urn=CITAT")
(: convert string into sequence :)

for $rijeci in //*:milestone[contains(@corresp,'urn:cts:greekLit:tlg0032.tlg002.perseus-grc1:2.1.3')]
let $hrv := normalize-space($rijeci/following-sibling::text()[1])
(: for each item in sequence :)
let $r := (doc(replace($url, 'CITAT',data($rijeci/@corresp))))
return element n { $r//*:p , element p { $rijeci, $hrv } }
