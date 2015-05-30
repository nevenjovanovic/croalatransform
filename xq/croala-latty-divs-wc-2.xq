(: analyse divs in croala and latty :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: total wcs, nicely formatted :)
declare function croala:formatnumbr ($x) {
  format-number($x, "#,##0")
};

declare function croala:findid ($doc,$num) {
   let $d := $doc[tok[.=$num]]/@node
   return data($d)
};

let $db := ("croala", "latty")
for $d in $db
let $docs := collection("croalalattyttr")//doc[@db=$d]
let $divcount := count($docs)
let $divmax := max($docs/tok)
let $divmin := min($docs/tok)
return element tr {
  element td { attribute class { $d },$d } ,
  element td { attribute class {"clausula"} , croala:formatnumbr($divcount) } ,
  element td { attribute class {"clausula"} , croala:findid($docs, $divmax) , croala:formatnumbr($divmax) },
  element td { attribute class {"clausula"} , croala:findid($docs, $divmin) , $divmin }
}