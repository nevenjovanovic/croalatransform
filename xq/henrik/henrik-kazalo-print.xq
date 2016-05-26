(: kazala za izdanje Henrikovih marginalija :)
(: 1 kazalo lokacija u Euang. :)
declare namespace croala = 'http://croala.ffzg.unizg.hr';
declare function croala:pagindex () {
let $index :=
for $r at $count in collection("henrik")//*:record
let $pp := $r/Str
let $c := string($count)
group by $pp
return element p {
    attribute class { "pagina"},
    element b { data($pp) },
" ",
   string-join($c, ', ') }
return $index };
(: 6 kazalo kombinacija u Euang. :)
declare function croala:combind() {
let $list :=
for $r at $count in collection("henrik")//*:record
let $pp := $r/Kombinacija
let $c := string($count)
group by $pp
order by $pp
return element p {
  attribute class { "index"},
  element b {
    attribute class { "typus"},
    data($pp)
  },
  " ",
  element span {
   attribute class { "notaid"},
   
   string-join($c , ', ')
  } }
  return $list
};

declare function croala:indser(){
  (: 6 kazalo serija u Euang. :)
let $list :=
let $pp := ("cjelina", "cjelina.1")
for $r at $count in collection("henrik")//*:record
let $c := string($count)
where $r/VišeOznaka[.=$pp]
return 
   for $a in $c return
   switch($r/VišeOznaka)
   case $r/VišeOznaka[.="cjelina.1"] return
   element span {
     "; " || $a || "*, "
   }
  default return 
      element span { $a || ", " }
return element div {
    attribute class { "container-fluid"},
    attribute id {"index.not.cont"},
    element h1 {"Index notarum contextarum"},
    element p {"Stellula * significat primam in nova serie notarum."},
    element p {
        attribute class { "index"},
        
  $list
}
}
};

declare function croala:indtipmarg(){
  (: 2 kazalo vrsta u Euang. :)
let $result :=
element div {
for $r at $count in collection("henrik")//*:record
let $pp := $r/TipMarg
let $c := string($count)
group by $pp
order by $pp
return
  element p {
    element b {
    attribute class { "typus"},
    for $ty in data($pp)
    return switch($ty)
    case "komentar" return "commentum"
    case "leksik" return "copia verborum"
    case "naslov" return "titulus"
    case "naslov.interp" return "titulus aliis verbis"
    case "naslov.ponovljeno" return "titulus repetitis verbis"
    case "upozorenje" return "animadvertendum"
    default return ""
  }
  , " ",
  string-join($c, ', ') }
}
return element div {
element h1 {"Index rationum et generum notationis"},
element h2 {"Insignitum verbis"},
for $r in $result/p
where not($r/b/empty(text()))
order by $r/b
return $r
}


};

declare function croala:indlik() {
  (: 5 kazalo primarnih grafičkih oznaka u Euang. :)
let $result :=
for $r at $count in collection("henrik")//*:record
let $crit := ("vitis", "manicula", "n caudata", "flosculus", "saeptum", "verba sublineata")
where $r/Sadržaj[.=$crit]
let $pp := $r/Sadržaj
let $c := string($count)
group by $pp
order by $pp
return element p {
  attribute class {"index"},
  element b {
    
    data($pp)
  },
  " ",
  element span {
    attribute class { "margnum"},
  string-join($c , ', ')
  } }
return element div {
  element h2 {"Insignitum imagunculis tantum"},
  $result
}

};
  
element div {
  
  attribute id {"index.paginarum"},
  croala:indtipmarg(),
  croala:indlik(),
  element h1 {"Index signorum combinatorum"},
  croala:combind(),
  croala:indser(),
  element h1 {"Index paginarum in editione Coloniensi 1529"},
  croala:pagindex()
}
