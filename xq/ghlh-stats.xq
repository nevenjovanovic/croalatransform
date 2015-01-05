declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:sentcount() {
count( collection("ghlh-got")//*:sentence
)
};
declare function croala:sentlangcount($lang) {

count( collection("ghlh-got")//*:language[@xml:lang=$lang] )

};
declare function croala:wordcount($l) {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum=$l]/*:w[not(empty(*:text))]
return count ($i)
)
};
declare function croala:aligncount($l) {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum=$l]/*:w/*:refs
return count ($i)
)
};
declare function croala:onecount() {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum="L1"]/*:w/*:refs[not(contains(@nrefs, ' '))]
return count ($i)
)
};
declare function croala:multicount($l) {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum=$l]/*:w/*:refs[contains(@nrefs, ' ')]
return count ($i)
)
};
let $posto := round(croala:aligncount("L1") div (croala:wordcount("L1") div 100))
let $posto2 := round(croala:aligncount("L2") div (croala:wordcount("L2") div 100))
return
element div {
element p { "Broj rečenica: " , croala:sentcount() },
element p { "Grčkih: " , croala:sentlangcount("grc")},
element p { "Latinskih: " , croala:sentlangcount("lat")},
element p { "Hrvatskih: " , croala:sentlangcount("hrv")},
element p { "Broj riječi izvornika: " , croala:wordcount("L1")},
element p { "Broj riječi prijevoda: " , croala:wordcount("L2")},
element p { "Broj povezanih riječi izvornika: " , croala:aligncount("L1"), " (" ,  $posto , "%) " },
element p { "Broj povezanih riječi prijevoda: " , croala:aligncount("L2"), " (" ,  $posto2 , "%) " },
element p { "Broj veza 1:1 : " , croala:onecount() },
element p { "Broj višestrukih veza (izvornik): " , croala:multicount("L1") },
element p { "Broj višestrukih veza (prijevod): " , croala:multicount("L2") }
}