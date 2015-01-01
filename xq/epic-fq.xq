for $i in //*:w
let $f := $i/@frequency div ( $i/../@wc div 100 )
where $f > 0.055
return element w { data($i/../@title), "," , data($i/@word) , "," , $f }
