declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare option output:method "html";
element body {
  
element table { 
element thead {
    element tr {
      element th {"Opus"},
      element th {"CatNum"},
      element th {"CatCod"},
      element th {"Cat"}
    }
  } ,
  for $i in (//*:biblStruct|//*:bibl)[descendant::*:note[contains(@target,'gen.b2')]]
let $id := $i/@xml:id
let $solr := "http://solr.ffzg.hr/basex/rest/croalabib?query=//*[@xml:id='REPLACE_S']&amp;wrap=yes"
order by count($i//tei:note[contains(@target,'gen.b2')]/@target) , $id
return element tr { element td { element a { attribute href {replace($solr,'REPLACE_S',data($id))},  data($id) } } , 
element td { count($i//tei:note[contains(@target,'gen.b2')]/@target)} ,
element td { data($i//tei:note[contains(@target,'gen.b2')]/@target) } , element td { data($i//tei:note[contains(@target,'gen.b2')]) } } }}