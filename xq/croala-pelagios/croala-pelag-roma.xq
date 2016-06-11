(: create index of forms = Roma :)
(: produce table to be included in report :)
(: takes 32426.26 ms :)
declare namespace nlwl = 'http://croala.ffzg.unizg.hr/nlwl';

declare function nlwl:rows2($td1 , $td2 ){

element tr { 
  element td { $td1 },
  element td { $td2 }
 }
};

declare function nlwl:links0($urn, $text) {
  element a { 
attribute href { $urn },
$text }
};
let $tbody := element tbody {
let $forms := ("Roma", "Romae", "Romam", "Rome", "Romaque", "Romamque", "Romaeque")
for $f in $forms
let $locid := db:node-id(//*:text//*[text() contains text { $f } ])
let $idlink := for $l in $locid
let $urn := "http://croala.ffzg.unizg.hr/basex/node/croala0/" || $l
return nlwl:links0($urn, $l)
return nlwl:rows2($f, $idlink)
}
let $romacount := count($tbody//a)
return element table {
  attribute class {"table-striped table-hover table-centered"},
  element thead {
    nlwl:rows2("Romae formae", $romacount ),
    $tbody
  }
}