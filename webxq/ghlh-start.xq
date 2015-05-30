(: GHLH - startpage: report on all entries, link functions :)
import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: count sentences total :)
declare function croala:sentcount() {
count( collection("ghlh-got")//*:sentence
)
};

(: count sentences in each language :)
declare function croala:sentlangcount($lang) {

count( collection("ghlh-got")//*:language[@xml:lang=$lang] )

};

(: count words in each language :)
declare function croala:wordcount($l) {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum=$l]/*:w[not(empty(*:text))]
return count ($i)
)
};

(: count alignments :)
declare function croala:aligncount($l) {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum=$l]/*:w/*:refs
return count ($i)
)
};

(: count 1-1 :)
declare function croala:onecount() {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum="L1"]/*:w/*:refs[not(contains(@nrefs, ' '))]
return count ($i)
)
};

(: count multiple alignments :)
declare function croala:multicount($l) {
count( for $i in collection("ghlh-got")//*:sentence/*:wds[@lnum=$l]/*:w/*:refs[contains(@nrefs, ' ')]
return count ($i)
)
};


(: css grid cells :)
declare function croala:cell ($cell as xs:string+) {
element div { attribute class { "col-md-8 col-md-offset-2" } , 
  element h2 { 
  attribute class {"intro-text"},
  $cell
  }
   }
};

(: css grid cells :)
declare function croala:cell2 ($cell as xs:string+) {
element div { attribute class { "col-md-6" } , 
  element p { 
  attribute class {"intro-text"},
  $cell
  }
   }
};

(: table cells :)
declare function croala:tbl ($td as xs:string+) {
  for $a in $td return element td { $a }
};



(: link for CroALa / solr :)
declare function croala:link ($term) {
  replace ("http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=croala&amp;word=REPLACEXXX&amp;OUTPUT=kwic", "REPLACEXXX", $term)
};



declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare %rest:GET %rest:POST %rest:path("ghlh-start")
function page:ghlh-start() { 

(: Report number of sentences in ghlh, offer links to functions :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)

(: HTML template starts here :)

<html>
<head><title>GHLH korpus - BaseX</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<!-- Bootstrap Core CSS -->
    <link href="static/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="static/dist/css/grayscaleg.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="static/dist/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css"/>
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js does not work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="intro">
<div class="intro-body">
<div class="container">
<h1 class="brand-heading">GHLH korpus</h1>
<h2 class="intro-text">Paralelni grčko-hrvatski i latinsko-hrvatski korpus Sveučilišta u Zagrebu <br/> kao baza podataka <a href="http://basex.org/">BaseX</a></h2>
<p class="intro-text">Filozofski fakultet Sveučilišta u Zagrebu, <a href="http://www.ffzg.unizg.hr/klafil/">Odsjek za klasičnu filologiju</a>, { current-date() }</p>

{

let $posto := round(croala:aligncount("L1") div (croala:wordcount("L1") div 100))
let $posto2 := round(croala:aligncount("L2") div (croala:wordcount("L2") div 100))
return
element div {
element div { 
  attribute class { "row" } ,

  
  croala:cell("Ukupno rečenica: " || croala:sentcount()) },
  element div { 
  attribute class { "row" } ,
  croala:cell2("Grčkih: " || croala:sentlangcount("grc")), 
  croala:cell2("Latinskih: " || croala:sentlangcount("lat")) ,
croala:cell( "Broj riječi izvornika: " || croala:wordcount("L1")),
croala:cell ( "Broj riječi prijevoda: " || croala:wordcount("L2")),
croala:cell2( "Povezanih riječi izvornika: " || croala:aligncount("L1") || " (" ||  $posto || "%) " ),
croala:cell2( "Povezanih riječi prijevoda: " || croala:aligncount("L2") || " (" ||  $posto2 || "%) " )
}
}


}
</div>
</div>
</div>
<div class="container text-center">
<h2 class="about">Analize</h2>
</div>
<!-- uredništvo -->
<!-- Contact Section -->
    <section id="contact" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Impressum</h2>
                
    <p><b>Urednici</b>: Šime Demo, Neven Jovanović, Vlado Rezar, Petra Šoštarić, Luka Špoljarić</p>
     <p><b>Povezivanje</b>: Jelena Banjac, Dajana Ćosić, Tamara Dujmović, Ana Katarina Gorički, Lovorka Lučić, Matea Mrgan, Nives Pantar, Josip Parat, Barbara Pavlek, Milan Podgornjak, Filip Šarić, Jan Šipoš, Magdalena Štefanić, Maja Tabak Demo</p>
    
    <p>Filozofski fakultet Sveučilišta u Zagrebu, siječnja 2015.</p>
    </div>
                <div class="col-lg-8 col-lg-offset-2">
                <p>Kontakt: <a href="mailto:neven.jovanovic@ffzg.hr">neven.jovanovic@ffzg.hr</a>
                </p>
                </div>
                
                <div class="col-lg-8 col-lg-offset-2">
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="http://crotyr.hypotheses.org/" class="btn btn-default btn-lg"><i class="fa fa-wifi fa-fw"></i> <span class="network-name">Blog</span></a>
                    </li>
                    <li>
                        <a href="https://bitbucket.org/nevenjovanovic/ghlh-corpus" class="btn btn-default btn-lg"><i class="fa fa-bitbucket fa-fw"></i> <span class="network-name">Bitbucket</span></a>
                    </li>
                    <li>
                        <a href="http://solr.ffzg.hr/dokuwiki/doku.php/z:ghlh" class="btn btn-default btn-lg"><i class="fa fa-database fa-fw"></i> <span class="network-name">Wiki</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

<!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Notitia legalis (CC-BY) 
    <br />Djelo <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">GHLH korpus</span>, čiji je autor <a xmlns:cc="http://creativecommons.org/ns#" href="http://croala.ffzg.unizg.hr/intro" property="cc:attributionName" rel="cc:attributionURL">znanstveni projekt "Digitalizacija hrvatskih latinista"</a>, ustupljeno je pod licencom <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Imenovanje 4.0 međunarodna</a>.<br/><a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons licenca" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a></p>
        </div>
    </footer>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
};



return
