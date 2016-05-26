(: modul za antiturske funkcije :)
module namespace antitur = 'http://croala.ffzg.unizg.hr/antiturcica';
(: autori / godine :)
declare function antitur:auctorannus(){
let $cesti := element a {
let $a := collection("croantiturcica")//*:record/*:Autor
return $a[index-of($a,.)[2]]
}
for $r in collection("croantiturcica")//*:record
let $adr := "croala.antitur." || db:node-id($r)
where $r/*:Autor=$cesti//Autor
order by $r/Autor collation "?lang=hr"
return element tr {
  element td { element a { 
  attribute href { "http://solr.ffzg.hr/basex/antiturcica/" || $adr },
  $adr } },
  element td { $r/Autor } ,
  element td { $r/Datum }
}
};

(: žanrovi / godine :)
declare function antitur:generannus(){
let $cesti := element a {
let $a := collection("croantiturcica")//*:record/*:Vrsta
return $a[index-of($a,.)[2]]
}
for $r in collection("croantiturcica")//*:record
let $adr := "croala.antitur." || db:node-id($r)
where $r/*:Vrsta=$cesti//Vrsta
order by $r/Vrsta  collation "?lang=hr"
return element tr {
  element td { element a { 
  attribute href { "http://solr.ffzg.hr/basex/antiturcica/" || $adr },
  $adr } },
  element td { $r/Vrsta } ,
  element td { $r/Datum }
}
};

(: žanrovi / jezici :)
declare function antitur:generaling(){
for $r in collection("croantiturcica")//*:record
let $adr := "croala.antitur." || db:node-id($r)
order by $r/Vrsta  collation "?lang=hr" , $r/Datum
return element tr {
  element td { element a { 
  attribute href { "http://solr.ffzg.hr/basex/antiturcica/" || $adr },
  $adr } },
  element td { $r/Vrsta } ,
  element td {$r/Datum},
  element td { $r/J }
}
};

declare function antitur:record($adr){
  (: call and display whole record from croantiturcica :)
  let $recordnode := xs:integer(replace($adr,'croala.antitur.',''))
let $record := db:open-id("croantiturcica",$recordnode)
let $izostavi := ("Godina", "Izr.")
return element div { 
attribute class { "row"},
for $red in $record/*[not(name()=$izostavi)] return element div { 
attribute class { "col-md-3"},
$red 
}
 }
};

declare function antitur:sinergija(){
  (: antitur-sinergija - show authors writing in years :)
let $a := 1435 to 1601
return 
for $n in $a 
let $r := collection("croantiturcica")//*:record[matches(Godina, xs:string($n))]
return element tr { 
element td { $n },
if ($r) then element td { 
for $aut in $r/*:Autor 
let $adr := "croala.antitur." || db:node-id($aut/..)
return element p { 
element a { 
  attribute href { "http://solr.ffzg.hr/basex/antiturcica/" || $adr }, $aut }
} } 
else element td { "-----------" }  }

};

declare function antitur:syngenera(){
  (: antitur-syngenera - show genres of texts in years :)
let $a := 1435 to 1601
return 
for $n in $a 
let $r := collection("croantiturcica")//*:record[matches(Godina, xs:string($n))]
return element tr { 
element td { $n },
if ($r) then element td { 
for $gen in $r/*:Vrsta 
let $adr := "croala.antitur." || db:node-id($gen/..)
return element p { 
element a { 
  attribute href { "http://solr.ffzg.hr/basex/antiturcica/" || $adr }, $gen }, ", " , data($gen/../*:J)
} } 
else element td { "-----------" }  }

};
