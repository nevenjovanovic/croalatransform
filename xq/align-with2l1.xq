for $i in //*:sentence
(: get just verbs :) 
for $a in $i/*:wds[@lnum='L2']/*:w[*:word[starts-with(@postag, 'v')]]
(: just those aligned with 2+ L1 words :)
where count(tokenize($a/*:refs/@nrefs, ' ')) gt 1
return $a