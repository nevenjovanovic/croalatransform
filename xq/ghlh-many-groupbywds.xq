(: ghlh many-to-many in L1 group by :)
(: contains also one-to-many :)
for $i in //*:sentence/*:wds[@lnum="L1"]/*:w/*:refs/@nrefs[contains(., ' ')] 
let $n := db:node-pre($i/ancestor::*:wds)
group by $n
order by $n
return element w { count(distinct-values($i)) }