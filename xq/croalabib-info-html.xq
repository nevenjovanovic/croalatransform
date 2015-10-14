(: return some basic info on a db as csv :)
(: result - table displaying name,documents count,timestamp :)
let $info :=
element record { db:info("croalabib")//*:databaseproperties/* }
let $infomap := map { 0 :  element db { data($info/name) } ,
1 : element documenta { data($info/documents) } ,
2 :  element dd { data($info/timestamp) } }
let $infostring :=
  map:for-each(
  $infomap,
  function($a, $b) { 
  element tr { 
    element td { node-name($b) } , 
    element td { element code {$b} }
  } }
)
return $infostring