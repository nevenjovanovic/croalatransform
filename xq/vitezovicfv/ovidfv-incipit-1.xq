(: return single words at the end of Vitezović's lines :)
(: group by repetitions, most of them first :)
(: keep as interesting string-length n > 6 :)
(: for Ovid, creates 1811 rows :)
import module namespace vit = "http://croala.ffzg.unizg.hr/vit" at "../../plutonbasex/repo/vitezovic.xqm";
declare variable $maincollection := "ovid-pdl2";
declare variable $collection := "ovidfv2";
declare variable $dbname := "ovidfv2inc1";
declare variable $dbdocname := "ovidincipit1.xml";
let $cl3 := element claus {
for $aa in 
for $e in collection($collection)//*:v
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@vid ,
$e/@target ,
ft:tokenize($e)[1] }
else()
where string-length($aa) > 6
order by $aa
return $aa
}
let $tbody := element tbody {
for $clausula in $cl3//c
let $text := $clausula/text()
group by $text
order by $text
return element tr {
element td { $text } ,
element td { 
  for $id in $clausula/@vid 
  let $nodeid := data($id)
  return element a { vit:localnode($maincollection,$nodeid) , $nodeid } }
}
}
return db:create($dbname, $tbody , $dbdocname, map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })