(: funkcija analizira žanrove po godinama :)
(: rezultati kao redovi i kućice u tablici :)
declare namespace antitur = 'http://croala.ffzg.unizg.hr/antiturcica';
(: žanrovi / godine :)
declare function antitur:generannus(){
let $cesti := element a {
let $a := collection("croantiturcica")//*:record/*:Vrsta
return $a[index-of($a,.)[2]]
}
for $r in collection("croantiturcica")//*:record
where $r/*:Vrsta=$cesti//Vrsta
order by $r/Vrsta  collation "?lang=hr"
return element tr {
  element td { $r/Vrsta } ,
  element td { $r/Datum }
}
};

antitur:generannus()
