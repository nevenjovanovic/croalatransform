(: get info on elements used as descendants of text :)
(: express info as tagsDecl elements :)
(: insert into teiHeader after fileDesc :)
(: update db :)
declare default element namespace "http://www.tei-c.org/ns/1.0";
for $t in collection("croala0")//*:TEI
let $encoding := element tagsDecl {
  element namespace {
    attribute name { "http://www.tei-c.org/ns/1.0"} ,
  for $e in distinct-values($t//*/name())
  order by $e
  return element tagUsage { 
  attribute gi { $e } ,
  let $oc := $t//*[name()=$e]
  return attribute occurs { count($oc) } ,
  let $id := $t//*[name()=$e and @xml:id]
  return if ($id) then attribute withId { count($id)}
  else()
}
}
}

return if ($t//*:encodingDesc/*:tagsDecl) then replace node $t//*:encodingDesc/*:tagsDecl with $encoding
else if ($t//*:encodingDesc[not(*:tagsDecl)]) then insert node $encoding as last into $t//*:encodingDesc
else insert node element encodingDesc { $encoding } after $t//*:teiHeader/*:fileDesc