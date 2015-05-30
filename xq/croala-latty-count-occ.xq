let $dbb := element db { 
for $i in collection("latty")//*:div[not(descendant::*:div)]
return element div {
attribute nodeid { db:node-pre($i) },

let $wl := ft:tokenize($i)
for $dv in distinct-values($wl)
let $count := count($wl[. = $dv])
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
return file:write("/home/neven/rad/croala-r/lattyocc.xml",$dbb)