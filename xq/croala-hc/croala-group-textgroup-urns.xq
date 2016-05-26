let $cat := doc("/home/neven/rad/croala-r/hc-croala/cts-inv-1/hccroala-citation.xml")
for $g in $cat//*:online
let $urn := replace($g/@urn, "\.[^.]+\.croala-op:","")
group by $urn
return $urn