for $a in element p { 
for $i in //*:wds[@lnum='L2']/*:w/*:text
 return element text { replace($i/text(), '[^A-Za-zČĆŠŽĐčćšžđ]', '')  }
} 
return element tbody { 
for $l in distinct-values($a/*:text[not(empty(text()))])
order by $l  collation "?lang=hr"
return element tr { 
element td { 
element a { 
attribute href { "http://solr.ffzg.hr/basex/ghlh-start"} , $l } }
}
}