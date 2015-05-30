(: convert xml to json, single node-pre :)
declare option output:method "text";
let $j := element json {
  attribute objects { "json text divs wds d" } ,
  attribute numbers { "txtid dc wc nodeid vc"} ,
for $a in //text[db="latty"]
return 
$a }
return json:serialize($j)
