for $aref in //*:person[*:persName[contains(text(), 'Panon')]]/@xml:id
let $elem := (//*:biblStruct)|(//*:bibl)|(//*:msDesc)
return $elem[descendant::*:ref[@target[. eq $aref]]]