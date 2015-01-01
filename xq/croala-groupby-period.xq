declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare copy-namespaces no-preserve, inherit;
for $ext in //*:textClass/*:keywords[@scheme="biblio/croala-catalogus-aetatum.xml#typ01"]
let $mg := $ext/*:term[1]
group by $mg
return <e>{$mg, ' ', count($ext)}</e>