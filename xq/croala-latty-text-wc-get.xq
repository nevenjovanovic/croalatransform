declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

declare function croala:solraddr ($auct) { 
let $link := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=HEREDB&amp;filename=HEREGENUS"
return replace($link,"HEREDB",$auct)
 };

declare function croala:wc ($collection) { 
element tbody { 
for $idx in 
for $dc in collection($collection)//*:text[not(ancestor::*:text)]
let $name := substring-after(base-uri($dc), "/")
let $wc := count(ft:tokenize($dc))
order by $wc descending
return element tr { 
element td { 
element a { 
  attribute href { replace(croala:solraddr($collection),"HEREGENUS", $name)},
  $name
}
},
element td { attribute class {"wc"} , $wc }
}

return $idx
}
};
croala:wc("latty")