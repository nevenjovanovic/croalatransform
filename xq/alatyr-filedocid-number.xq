(: read sequence from file? :)
for $q in doc("/home/neven/rad/2014-10-11-bibliography.xml")
let $tab := "&#9;"
let $nl := "&#10;"
return for $o at $broj in $q//tr
return concat(string-join($o/item, $tab) , $broj - 1, $nl)