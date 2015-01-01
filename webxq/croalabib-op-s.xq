import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";
declare %rest:GET %rest:POST %rest:path("croalabib-op-saec")
function page:croalabib-op-saec() { 

(: Report number of works by period :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: opera per saecula</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: opera per saecula</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table>
    
    <thead>
      <tr>
          <td>Saeculum</td>
          <td class="broj">Operum</td>
      </tr>
    </thead>{ 
(: The actual XQuery starts here :)
let $doc := collection("croalabib")//tei:listBibl[@ana='croala.opera']
let $ln := $doc//(descendant::*:biblStruct[@xml:id]/tei:imprint union descendant::*:bibl[@xml:id])

return element tbody {
	element tr {
element td {
	"Omnia saec."
} ,
element td { 
 attribute class { "broj" },
 count($ln[tei:date[@period]])
}
},

element tr {
element td {
	"Saec. XI"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '10xx'])
}
},

element tr {
element td {
	"Saec. XII"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '11xx'])
}
},

element tr {
element td {
	"Saec. XIII"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '12xx'])

}
},

element tr {
element td {
	"Saec. XIV"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '13xx'])

}
},

element tr {
element td {
	"Saec. XV"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text "14xx"])

}
},

element tr {
element td {
	"Saec. XVI"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '15xx'])

}
},
element tr {
element td {
	"Saec. XVII"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '16xx'])

}
},

element tr {
element td {
	"Saec. XVIII"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '17xx'])

}
},

element tr {
element td {
	"Saec. XIX"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '18xx'])

}
},

element tr {
element td {
	"Saec. XX"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '19xx'])

}
},

element tr {
element td {
	"Saec. XXI"
} ,
element td { 
 attribute class { "broj" },
 count($ln/tei:date[last() and @period contains text '20xx'])

}
}

}
}
</table>
</blockquote>
     <p/>
<hr/>
<div>
<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a></p>
</div>
</body>
</html>
};
return
