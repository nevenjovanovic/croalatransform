element tbody { let $n := collection("imena")
let $latty := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=alatyr&amp;word=REPLACE"
let $croala := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=croala&amp;word=REPLACE"
for $a in $n//*:name/text()
let $wcount := ft:count(collection("latty")//*:text//text()[. contains text {$a}])
return 
element tr {
  element td { 
  if ($a[@n]) then element nom {attribute class {$a/@n}, data($a) }
else if ($a[not(@n)]) then $a
else()
   } ,
  element td { $wcount },
  element td { 
  if ($wcount > 1) then
  count(collection("latty")//*:text//text()[. contains text {$a}])
  else if ($wcount = 1) then "1"
else() },
  element td { element a { attribute href { replace($latty, 'REPLACE', $a ) }, $a } },
  element td { element a { attribute href { replace($croala, 'REPLACE', $a ) }, $a },
  element td { ft:count(collection("croala")//*:text//text()[. contains text {$a}]) } }
}}