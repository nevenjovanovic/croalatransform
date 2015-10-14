(: use db of latty clausulae to search for matches of two final words in croala clausulae :)

for $a in collection("lattyclausulae")//c[position() gt 29]
let $dva := replace($a, '\w+ (\w+ \w+)', '$1')
where collection("croalaclausulae")//c[text() contains text {$dva}]
return element tr { 
element td {
element a {
  attribute href { "http://solr.ffzg.hr/basex/node/latty/" || data($a/@id) },
"LatTy" }
},
element td { $dva }
}