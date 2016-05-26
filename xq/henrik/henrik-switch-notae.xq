(: terminološka zamjena za Henrika :)

let $zn :=
element zn { 
for $r in //record
return $r/dodatno
}
for $a in $zn/dodatno
return switch ($a)
case   "vitica" return "vitis"
case "vitica, w" return "vitis, n caudata"
case "vitica, flosculus" return data($a)
case "manicula, vitica" return "manicula, vitis"
case "manicula, ograda" return "manicula, saeptum"
case "manicula, ograda, %" return "manicula, saeptum, nota bene"
case "ograda" return "saeptum"
case "ograda, flosculus" return "saeptum, flosculus"
case "ograda, w" return "saeptum, n caudata"
case "ograda, potcrtano" return "saeptum, verba sublineata"
case "ograda, w, flosculi" return "saeptum, n caudata, flosculi"
case "strelica u tekstu" return "sagitta"
case "flosculus" return data($a)
case "w" return "n caudata"
case "%" return "nota bene"
default return $a