for $c in
let $f := //table[tr[3]/td[1][.!='0']]/tr[1]/td[1]/a
return data($f)
where starts-with($c,'6.')
return $c