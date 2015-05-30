let $generaper := element ab { 
for $p in //*:profileDesc
for $genre in $p/*:textClass/*:keywords[@scheme='genre']/*:term
for $pergenre in $p/*:creation/*:date/@period
group by $genre
return element tbody { 
attribute class { $genre } , 
 for $v in distinct-values($pergenre)
 let $freq := count(index-of($pergenre, $v))
 order by $v
return element tr {
    element td { $v }, 
    element td { $freq }
}
  }
}

return $generaper