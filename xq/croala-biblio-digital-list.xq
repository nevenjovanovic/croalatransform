(: list all records for CroALa XML :)
declare namespace tei = 'http://www.tei-c.org/ns/1.0';
declare function local:croalabiblist(){
  for $r in collection("croalabib")//tei:listBibl[@type="croala.libri.digital"]/tei:bibl
return 
element tr { 
element td { 
element span { 
attribute class {"bibline"} ,
for $a in $r/tei:author return $a } ,
element span { 
attribute class {"bibline"} ,
for $t in $r/tei:title return $t },
element span { 
attribute class {"bibline"} ,
element b { "E: "},
for $e in $r/tei:editor return $e },
element span { 
attribute class {"bibline"} ,
for $i in $r/tei:relatedItem return $i }
}
 }
};
let $bib :=
element tbody {
local:croalabiblist()
}
return $bib