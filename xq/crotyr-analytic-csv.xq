let $anal := file:read-text('/home/neven/Documents/tirol/14djela-analitika.csv')
let $osxml := csv:parse($anal, { 'header': true(), 'separator': ',' })
for $osrec in $osxml/record
let $work := $osrec/ID.djelo
let $an1 := element analytic {
  attribute xml:id {data($osrec/ID.jedinica)},
  element author { 
  element ref { attribute target {data($osrec/ID.jedinica.autor)} , data($osrec/Jedinica.autor.ime) } } ,
  if($osrec/jedinica.editor.ime != '') then
  element editor { 
  element ref { attribute target {data($osrec/ID.jedinica.editor)} , data($osrec/jedinica.editor.ime) } } 
  else(),
  element title { 
  attribute xml:lang { "lat" } ,
  data($osrec/Jedinica.naslov.lat)
},
element title { 
  attribute type { "incipit" } ,
  attribute xml:lang { "lat" } ,
  data($osrec/Jedinica.naslov.incipit)
},
if($osrec/Ref.adresat.ime != '') then
  element ref { attribute type {"adresat"} , data($osrec/Ref.adresat.ime) }  
  else(),
if($osrec/Ref.ostali.ime != '') then
  element ref { attribute type {data($osrec/Ref.ostali.tip)} , data($osrec/Ref.ostali.ime) }
  else(),
if($osrec/Datum.jedinica != '') then
  element ref { attribute {$osrec/Datum.odrednica} {data($osrec/Datum.jedinica)} , data($osrec/Datum.jedinica) }
  else()
}
group by $work
return element {$work} { $an1 } 
