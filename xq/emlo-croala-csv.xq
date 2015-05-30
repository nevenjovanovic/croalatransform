declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: if there is something, return; else empty element :)
declare function croala:ifis
  ( $c )  {
    if ($c) then $c
    else <empty/>
    
  };

let $xml := element csv { 
for $pismo in collection("croala")//*:profileDesc[*:textClass/*:keywords[@scheme="genre"]/*:term[contains(.,"epist")] and *:settingDesc and @xml:id]
let $pismoid := data($pismo/@xml:id)
let $textnode := db:node-pre($pismo/ancestor::*:TEI//*:div[@corresp="#" || $pismoid])
let $orig := $pismo/*:settingDesc/*:place[@ana='origin']
let $destin := $pismo/*:settingDesc/*:place[@ana='destination']
let $sender := $pismo/*:particDesc/*:person[@*='sender']
let $recipient := $pismo/*:particDesc/*:person[@*='recipient']
let $creation := element d { data($pismo/*:creation/*:date/@when) }
let $repo := $pismo/preceding-sibling::*:fileDesc/*:sourceDesc/*:bibl[@type='repo']
return element record {
  element f { db:path($pismo)},
  element ep { db:node-pre($pismo)},
  element link { "http://solr.ffzg.hr/basex/node/croala/" || $textnode },
  croala:ifis($orig/*:placeName), 
  croala:ifis($destin/*:placeName),
  croala:ifis($sender/*:persName),
  croala:ifis($recipient/*:persName),
  croala:ifis($creation),
  $repo
}
}
return csv:serialize($xml)