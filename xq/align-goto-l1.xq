for $i in //*:sentence 
for $a in $i/*:wds[@lnum='L2']/*:w[*:word[starts-with(@postag, 'v')]]
return $i/*:wds[@lnum='L1']/*:w[contains(@n, data($a/*:refs/@nrefs))]