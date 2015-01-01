(: address to which we are sending the queries - Perseus :)
let $url := ('http://api.geonames.org/search?q=RIJEC&amp;maxRows=1&amp;username=nevenjovanovic')
let $rijeci := for $i in //*:lemma
where ($i/l[not(node())] and $i/w[not(contains(text(), ' '))] and $i/n[node()])
return $i
for $r in $rijeci/n
let $parsed := (doc(replace($url,'RIJEC',$r)))
return element lemma {
  $r/../w ,
  $r ,
  element l { attribute type { "geonames" } , data($parsed//geonameId) }
}