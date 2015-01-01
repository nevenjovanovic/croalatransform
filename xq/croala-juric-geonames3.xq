(: address to which we are sending the queries - geonames :)
let $url := ('http://api.geonames.org/search?q=RIJEC&amp;maxRows=1&amp;username=nevenjovanovic')
let $rijeci := for $i in //*:lemma
where $i/(n[node()] and $i/l[starts-with(text(), 'cnl') and not(contains(text(), ' '))])
return $i
for $r in $rijeci/n
let $parsed := (doc(replace($url,'RIJEC',replace($r, ' ', '+'))))
return element lemma {
  $r/../w ,
  $r ,
  $parsed//name ,
  element l { attribute type { "geonames" } , data($parsed//geonameId)}
}