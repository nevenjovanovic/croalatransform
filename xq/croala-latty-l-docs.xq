(: count verses in documents :)
for $coll in ("latty", "croala")
let $doccount := count(collection($coll)/*)
let $ldoc := for $i in collection($coll)/*
let $n := $i//*:text[not(descendant::*:text)]//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
where count($n) > 0
order by count($n) descending
return element ln { 
attribute c { $coll } ,
attribute nodid { db:node-pre($i)},
db:path($i) || ": " ||
count($n) }
return element {$coll} { 
element count { "Total: " || $doccount } ,
element pcount { "Having verses: " || count($ldoc) } ,
$ldoc
 }