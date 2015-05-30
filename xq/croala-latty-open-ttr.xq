(: return links to all nodes with certain ttr in two db's :)
let $v := "0.75"
for $d in collection("cl-idx")//d
where $d/ttr[.=$v]
order by $d/aet
return element tr { 
  element td {
    attribute class { data($d/db) } ,
    $d/db } ,
 element td {
 element a {
  attribute href { "http://solr.ffzg.hr/basex/node/" || data($d/db) || "/" || data($d/node) } 
} },
 element td {
  $d/path } ,
 element td {
  $d/aet },
 element td {
  $d/gen }
}