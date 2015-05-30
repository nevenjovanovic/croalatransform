(: for croalalattyttr - translate genres from German to Latin; clean up genre data :)
declare variable $genre as map(*) := map {
 "Brief": "epistula",
 "DichtungEpik": "epica",
 "Gelegenheitsdichtung": "poesis",
 "Geschichtsschreibung": "historia",
 "DichtungLehrgedicht" : "didactica",
 "Theater": "drama" 
};
for $i in collection("croalalattyttr")//*:gen
let $g := replace($i, '\s{2,}', '')
return if (map:contains($genre, $g)) then replace value of node $i with map:get($genre,$g)
else replace value of node $i with replace($i, '\s{2,}', '')