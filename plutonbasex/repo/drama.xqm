module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama";

(: drama functions :)

declare function drama:getbibliolist($collection){
  let $bibliogr := collection($collection)//*:listBibl[@type='croala.drama.sekundarna']
  return element table { 
  attribute class {"tablesorter"},
  element thead {
    element tr {
      element td {"Annus"},
      element td {"Titulus"},
      element td {"Dramata"}
    }
  } ,
  element tbody { 
  
    for $title in $bibliogr/*:bibl
    let $titleref := $title/@xml:id
    let $refcount := count(drama:getbiblioref('#' || $titleref))
    order by $title collation "?lang=hr"
    
    return 
      if ($refcount > 0) then
    element tr {
      element td { data($title/*:date) },
    element td { data($title) },
    element td { 
      
    element a { 
    attribute href {'dramabib-titleref/' || $titleref} , 
    $refcount }
     
  }
  }
  else ()
}

}
};

declare function drama:getbiblioref($biblioref){ 
for $dramaref in collection('croalabib')//*:listBibl[@type='croala.drama']/*:bibl[*:relatedItem/*:listBibl/*:bibl/@corresp= $biblioref]
return element tr {
element td { $dramaref/@xml:id , $dramaref/*:title[1], $dramaref/*:date[1] , $dramaref/*:placeName[1] } 
}
};

declare function drama:biblioref-listd($refid) {
  element table {
  let $refid1 := $refid
  return element thead {
    element tr {
      element td { $refid1 , 
      element p { collection('croalabib')//*:bibl[@xml:id=$refid1] } }
    }
  },
  element tbody {
    drama:getbiblioref('#' || $refid)
  }
}
};
