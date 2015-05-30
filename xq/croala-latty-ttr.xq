declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

declare variable $genre as map(*) := map {
 "Brief": "epistula",
 "Dichtung": "poesis",
 "Epik": "epica",
 "Gelegenheitsdichtung": "poesis",
 "Geschichtsschreibung": "historia",
 "Lehrgedicht" : "didactica",
 "Theater": "drama" 
};

let $dbb := element db { for $i in (collection("croala")|collection("latty"))//*:div[not(descendant::*:div)]
let $wl := ft:tokenize($i)
let $wc := count($wl)
let $typ := distinct-values($wl)
let $divgen := $i/@type
let $divgen1 := $i/ancestor::*:div[@type][1]/@type
let $textgen := for $k in $i/ancestor::*:TEI//*:profileDesc/*:textClass/*:keywords[@scheme='genre']
return replace(data($k), '\s{2,}', '')
let $ttr := if ($wc ne 0) then croala:round2(count($typ), $wc)
else "na"
return element doc { 
attribute db { db:name($i) },
attribute node { db:node-pre($i) },
element id { $divgen , base-uri($i)  } ,
element gen { $divgen1  ,
data($textgen) } ,
element tok { $wc } ,
element typ { count($typ) },
element ttr { $ttr }
}
}
return db:create("croalalattyttr",$dbb, "ttrs.xml", map {"intparse" : true()})