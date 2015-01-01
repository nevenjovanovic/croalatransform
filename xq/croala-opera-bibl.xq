declare default element namespace "http://www.tei-c.org/ns/1.0";
element listBibl {
for $c in //*:TEI[descendant::*:fileDesc[@xml:id="natalis-f-paladino"]]//*:div[contains(@type,"poesis")]
return 
element bibl {
  attribute xml:id { concat("croala.opera.bozic01.epigramma." , random:integer(999999) ) } ,
element author { element ref { attribute target {"bozic01"} , "Božićević Natalis, Frano" } } ,
element title { data($c/*:head) } , 
element title { attribute type { "incipit" } , data($c/*:l[1]) } , 
element extent { count($c/*:l) } ,
element note { attribute type {"genus"} , data($c/@type) } , 
element note { attribute type {"metrum"} , data($c/@met) } ,
element relatedItem {
attribute type {"croala.typ"} , 
element ref { attribute target {"paladinic2005graciotti"} , "Graciotti, Roma 2005, s. 181" } },
element relatedItem {
attribute type {"croala.internet"} , 
element ref { attribute target {"natalis-f-paladino"} , 
attribute type {"croala"} ,
"CroALa" } }
}
}