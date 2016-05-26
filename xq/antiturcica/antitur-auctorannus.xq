(: funkcija analizira autore po godinama :)
(: rezultati kao redovi i kućice u tablici :)
declare namespace antitur = 'http://croala.ffzg.unizg.hr/antiturcica';
(: autori / godine :)
declare function antitur:auctorannus(){
let $cesti := element a {
let $a := collection("croantiturcica")//*:record/*:Autor
return $a[index-of($a,.)[2]]
}
for $r in collection("croantiturcica")//*:record
where $r/*:Autor=$cesti//Autor
order by $r/Autor
return element tr {
  element td { $r/Autor } ,
  element td { $r/Datum }
}
};

antitur:auctorannus()
