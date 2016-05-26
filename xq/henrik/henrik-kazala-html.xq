(: kazala za izdanje Henrikovih marginalija :)
(: 1 genera :)
(: 2 combinationes :)
(: 3 nexus :)
(: 4 paginae :)
declare namespace croala = 'http://croala.ffzg.unizg.hr';
(: genera :)
declare function croala:idxgenhtml(){
  let $result :=
element div {
for $r at $count in collection("henrik")//*:record
let $pp := $r/TipMarg
let $c := string($count)
group by $pp
order by $pp
return element div {
  attribute class { "row-fluid"},
  element div {
    attribute class { "col-md-2 typus"},
    for $ty in data($pp)
    return switch($ty)
    case "komentar" return "commentum"
    case "leksik" return "copia verborum"
    case "naslov" return "titulus"
    case "naslov.interp" return "titulus aliis verbis"
    case "naslov.ponovljeno" return "titulus repetitis verbis"
    case "upozorenje" return "animadvertendum"
    default return ""
  },
  element div {
   attribute class { "col-md-4 notaid"},
   for $a in $c return
   element a {
     attribute href {"#euang.nota." || $a } , $a }
  } }
}
return element div { 
attribute class {"container-fluid"},
attribute id {"index.ratio"},
element h1 {"Index rationum notationis"},
for $r in $result/div[@class]
where not($r/div[@class][1]/empty(text()))
order by $r/div[@class][1]
return $r
}

};


(: combinationes :)
declare function croala:idxcombhtml(){
  let $list :=
for $r at $count in collection("henrik")//*:record
let $pp := $r/Kombinacija
let $c := string($count)
group by $pp
order by $pp
return element div {
  attribute class { "row-fluid"},
  element div {
    attribute class { "col-md-4 typus"},
    data($pp)
  },
  element div {
   attribute class { "col-md-8 notaid"},
   for $a in $c return
   element a {
     attribute href {"#euang.nota." || $a } , $a }
  } }
return 
element div {
  attribute class {"container-fluid"},
  attribute id {"index.comb"},
  element h1 {"Index signorum"},
$list
}
};
(: nexus / series :)
declare function croala:idxnexhtml() {
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
     "; ",
   element a {
     attribute href {"#euang.nota." || $a } , $a || "*" }
   }
  default return element a {
     attribute href {"#euang.nota." || $a } , $a }
return element div {
    attribute class { "container-fluid"},
    attribute id {"index.not.cont"},
    element h1 {"Index notarum contextarum"},
    element p {"Stellula * significat primam in nova serie notarum"},
    element div {
        attribute class { "row"},
        element div {
            attribute class { "col-md-12"},
  $list
}
}
}
};
(:paginae:)
declare function croala:idxpaghtml(){
  let $index :=
for $r at $count in collection("henrik")//*:record
let $pp := $r/Str
let $c := string($count)
group by $pp
return element div {
  attribute class { "row-fluid"},
  element div {
    attribute class { "col-md-2 pagina"},
    element b { data($pp) }
  },
  element div {
   attribute class { "col-md-4 notaid"},
   for $a in $c return
   element a {
     attribute href {"#euang.nota." || $a } , $a }
  } }

return element div {
  attribute class {"container-fluid"},
  attribute id {"index.paginarum"},
  element h1 {"Index paginarum in editione Coloniensi 1529"},
  $index
}
};
croala:idxgenhtml(),
croala:idxcombhtml(),
croala:idxnexhtml(),
croala:idxpaghtml()