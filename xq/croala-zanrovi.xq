let $gg := for $i in //*:person/*:occupation[@code]
order by string-join($i/text(), ' ')
return for $g in tokenize(
  replace(
    normalize-space(string-join($i//text(), ' ')), '\(.+\)', ''), ',|:|;')
order by $g
return element g { $g }
return for $h in distinct-values($gg)
order by $h
return element h { $h }