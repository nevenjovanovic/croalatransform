let $a := for $i in //pdf2xml/page
return element pba {
  element pb {
    if ($i/text[number(@top) lt 130]) then
    attribute n {$i/text[number(@top) lt 130]/b} 
    else()
  },
    for $l in $i/text
    return element lba { element lb {
      if (number($l/@left) gt 115 and number($l/@left) lt 130) then $l/@left
      else()
    } , data($l) }
}
return $a/(pb | descendant::lb | descendant::text())