(: html za izdanje Henrikovih marginalija :)
let $result :=
let $enum :=
element group {
for $r at $count in collection("henrik")//*:record
return element div {
  element c { $count },
  $r/*
}
}
for $rc in $enum/div
let $pp := $rc/Lokacija
group by $pp
return element div {

  element h1 { 
  attribute class {"evang" } , $pp },
  for $rcc in $rc
  return element div {

    attribute id { "euang.nota." || data($rcc/c) },
    element h2 { data($rcc/c) } ,
   
    element p { 
    attribute class { "nota" } , 
    for $s in data($rcc/Sadržaj)
    return switch($s)
    case "vitis"
    case "verba sublineata"
    case "saeptum"
    case "manicula"
    case "flosculus"
    case "n caudata" return element em { $s }
    default return $s
     },
    element p { 
    attribute class { "textus" } , 
    if (matches(data($rcc/OznTekst), '/')) then
    for $r in tokenize(data($rcc/OznTekst), '/') return element span { $r , element br {} }
    else data($rcc/OznTekst)
     }
  
    ,
     
    element p {
      attribute class { "interp" } , 
    element span { element b { data($rcc/Kombinacija) } } ,
    element span { 
    for $ty in data($rcc/TipMarg)
    return switch($ty)
    case "komentar" return "| commentum"
    case "leksik" return "| copia verborum"
    case "naslov" return "| titulus"
    case "naslov.interp" return "| titulus aliis verbis"
    case "naslov.ponovljeno" return "| titulus repetitis verbis"
    case "upozorenje" return "| animadvertendum"
    default return ""
     } ,
    for $c in data($rcc/VišeOznaka)
    return switch($c)
    case "cjelina" return element span { "| C" }
    case "cjelina.1" return element span { "| C1" }
    default return ""
  }
  }
}


return element div {

  attribute id {"editio.textus"},
  element h1 {"Editio"},
  $result
}