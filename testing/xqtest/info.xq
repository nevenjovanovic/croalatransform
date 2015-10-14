declare variable $week as map(*) := map {
  "name": "nomen",
  "documents": "documenta",
  "timestamp": "de dato"
};
element table { 
let $i := db:info('croalabib')/databaseproperties
  for $n in ('name','documents','timestamp')
  return 
   element tr {
    element td { map:get($week, $n) } ,
    element td { $i/*[name()=$n] }
  }
}