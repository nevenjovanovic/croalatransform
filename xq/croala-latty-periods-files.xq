(: find all texts in certain period, prototype :)
let $period := "15xx_3_third"
let $db := "latty"
let $docsper := 
  for $doc in collection($db)/*:TEI[descendant::*:profileDesc[1]/*:creation/*:date/@period=$period]
  return element li { 
  element a { 
  attribute href {"http://solr.ffzg.hr/basex/node/" || $db || "/" || db:node-pre($doc) } ,
  db:path($doc) }
}
return element tr { 
element td { count($docsper) } ,
element td { $docsper } }