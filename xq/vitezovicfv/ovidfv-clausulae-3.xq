(: return three words at the end of Ovid's lines :)
(: group by repetitions, most of them first :)
(: for Ovid :)
import module namespace vit = "http://croala.ffzg.unizg.hr/vit" at "../../plutonbasex/repo/vitezovic.xqm";
declare variable $maincollection := "ovid-pdl2";
declare variable $collection := "ovidfv2";
declare variable $dbname := "ovidfv2clau3";
declare variable $dbdocname := "ovidclausulae3.xml";
let $cl3 := element claus {
for $aa in 
for $e in collection($collection)//*:v
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@vid ,
$e/@target ,
ft:tokenize($e)[last() - 2] , ft:tokenize($e)[last() - 1] , ft:tokenize($e)[last()] }
else()
order by $aa
return $aa
}
let $tbody := element tbody {
for $clausula in $cl3//c
let $text := $clausula/text()
group by $text
order by count($clausula/@vid) descending , $text
return element tr {
element td { $text } ,
element td { 
  for $id in $clausula/@vid 
  let $nodeid := data($id)
  return element a { vit:localnode($maincollection,$nodeid),
  $nodeid } }
}
}
return db:create($dbname, $tbody , $dbdocname, map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })