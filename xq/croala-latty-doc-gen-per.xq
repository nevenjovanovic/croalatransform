(: return name of file with genre and period :)
let $g := "15xx_1_third"
let $p := "poesis - epigramma"
for $i in collection("croala")/*[descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term=$p and descendant::*:profileDesc[1]/*:creation/*:date[matches(@period,$g)]]
return db:path($i)