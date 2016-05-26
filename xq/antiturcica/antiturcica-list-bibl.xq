(: format bibliography of Croatian antiturcica :)
(: model - Gollner :)
declare namespace functx = "http://www.functx.com";
declare function functx:capitalize-first
  ( $arg )  {

   concat(upper-case(substring($arg,1,1)),
             substring($arg,2))
 } ;
let $content0 := element div { for $r0 in collection("croantiturcica")//*:record
order by $r0/*:Datum
return $r0
}
let $content := element div {
for $r at $nr in $content0//*:record
return element div { 
  element h2 {
  element span {$nr || ". "} , 
  element span { data($r/*:Autor) || "." } } , 
  element p {
  element span { "[" || replace(data ($r/Datum), '-01-01', '') || "]. "} ,
  element span { data($r/*:Naslov) || "." }
},
  element p {
  element span { functx:capitalize-first(data($r/*:rukopis)) || ". " || functx:capitalize-first(data($r/Rod)) || ". " || functx:capitalize-first(data($r/Vrsta)) || "."}
},
  element p {
  for $izd in data($r/*:Izdanje)
  return switch($izd)
  case "ne" return "Do danas neobjavljeno."
  case "izg" return "Tekst nije sačuvan."
  default return $izd || "." },
  
    for $popr in data($r/*:Popratni_tekst)
    return switch($popr)
    case "nema" return ""
    case "" return ""
    default return element p { "POPR: " || $popr },
  element p { data($r/*:Napomena)}
   }
 
}
return file:write('/home/neven/rad/croala-r/temrezah-site/antiturcica-biblio.html' , <html>
  <head>
    <title>Antiturcica iterata</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="css/temrezah.css"/>
  </head>
  <body text="#000000">
    <h1>Antiturcica iterata - bibliografski popis hrvatskih protuturskih tekstova</h1>
    <p>{ data(db:info("croantiturcica")//databaseproperties/timestamp) }</p>
    { $content }
    </body>
    </html>
  )