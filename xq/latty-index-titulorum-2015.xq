(: create bibliography entries for all texts in LatTy :)
(: use also as links to files :)
declare namespace functx = "http://www.functx.com";
declare function functx:substring-after-if-contains
  ( $arg as xs:string? ,
    $delim as xs:string )  as xs:string? {

   if (contains($arg,$delim))
   then substring-after($arg,$delim)
   else $arg
 } ;
for $entry in collection("latty0")//*:teiHeader
let $author := 
 for $an in $entry//*:titleStmt/*:author/*:name
 return $an
let $title := $entry//*:titleStmt/*:title
let $editor := if ($entry//*:titleStmt/*:editor) then 
for $en in $entry//*:titleStmt/*:editor return $en
else $entry//*:titleStmt/*:respStmt
let $date := $entry//*:profileDesc/*:creation/*:date
let $url := functx:substring-after-if-contains(db:path($entry), '/')
let $urlref := replace('http://solr.ffzg.hr/philo4/latty2/query?report=bibliography&amp;method=proxy&amp;colloc_filter_choice=frequency&amp;filter_frequency=100&amp;year_interval=10&amp;filename=URLFILEHEREXXX&amp;start=0&amp;end=0', 'URLFILEHEREXXX', $url)
order by $author[1]
return element bibl { 
if ($author[2]) then 
$author[1] || " et " || $author [2] || ". "
else if (not($author)) then "S. a. "
else data($author) || ". " ,
element em { normalize-space(data($title)) } ,
if ($date) then " [" || data($date) || "]." else "[S. a.]. " ,
if ($editor[2]) then "Edd. " || normalize-space($editor[1]) || " et " || normalize-space($editor[2]) || ". "
else normalize-space(data($editor)) || ". " ,
"Oeniponti et Zagrabiae: Croatica et Tyrolensia, 2015. Internet. ",
element b { "LatTy"} ,
": " ,
element a { attribute href { $urlref } , $url }
}