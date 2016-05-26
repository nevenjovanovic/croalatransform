(: find random matching three-word unique clausulae in pdill and croala / renaissance :)
(: return count of repetitions, ids of nodes in dbs :)
for $n in 1 to 1037
let $rnd := random:integer(396040) + 1
let $c := collection("pdillfvuniq3")/claus/*:tr[$rnd]
let $match := db:text("croalafvrenuniq3", $c/td[1])
let $matchid2 := db:node-id($match/../../td[3])
return if ($match) then
file:append("/home/neven/rad/croala-r/pdill-croalaren-uniq-3-rnd.html",
 element tr { 
$c/td[1] , 
$c/td[3] ,
db:open-id("croalafvrenuniq3", $matchid2)
 })
else()
