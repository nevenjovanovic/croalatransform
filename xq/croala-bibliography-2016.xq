(: croala bibliography for philologic :)
(: can be used for producing rdf :)
declare namespace tei = "http://www.tei-c.org/ns/1.0";

element m { 
let $collection := "croala0"
for $file in collection($collection)
let $head := $file/descendant::tei:teiHeader
let $title := normalize-space(string-join($head/*:fileDesc/*:titleStmt/*:title[1]/descendant::text(), ''))
let $xpauthors := normalize-space(string-join($head/tei:fileDesc/tei:titleStmt/tei:author/((tei:name union tei:persName union tei:orgName union tei:ref))/descendant::text(), "; "))
let $xpauthordates := normalize-space(string-join($head/tei:fileDesc/tei:titleStmt/tei:author/tei:date/descendant::text(), '; '))
let $xppubplaces := normalize-space(string-join($head/tei:profileDesc[1]/tei:creation/((tei:placeName union tei:name))/descendant::text(), '; '))
let $year := substring($head/*:profileDesc[1]/*:creation/*:date[1]/((@*[1])), 1, 4)
let $createdate := $head/*:profileDesc[1]/*:creation/*:date[1]/((@when union @from union @notBefore union @notAfter))
let $extent := $head/*:fileDesc/*:extent
let $xpeditors := data($head/tei:fileDesc/tei:titleStmt/tei:editor)
let $xpgenre := string-join($head/tei:profileDesc/tei:textClass/tei:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#gen01")]/tei:term//text(), '; ')
let $xpkeywords := $head/tei:profileDesc/tei:textClass/tei:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#typ01")]/tei:term
let $xpperiod := $head/tei:profileDesc/tei:textClass/tei:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#aet01")]/tei:term
let $size := file:size(string-join(('/home/neven/rad/croala-r/basex/txts/',substring(document-uri($file), 8)),''))
let $xpdocid := replace($head//tei:fileDesc/@xml:id, '-', '')

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
element item { (attribute class { ("collection") }, "croala" ) }, 
element item { () }, 
element item { () }, 
element item { (fn:data($xpperiod)) }, 
element item {(attribute class { ("docid")}), data($xpdocid)}, 
element item {(attribute class { ("filename")}), data(substring(document-uri($file), 9))}, 
element item {(attribute class { ("filesize")}, data($size))}, 
element item {(attribute class { ("philodocid")}) })
 }
}