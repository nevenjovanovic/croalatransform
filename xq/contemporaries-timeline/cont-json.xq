let $people := 
let $file := file:read-text("/home/neven/rad/rkrr/data_sample.js")
let $options := map { 'liberal': true() }
let $json := json:parse($file,$options)
return $json
let $ljudi := 
for $p in $people//*:json/*:people/*[@type="object"]
let $godina := $p/*[@type="number" and name()="to"]
where xs:integer($godina) < 0
return $p
return json:serialize(element people { $ljudi }, map { 'format': 'jsonml' })
