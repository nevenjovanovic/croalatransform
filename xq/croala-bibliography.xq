declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: convert @nrefs values to sequences :)
declare function croala:str
  ( $c )  {
    normalize-space(string-join($c, ''))
  };
declare %updating function croala:wr ($node) { 
  replace node collection("croala-philo-bib")/*:m with $node
 };

croala:wr(
  element m {
for $file in collection("croala")
let $head := $file/descendant::tei:teiHeader
let $title := croala:str($head/*:fileDesc/*:titleStmt/*:title[1]/descendant::text())
let $xpauthors := croala:str($head/tei:fileDesc/tei:titleStmt/tei:author/((tei:name union tei:persName union tei:orgName union tei:ref))/descendant::text())
let $xpauthordates := normalize-space(string-join($head/tei:fileDesc/tei:titleStmt/tei:author/tei:date/descendant::text(), '; '))
let $xppubplaces := normalize-space(string-join($head/tei:profileDesc[1]/tei:creation/((tei:placeName union tei:name))/descendant::text(), '; '))
let $year := substring($head/*:profileDesc[1]/*:creation/*:date[1]/((@*[1])), 1, 4)
let $createdate := $head/*:profileDesc[1]/*:creation/*:date[1]/((@when union @from union @notBefore union @notAfter))
let $extent := replace($head/*:fileDesc/*:extent, 'Mg:[A-Z]?','')
let $xpeditors := $head/tei:fileDesc/tei:titleStmt/tei:editor/descendant::text()
let $xpgenre := string-join($head/tei:profileDesc[1]/tei:textClass/tei:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#gen01")]/tei:term//text(), '; ')
let $xpkeywords := $head/tei:profileDesc[1]/tei:textClass/tei:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#typ01")]/tei:term
let $xpperiod := $head/tei:profileDesc[1]/tei:textClass/tei:keywords[(@scheme = "biblio/croala-catalogus-aetatum.xml#aet01")]/tei:term
let $size := file:size(string-join(('/home/neven/rad/croala-r/basex/',substring(document-uri($file), 7)),''))
let $xpdocid := replace($head//tei:fileDesc/@xml:id, '-', '')

 order by fn:string($createdate[1]), fn:string($xpauthors), string-join($title, ' ')
return 
element tr { 
attribute date {current-dateTime()} ,
(element item { (fn:normalize-space(string-join($title, ' '))) }, 
element item { (fn:data($xpauthors)) }, 
element item { (fn:data($year)) }, 
element item { (fn:data($xpgenre)) }, 
element item { () },
element item { (fn:data($xppubplaces)) }, 
element item { (normalize-space(data($extent))) }, 
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
element item {(attribute class { ("filename")}), data(substring(document-uri($file), 8))}, 
element item {(attribute class { ("filesize")}, data($size))}, 
element item {(attribute class { ("philodocid")}) })
 }
}
)