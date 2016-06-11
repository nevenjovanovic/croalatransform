let $prefixes := "https://de.m.wikipedia.org/wiki/Liste_lateinischer_Pr%C3%A4fixe"
let $prefixdoc := fetch:xml($prefixes, map {
  'parser': 'html',
  'htmlparser': map { 'html': false(), 'nodefaults': true() }
})
for $table in $prefixdoc//*:table//*:tr
return $table/*:td[1]/text()