for $i in //*:BIBLEBOOK[@bnumber='41']/*:CHAPTER/*:VERS
let $nl := "&#10;"
order by $i/../@cnumber, $i/@vnumber
return element v { attribute cn {$i/../@cnumber} , attribute vn {$i/@vnumber} , concat(normalize-space(data($i)), $nl)}