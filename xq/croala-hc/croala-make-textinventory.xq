(: create cts textinventory from citation db :)
(: for textgroup, work, edition :)
for $r in collection("hccroala-citation")//*:online
let $urn := replace($r/@urn, "\.[^.]+\.croala-op:","")
group by $urn
return element textgroup { attribute urn { $urn || ":" } ,
element groupname {
  attribute xml:lang {"hrv"},
  distinct-values(for $groupname in $r/@docname
  return if (db:open("hc-croala0", $groupname)) then 
  for $a in db:open("hc-croala0", $groupname)//*:teiHeader/*:fileDesc/*:titleStmt/*:author
  return normalize-space($a)
  else())
} ,
for $work in $r[starts-with(@urn, $urn)]
let $workdoc := db:open("hc-croala0", $work/@docname)//*:teiHeader/*:fileDesc/*:titleStmt
let $workpubstatement := db:open("hc-croala0", $work/@docname)//*:teiHeader/*:fileDesc/*:publicationStmt
return element work { attribute urn { replace($work/@urn, "\.croala-op:",":") },
attribute xml:lang {"lat"} ,
element title {
  attribute xml:lang {"lat"} ,
  normalize-space(data($workdoc/*:title)) } ,
  element edition {
    $work/@urn ,
    element label {
      attribute xml:lang { "lat"} , 
      for $e in $workdoc/*:editor return "Edidit: " || normalize-space(data($e)) || ". "
    },
    element description {
      attribute xml:lang {"hrv"},
      "Podatak o izdanju: " || normalize-space($workpubstatement)
    },
    element online {}
  }
} }
