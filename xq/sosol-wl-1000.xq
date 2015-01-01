(: address to which we are sending the queries :)
let $url := ("http://services.perseids.org/bsp/morphologyservice/analysis/word?word=RIJEC&amp;lang=lat&amp;engine=morpheuslat")
(: convert string into sequence :)
let $rijeci := doc('/home/neven/rad/2014-06-24-croala-wlist-1000.xml')

(: for each item in sequence :)
for $r in $rijeci//*:lem
let $parsed := (doc(replace($url,'RIJEC',$r/*:v)))
return 
if (not(exists($parsed//*:Body[position()>1]))) then
element lemma { element w {data($r/*:v)} , 
element n {data($r/*:f)},
element uri {data($parsed//*:Body[1]//*:entry[1]/@uri)} , element l {data($parsed//*:hdwd)} }
else()