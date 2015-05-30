let $dbb := element db { 
for $i in collection("latty")//*:text[not(descendant::*:text)]
return element div {
attribute nodeid { db:node-pre($i) },

let $wl := ft:tokenize($i)
for $dv in distinct-values($wl)
let $count := ft:count($i//*[text() contains text {$dv}])
return
element w { 
element dbn { db:name($i) },
element fln { db:path($i) },
element v { $dv },
element n {
$count
}
}
}
}
return $dbb
(: file:write("/home/neven/rad/croala-r/lattyocc.xml",$dbb) :)