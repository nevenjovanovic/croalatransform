(: address to which we are sending the queries :)
let $url := ("http://services.perseids.org/bsp/morphologyservice/analysis/word?word=RIJEC&amp;lang=lat&amp;engine=morpheuslat")
(: convert string into sequence :)
let $rijeci := doc('/home/neven/rad/croala-r/wl-basex/wl-severitan-ip-feretr.xml')

(: for each item in sequence :)
for $r in $rijeci//*:w[position() lt 90]/@word
let $parsed := (doc(replace($url,'RIJEC',$r)))
return element lemma { element w {data($r)} , element l {data($parsed//*:hdwd)} }