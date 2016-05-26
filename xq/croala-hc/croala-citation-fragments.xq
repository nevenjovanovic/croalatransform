for $f in //*:TEI
let $name := db:path($f)
let $urnname := replace(
  replace($name, "([a-z]+-[a-z])-", "$1."), ".xml", ".croala-op:")
order by $name
return element online {
  attribute type {"xml"},
  attribute urn { "urn:cts:croala:" || $urnname } ,
  attribute docname { $name },
  element namespaceMapping {
    attribute abbreviation {"tei"},
    attribute nsURI {"http://www.tei-c.org/ns/1.0"}
  },
  element citationMapping {
    for $cits in $f//*:encodingDesc/*:refsDecl/*:cRefPattern
    return
    element citation {
      attribute label { data($cits/@matchPattern) },
      attribute scope { data($cits/@replacementPattern)},
      attribute xpath { substring-after($cits/@replacementPattern, "/tei:TEI/tei:text/tei:body/tei:div")}
    }
  }
}