declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare copy-namespaces no-preserve, inherit;
for $i in //tei:div/tei:div[not(@xml:lang="hrv")]
return element bibl {  
attribute xml:id { concat("ritter.r3461.epist.", count($i/preceding-sibling::tei:div) + 1)},
attribute ana { "analytic" },
element author { 
element ref {
attribute target {"vitezov01"},
"Vitezović Ritter, Pavao" }
},
element title { attribute xml:lang {"lat"} , translate($i/tei:head/text()[1], ')(', '')} , 
element title { attribute type {"incipit"} , translate(string-join($i/tei:l[1]/text(),''), ')(', '') },
element date { 
attribute notBefore { "1682" } , 
attribute notAfter {"1684" } , 
attribute period { "http://semium.org/time/16xx_3_third"} , "1682-1684" },
element extent { attribute n { "stih" } , count($i//tei:l)},
element note { attribute type { "genus" } , "latinski stihovi" } ,
element note { attribute type { "genus" } , "poezija.poslanica" } ,
element note { attribute type { "metrum" } , "elegiacum" } ,
element note { attribute type { "status" } , "rukopis" } ,
element note { attribute type { "status" } , "kritičko izdanje" } ,
element note { attribute type { "status" } , "digitalno - datoteka" } ,
element relatedItem {
attribute type { "ms" } , 
element ref { attribute type {"croalabib"} ,
attribute target {"hr-zg-nsk-r3461"} ,
"NSK R3461" }
},
element relatedItem {
attribute type { "croala.typ" } , 
element ref { attribute type {"croalabib"} ,
attribute target {"morettiposlanicerittera2014"} ,
"Moretti 2014 (doktorat)" }
}
}