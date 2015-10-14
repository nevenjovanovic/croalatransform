let $imena :=
element list {
for $i in collection("croalabib")//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:persName[text()] order by $i  collation "?lang=hr"
return 
element person {
  attribute xml:id { "croala.drama." || db:node-id($i)},
element persName { replace(replace(data($i), '\n', ' '), ' +', ' ') }
}
}
return $imena//person
            [index-of($imena//persName, 
                      persName
                     )
                      [1]
            ]
