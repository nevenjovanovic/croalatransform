declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare copy-namespaces no-preserve, inherit;
let $a := for $ext in //tei:TEI[descendant::*:textClass/*:keywords[@scheme='biblio/croala-catalogus-aetatum.xml#aet01'][*:term[1] contains text 'Litterae medii aevi (700-1400)']]//*:text//text()
return tokenize(translate($ext, '0123456789',''),'\W+')
return count($a)