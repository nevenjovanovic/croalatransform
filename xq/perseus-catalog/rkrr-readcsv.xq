(: read local csv with names, URLs and MADS file names :)
let $text := file:read-text('/home/neven/rad/rkrr-autori.csv')
let $csv := csv:parse($text, map { 'header': true() })
for $mads in $csv//*:mads
let $address := for $a in db:open("perscat-mads")/*
return db:path($a)[matches(.,$mads)]
for $adr in $address[contains(.,"mads.xml")]
order by $adr
return element author { db:open("perscat-mads",$adr)//(*:authority|*:namePart[@type="date"]) }