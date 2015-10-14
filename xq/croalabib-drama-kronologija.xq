(: find all plays, order chronologically :)
for $d in collection("croalabib")//*:listBibl[@type='croala.drama']/*:bibl/*:date
order by $d/@period , $d/@when
let $zapis := $d/..
let $naslov := $d/../*:title[1]
return if ($naslov/text()) then element div {
  $zapis/*:author ,
  element title { data($naslov) } ,
  $d,
  $zapis/*:placeName
}
else 
element div { 
$zapis/*:author ,
element title { "TITULUS IGNORATUR"},
$d,
  $zapis/*:placeName
}