declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare copy-namespaces no-preserve, inherit;
for $ext in //*:fileDesc/*:extent
let $mg := $ext/@ana
group by $mg
return <e>{$mg, ' ', count($ext)}</e>