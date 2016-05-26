let $replace1 :=  ("“ἀνδρῶν", "“Κροῖσος","“ὦ")
let $replace2 := ("ἀξιοθέητον·", "δέδασται·", "ἔλεγον·", "ἐξέφηναν·", "Θυρέης·", "καταλύσειν·", "νόμον·", "οὔ·", "ποιεύμενον·", "πρήγματι·", "σίγμα·", "ταῦτα·", "τόδε·", "τοιόνδε·", "φαλλοῦ·", "φορέειν·", "οἱ·")
for $replace in $replace2
let $r2 := replace($replace, '·', '')
return for $entry in collection("ghlh-got")//*:w/*:text
where $entry[.=$replace]
return replace value of node $entry with $r2