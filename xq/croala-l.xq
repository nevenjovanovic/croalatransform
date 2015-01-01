declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare copy-namespaces no-preserve, inherit;
element div {
for $i in //tei:l
return element l {  
attribute id {generate-id($i)} ,
translate(string-join(data($i//text()[not(ancestor::*:note)]), ' '), '0123456789','')
}
}