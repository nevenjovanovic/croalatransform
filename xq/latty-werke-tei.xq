for $i in //*:ROW
return element bibl {
  attribute xml:id { "tyrolis.opera." || db:node-pre($i) } ,
  element author { data ( $i/*:COL[3] ) } ,
  element title { data ( $i/*:COL[15] ) } ,
  element pubDate { 
  element daterecord { data ( $i/*:COL[5] ) } ,
  element date { if (matches(data ( $i/*:COL[6] ),"#[0-9]{4}$")) then
  attribute when { data ( $i/*:COL[6] ) }
  else data ( $i/*:COL[6] )
    }
},
  element pubPlace {
    data($i/*:COL[9])
  },
  element note {
    attribute ana { "kategorie" },
    data ($i/*:COL[7])
  } ,
  element idno { 
data ($i/*:COL[8])
} ,
  element idno { attribute ana { "werknr" },
data($i/*:COL[16])
},
  element note { data ( $i/*:COL[1] ) },
  element note { attribute ana { "referenz"},
  data($i/*:COL[10])
},
element note { attribute ana { "relevanz"},
  data($i/*:COL[11])
},
element note { attribute ana { "signatur"},
  data($i/*:COL[12])
},
element note { attribute ana { "standort"},
  data($i/*:COL[13])
},
element note { attribute ana { "text"},
  data($i/*:COL[14])
},
element note { attribute ana { "wien"},
  data($i/*:COL[17])
}
}