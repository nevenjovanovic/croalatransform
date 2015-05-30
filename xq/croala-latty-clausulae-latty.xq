(: use db of latty clausulae to search for matches in croala clausulae :)

for $a in collection("lattyclausulae")//c[position() gt 29]
where collection("croalaclausulae")//c[text() contains text {$a}]
return element tr { 
element td {
element a {
  attribute href { "http://solr.ffzg.hr/basex/node/latty/" || data($a/@id) },
"LatTy" }
},
element td { data($a) }
}