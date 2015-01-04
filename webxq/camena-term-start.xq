(: CAMENA TERMINI - startpage: report on all entries, link functions :)
import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: count number of rows / term entries :)
declare function croala:cnt () {
  count(collection("camenatermini")/table/tr)
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


declare %rest:GET %rest:POST %rest:path("camenaterm-start")
function page:camenaterm-start() { 

(: Report number of terms in CAMENA TERMINI, offer links to functions :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)

(: HTML template starts here :)

<html>
<head><title>CAMENA TERMINI - BaseX</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/camterm.css"/>
<!-- Bootstrap Core CSS -->
    <link href="static/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="static/dist/css/grayscale.css" rel="stylesheet"/>

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
<h1 class="brand-heading">CAMENA TERMINI</h1>
<h2 class="intro-text">under <a href="http://basex.org/">BaseX</a></h2>
<p class="intro-text"><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }</p>

{

element div {  
  element p { "Termini omnes: " , croala:cnt() } ,
  element div { 
  attribute class { "row" } ,
  element div { attribute class { "col-md-4" } , 
  element h2 { 
  attribute class {"intro-text"},
  "See a random term " ,
  element i { attribute class { "fa fa-toggle-right fa-fw"} } , 
  element a { attribute href {"camenaterm-rnd"} , "here" 
  }
  }
   } , 
  element div { attribute class { "col-md-4" } , 
  element h2 {
    attribute class {"intro-text"},
  "First 100 beginning with the ", 
  element i { attribute class { "fa fa-toggle-right fa-fw"} } , 
  element a { attribute href {"camenaterm-l"} , "letter C" }
  }
  } ,
  element div { attribute class { "col-md-4" } , 
    element h2 { 
      attribute class {"intro-text"},
    "In the browser address bar,",
    element br {} ,
    "any capital letter gets a list of terms: ", 
        element br {} ,
    element i { attribute class { "fa fa-toggle-right fa-fw"} } , 
	element a { attribute href {"camenatermini-letter/A"} , "camenatermini-letter/A" } ,
	    element br {} ,
	element i { attribute class { "fa fa-toggle-right fa-fw"} } , 
	element a { attribute href {"camenatermini-letter/Z"} , "camenatermini-letter/Z" }
	}
  }
}
}
}
</div>
</div>
</div>
<div class="container text-center">
<h2 class="about">Croatica et Tyrolensia</h2>
</div>
</body>
</html>
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
   %rest:GET %rest:POST %rest:path("/camenatermini-letter/{$world}")
  function page:camenatermini-letter(
    $world)
        as element(html)

{
    <html>
    <h1>TERMINI in {$world}!</h1>
    <div>The current time is: { current-time() }</div>
    <div>{ for $a in collection("camenatermini")/table/tr
    where starts-with(data($a/td[1]/b), $world)
    return $a/td[1]/b }</div>
    
  </html>
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
   %rest:GET %rest:POST %rest:path("/camenaterm-rnd")
  function page:camenaterm-rnd()
        as element(html)

{
    <html>
    <h1>Terminus quilibet!</h1>
    <div>The current time is: { current-time() }</div>
    <table>{ 
    let $b := 
for $a in collection("camenatermini")/table/tr
return $a
let $rng := random:integer(116404)
return $b[$rng + 1]
     }</table>
    <div>
    <p>
    <a href="camenaterm-start">Retro</a>
    </p>
    </div>
  </html>
};

return
