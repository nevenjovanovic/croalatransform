(: replace R's NO with URN :)
for $adr in //*:p[@style-name="P1"]
let $urn := replace(replace(replace($adr, "NO\[", "www.neulatein.de/words/"),":", "/"),"\]",".htm")
return replace value of node $adr with $urn