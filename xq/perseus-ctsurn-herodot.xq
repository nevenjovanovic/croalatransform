(: address to which we are sending the queries :)
let $url := ("http://www.perseus.tufts.edu/hopper/CTS?request=GetPassage&amp;urn=CITAT")
(: convert string into sequence :)

for $rijeci in //*:p[@corresp='urn:cts:greekLit:tlg0032.tlg007.perseus-grc1:1.2.2']
(: for each item in sequence :)
let $r := (doc(replace($url, 'CITAT',data($rijeci/@corresp))))
return element n { element p {normalize-space(string-join($r//*:p//text(), ' '))} , element p { normalize-space(string-join($rijeci//text(), ' ')) } }
