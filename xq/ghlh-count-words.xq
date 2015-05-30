declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: count words in L1 sentences :)
(: return count of sentences with certain number of words :)
declare function croala:repl($sentence) {
  replace(string-join(data($sentence/*:comment), "; "), "(http://solr.ffzg.hr/ghlh/|.txt)", "")
};
declare function croala:tbl ($td as xs:string+) {
  for $a in $td return element td { $a }
};
element table { 
element thead {
  element tr {
    croala:tbl( ("Rečenice", "Broj rečenica", "Broj riječi"))
  }
},
element tbody {

for $nr in db:node-pre(//*:sentence)
for $sentence in db:open-pre("ghlh-got", $nr)/*:wds[@lnum="L1"]
let $values := count($sentence/*:w)
group by $values
order by $values
return element tr
{ 
croala:tbl ( (croala:repl($sentence), string(count($sentence)),  string($values) ))
}
}
}