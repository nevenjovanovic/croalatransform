declare namespace tei = "http://www.tei-c.org/ns/1.0";
element m { 
for $file in collection("alatyr")
let $head := $file/descendant::*:teiHeader
let $title := normalize-space(string-join($head/*:fileDesc/*:titleStmt/*:title[1]/descendant::text(), ''))
let $xpauthors := normalize-space(string-join($head/*:fileDesc/*:titleStmt/*:author/descendant::text(), "; "))
let $xpauthordates := normalize-space(string-join($head/*:fileDesc/*:titleStmt/*:author/*:date/descendant::text(), '; '))
let $xppubplaces := normalize-space(string-join($head/*:profileDesc/*:creation/((*:placeName union *:name))/descendant::text(), '; '))
let $year := substring($head/*:profileDesc/*:creation/*:date[1]/((@*[1])), 1, 4)
let $createdate := $head/*:profileDesc/*:creation/*:date[1]/((@when union @from union @notBefore union @notAfter))
let $extent := $head/*:fileDesc/*:extent
let $xpeditors := string-join(data($head/*:fileDesc/*:titleStmt/*:editor), '; ')
let $xpgenre := string-join($head/*:profileDesc/*:textClass/*:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#gen01")]/*:term//text(), '; ')
let $xpkeywords := $head/*:profileDesc/*:textClass/*:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#typ01")]/*:term
let $xpperiod := $head/*:profileDesc/*:textClass/*:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#aet01")]/*:term
let $size := file:size(string-join(('/home/neven/ownCloud/documents/tirol/alatyr/xml Texte/',substring(document-uri($file), 8)),''))
let $xpdocid := replace($head//*:fileDesc/@xml:id, '-', '')

 order by fn:string($createdate[1]), fn:string($xpauthors), string-join($title, ' ')
return 
element tr { 
(element item { (fn:normalize-space(string-join($title, ' '))) }, 
element item { (fn:data($xpauthors)) }, 
element item { (fn:data($year)) }, 
element item { (fn:data($xpgenre)) }, 
element item { () },
element item { (fn:data($xppubplaces)) }, 
element item { (fn:normalize-space(fn:data($extent))) }, 
element item { (fn:data($xpeditors)) }, 
element item { () }, 
element item { (fn:data($createdate)) }, 
element item { (fn:data($xpauthordates)) },
element item { (fn:data($xpkeywords)) }, 
element item { () }, 
element item { (attribute class { ("collection") }, "alatyr" ) }, 
element item { () }, 
element item { () }, 
element item { (fn:data($xpperiod)) }, 
element item {(attribute class { ("docid")}), data(substring-before(substring(document-uri($file), 8), ".xml"))}, 
element item {(attribute class { ("filename")}), data(substring(document-uri($file), 8))}, 
element item {(attribute class { ("filesize")}, data($size))}, 
element item {(attribute class { ("philodocid")}) })
 }
}