(: read sequence from file? :)
let $s := for $q in collection("croala-philo-bib")/*:m
let $tab := "&#9;"
let $nl := "&#10;"
return for $o at $broj in $q/tr
return concat(string-join($o/item, $tab) , $broj - 1, $nl)
return file:write-text("/home/neven/rad/2014-12-28-croala-bibliography.txt",string-join($s,''))