(: test :)
let $s := 
<s uri="http://solr.ffzg.hr/ghlh/phi0474.phi037.perseus-lat1-1.18.2.txt">
  <a href="1-1">
    <text xmlns="http://alpheios.net/namespaces/aligned-text">Quid</text>
  </a>
</s>
(: go from w1 to w2 :)
for $w in $s
let $uri := $s/@uri
let $broj := $s/*:a/@href
return collection("ghlh-got")//*:wds[@lnum='L2' and *:comment=replace($s/@uri, '(grc1|lat1)', 'hrv1')]/*:w[@n=$broj]