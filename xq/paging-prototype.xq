(: paging prototype :)
let $test := 
<test>
<a>2</a>
<a>1</a>
<a>10</a>
<a>5</a>
<a>6</a>
<a>2</a>
<a>1</a>
<a>10</a>
<a>1</a>
<a>5</a>
<a>1</a>
<a>10</a>
<a>5</a>
<a>6</a>
</test>
let $setp := 1
(: how many results on a page :)
let $set1 := ($setp to $setp + 4)
let $remainder := count($test/a) - $set1[last()]
let $result := for $set in $set1
return $test/a[$set]
return element div { 
element p { "Displaying results " || $set1[1] || " to " || $set1[last()] || " of " || count($test/a) || "." } , $result ,
(: Bootstrap for pagination :)
element ul {
  attribute class { "pagination" } ,
  if (count($test/a) mod 5 = 0) then
  for $n in $setp to xs:integer(count($test/a) div 5)
  return element li { 
  element a { attribute href { "http://croala.ffzg.unizg.hr/basex/operumtabula/" || $n } , $n } }
  else
  for $n in $setp to xs:integer(count($test/a) div 5 + 1)
  return element li { 
  element a { attribute href { "http://croala.ffzg.unizg.hr/basex/operumtabula/" || $n } , $n } }
}
}