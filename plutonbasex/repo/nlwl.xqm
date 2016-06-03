(: modul za Neulateinische Wortliste :)
module namespace nlwl = 'http://croala.ffzg.unizg.hr/nlwl';
(: helper function for links :)
declare function nlwl:links0($urn, $text) {
  element a { 
attribute href { $urn },
$text }
};

(: helper function to return rows :)

declare function nlwl:rows2($td1 , $td2 ){

element tr { 
  element td { $td1 },
  element td { $td2 }
 }
};

(: return statistics on orthography :)

declare function nlwl:ortho(){
  (: count number of orthographical variations :)
for $i in collection("nlwl")//*:entry
let $lemma := nlwl:links0(data($i/@urn) , replace($i/*:forms/*:mainform, " [12]", ""))
let $c := count($i/*:forms/*)
where $c > 4
group by $c
order by $c descending
return
nlwl:rows2($c, $lemma )
};

(: return statistics on word types / nouns, adjectives :)

(: return statistics on word length :)

(: return longest words :)
declare function nlwl:longissima(){
  (: find longest words in NLWL, display as table :)
for $e in collection("nlwl")//entry/forms/(mainform|other)
let $word := replace($e, " [12]", "")
let $urn := nlwl:links0(data($e/ancestor::entry/@urn), $word)
let $c := string-length($word)
where $c > 14
order by $c descending
return nlwl:rows2($urn , $c)
};

(: helper function for header, with meta :)
declare function nlwl:htmlheadserver($title, $content, $keywords) {
  (: return html template to be filled with title :)
  (: title should be declared as variable in xq :)

<head><title> { $title } </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords" content="{ $keywords }"/>
<meta name="description" content="{$content}"/>
<meta name="revised" content="{ current-date()}"/>
<meta name="author" content="Neven Jovanović, CroALa" />
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
</head>

};