declare default element namespace "http://alpheios.net/namespaces/aligned-text";
(: from many aligned files create one :)
element aligned-text { 
element language { attribute lnum {"L1"} , attribute xml:lang {"lat"} } ,
element language { attribute lnum {"L2"} , attribute xml:lang {"grc"} } ,
for $i at $n in //*:sentence
return element sentence { attribute document_id {"actap17"} , attribute id {$n} , $i/*:wds } }