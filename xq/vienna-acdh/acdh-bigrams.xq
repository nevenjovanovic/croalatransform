(: return a list of pairs :)
let $biglist := element biglist {
for $w in //*:w[@lemma]
let $w2 := $w/following-sibling::*:w[1][@lemma]
order by $w/@lemma , $w2/@lemma
return if ($w2/@lemma) then element big { data($w/@lemma) , data($w2/@lemma) } else()
}
(: group and return where big > 2 :)
for $biglistitem in $biglist//*:big
let $group := $biglistitem/text()
group by $group
where count ($biglistitem) > 2
order by count ($biglistitem) descending
return element bigram { $group , count($biglistitem) }