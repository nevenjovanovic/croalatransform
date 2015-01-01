(: read sequence from file? :)
let $q := doc("/home/neven/rad/2014-croala-uniq-1000.xml")
let $tab := "&#9;"
let $nl := "&#10;"
return for $i in $q//lemma
  return element tr { 
  element td { data($i/*:n)},
  element td {
    element a { attribute href {concat("http://www.ffzg.unizg.hr/klafil/croala/cgi-bin/search3t?dbname=croala&amp;word=",$i//w)} , data($i//w)
} },
  element td {
    element a { attribute href {data($i//uri)} , data($i//l) } }
}
