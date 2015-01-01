for $i in //*:teiHeader
order by $i/*:fileDesc/@xml:id
return element bibl { attribute xml:id { $i/*:fileDesc/@xml:id } ,
(: autora može biti više :)
  for $a in $i/*:fileDesc/*:titleStmt/*:author
  return element author { element ref { attribute target { $a/@key } ,
           string-join($a//(*:name|*:persName), ' ') } 
} ,
(: izdavača može biti više :)
  for $e in $i/*:fileDesc/*:titleStmt/*:editor
  return element editor { element ref { data($e) }
},
(: naslov :)
element title { 
element ref { data($i/*:fileDesc/*:titleStmt/*:title[1]) } } ,
(: mjesto izdanja, uvijek isto :)
element pubPlace { "Zagreb" } ,
element publisher { $i/*:fileDesc/*:publicationStmt/*:p[1]/text() } ,
(: datum digitalnog izdanja :)
element date { 
attribute when { replace($i/*:fileDesc/*:publicationStmt/*:p[1]/*:date[1], '[^0-9]' , '') } ,
replace(data($i/*:fileDesc/*:publicationStmt/*:p[1]/*:date[1]), '[^0-9]', '')
} ,
(: poveznica na datoteku na internetu :)
element relatedItem { attribute type { "internet" }, 
element ref { attribute type { "croala" } , attribute target { $i/*:fileDesc/@xml:id } , "CroALa" }
}
 }