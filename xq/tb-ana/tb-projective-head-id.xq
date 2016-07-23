(: get heads and ids from words :)
(: count words with heads lesser than ids :)
for $wds in //*:word[@id and @head]
let $sentid := db:node-id($wds/parent::*:sentence)
let $i := $wds/@head
let $j := $wds/@id
where $i < $j
let $between := $wds/preceding-sibling::*:word[@id < $j and @head > $j]
return count($between)