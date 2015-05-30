(: find divs with more than 300 types :)
(: sort types in them by occurrences :)
(: return three most frequent types :)
for $i in //div[count(*:w) > 300]
let $sorted := 
for $w in $i/w
order by $w/n descending
return $w
return element d {
  $i/@nodeid , 
  $sorted[position() < 4]
}

