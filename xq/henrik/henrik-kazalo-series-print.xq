(: kazala za izdanje Henrikovih marginalija :)
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
