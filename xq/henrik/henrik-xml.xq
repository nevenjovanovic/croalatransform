for $r in //*:record
let $pp := $r/Stranica
group by $pp
return element div {
  element pb { attribute n {replace($pp, '\.', '')} } ,
  element milestone { 
  attribute unit {  "pp" } ,
  attribute facs {distinct-values($r/pb) }},
  for $rr in $r return element p {
    element gap {},
element note {
  attribute ana { $rr/tip_1 } ,
  data($rr/Sadržaj) },
element seg { 
if ($rr/VišeOznaka/text()) then attribute ana {$rr/VišeOznaka} else(),
data($rr/Ozn._tekst) }, element gap {} }

}