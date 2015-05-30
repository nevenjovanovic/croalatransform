declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:generatypi ($collection,$gentyp) { 
for $p in collection($collection)//*:profileDesc
for $genre in $p/*:creation/*:date/@period
for $pergenre in $p/*:textClass/*:keywords[@scheme=$gentyp]/*:term

group by $genre
order by $genre
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
};

croala:generatypi("latty","genre")