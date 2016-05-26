(: funkcija analizira žanrove po jezicima :)
(: rezultati kao redovi i kućice u tablici :)
declare namespace antitur = 'http://croala.ffzg.unizg.hr/antiturcica';
(: žanrovi / jezici :)
declare function antitur:generaling(){
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
  element td { $r/J }
}
};

antitur:generaling()
