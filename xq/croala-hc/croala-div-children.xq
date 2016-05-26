(: list children of divs for text inventory :)
(: construct their paths, insert into encodingDesc :)
(: as refsDecl :)
(: here is a list of names we will use :)
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare variable $dict := map { "p" : "paragraphus" , "l" : "versus" , "head" : "titulus" , "closer" : "explicit" , "opener" : "incipit" , "note" : "nota" , "signed" : "signatum" , "postscript": "postscriptum" , "docAuthor" : "auctor" , "byline" : "inscriptio" , "lg" : "stropha" , "epigraph" : "epigraphus" , "sp" :  "didascalia" , "salute" : "salutatio" , "dateline" : "datum" , "list" : "indiculus" , "trailer" : "colophon" , "quote" : "citatio", "argument" : "argumentum" };
for $doc in //*:TEI
for $f in $doc//*:text/*:body/*:div
let $notel := ("pb", "milestone", "gap")
let $refs := element refsDecl { 
attribute xml:base {"http://croala.ffzg.unizg.hr/opera/urn:cts:croala"} ,
attribute xml:id {db:path($f)} ,
attribute ana {"croala:cts"} ,
for $e in distinct-values($f/*/name()[not(.=$notel)]) 
return element cRefPattern { 
attribute matchPattern { map:get($dict, $e) },
attribute replacementPattern { "/tei:TEI/tei:text/tei:body/tei:div/tei:" || $e || "[@n='?']"} ,
element p { "This pattern references " || $e || " of the text in CTS." }
}
}
return insert node $refs as first into $doc//*:encodingDesc