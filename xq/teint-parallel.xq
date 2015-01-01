(: show parallel bilingual lines in New Testament, TEI-encoded :)
for $i in //*:div[@n='44']/*:div/*:ab
let $nl := "&#10;"
order by $i/../@n, number($i/@n)
return element v { attribute cn {$i/../@n} , attribute vn {$i/@n} , concat(normalize-space(data($i)), $nl)}