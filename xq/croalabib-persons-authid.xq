declare variable $aid as map(*) := map {
  "viaf": "http://viaf.org/viaf/",
  "pnd": "http://d-nb.info/gnd/",
  "lc": "http://id.loc.gov/authorities/names/",
  "cerl": "http://thesaurus.cerl.org/record/",
  "croala.typ": "#"
};
for $i in collection("croalabib")//*:listPerson/*:person//*:bibl[@type="authorID"]/*:ref[@type]
return element a { attribute href { map:get($aid , $i/@type) || data($i/@target) } , data($i) }