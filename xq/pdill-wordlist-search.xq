for $a in //*:TEI//*:text
for $w in ("altil.*" , "angui.*", "angue.*" , "aratri.*", "aratru.*", "aratro.*", "arie.*")
let $b := ft:count($a//*:l[text() contains text {$w} using wildcards ])
where $b ne 0
return element r { $w , db:path($a) , $b }