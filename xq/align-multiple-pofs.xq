(: show words which have multiple pos identifications :)
(: identify them by node id :)
(: give the whole line for easier disambiguation :)
for $i in //*:word[*:alt]
where $i/*:alt[last() gt 1]
let $c := count($i/*:alt)
order by $c
return element p {  attribute id { db:node-id($i)} ,
attribute n {$c} ,
string-join($i/ancestor::*:wds/*:w//*:text, ' ') ,
out:nl() ,
$i
 }