declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:ime ($imena) {
  collection("croala")//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author[tei:name/text()=$imena]
};

for $imena in
let $a := for $i in //tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author/(tei:name|tei:persName)
return $i
order by $a/*
return distinct-values($a)
order by $imena collation "?lang=hr"
return element textgroup {
  attribute projid {"croala:cal" || data(croala:ime($imena)/@key)[1] },
element groupname {
  attribute xml:lang {"hrv"}, 
  $imena
},
for $i in croala:ime($imena)/ancestor::tei:fileDesc/@xml:id
return
element work {
  attribute projid {"croala:" || data($i)},
  attribute xml:lang {"lat"},
element title {
  attribute xml:lang {"lat"}
},
element edition {
    attribute projid {"croala:croala-lat1"},
    element label {},
    element description {},
    element online {
      attribute docname {"/db/repository/croala/"},
      element validate {
        attribute schema {"tei_all.xsd"},
        element namespaceMapping {
          attribute validation {"tei"},
          attribute nsURI {"http://www.tei-c.org/ns/1.0"}
        },
        element citationMapping {
          element citation {}
        }
      }
    }
}
}
}