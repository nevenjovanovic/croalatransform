let $osobe := file:read-text('/home/neven/Documents/tirol/luka-mreze/petanc-osob.csv')
let $osxml := csv:parse($osobe, { 'header': true(), 'separator': ',' })
for $osrec in $osxml/record
return element tr {
  element td { data($osrec/croala.publika.id) } ,
  element td { 
  if (exists($osrec/viaf) and not (starts-with($osrec/viaf, 'viaf'))) then
  element a { attribute href { concat("http://solr.ffzg.hr/basex/rest/croalabib?query=//*:person[@xml:id='", data($osrec/viaf), "']") }, 
  data($osrec/ime) } 
  else if (exists($osrec/viaf)) then
  element a { attribute href {replace($osrec/viaf, 'viaf', 'http://viaf.org/viaf/') },
  data($osrec/ime) }
  else if (not(exists($osrec/viaf))) then
  data($osrec/ime)
  else ()
}
}