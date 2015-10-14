(:~
 : This module contains some basic examples for RESTXQ annotations and some croalabib queries
 : @author BaseX Team, Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';



(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:start()
  as element(Q{http://www.w3.org/1999/xhtml}html)
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>: croalabib :</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
    </head>
    <body>
    <div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container-fluid">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> Croatiae auctorum Latinorum bibliographia: <small>BaseX + TEI XML</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>

      <div class="container-fluid">
      <blockquote class="croala">
			<ul>
			<li>Tituli: { croala:bibcount() }</li>
			<li>Personae: { croala:perscount() }</li>
			<li>Opera: { croala:opcount() }</li>
			<li>Manuscripta: { croala:mscount() }</li>
			<li>Exemplaria: { croala:itemcount() }</li>
			<li>Digitalia: { croala:digicount() }</li>
			</ul>
      </blockquote>
      </div>
</div>
<div class="row">
      <div class="container-fluid col-sm-6">
      <h3>Search authors in croalabib db</h3>
 <p>Enter name, or part of name, of a Croatian Latin author (reproduce the capitalization).</p>
      <form method="post" action="nominaxq">
        <p>E. g. <b>Marulić</b>:<br />
        <input name="nomq" size="50"></input>
        <input type="submit" /></p>
      </form>
      </div>
      <div class="container-fluid col-sm-6">
      <h3>Search for works in croalabib by author</h3>
 <p>Enter name, or part of name, of a Croatian Latin author (capitalization is important).</p>
      <form method="post" action="nomid">
        <p>Name:<br />
        <input name="nomid" size="50"></input>
        <input type="submit" /></p>
      </form>
      </div>
      </div>
      <div class="row">
      <div class="container-fluid col-sm-6">
      <h3>Works in croalabib db</h3>
 <p>Enter part of title of work (as opposed to manifestation). Wildcards possible (e. g. <b>oratio.*</b> = orationem, orationis...)</p>
      <form method="post" action="croalabib-opera">
        <p>Words from work title:<br />
        <input name="opq" size="50"></input>
        <input type="submit" /></p>
      </form>
     </div>
      <div class="container-fluid col-sm-6">
      
      
      <h3>Parse words from Latin sentence</h3>
 <p>Enter a Latin sentence which you want to parse. 
    The result will be an XML file with lots of grammatical
    information for each word.</p>
      <form method="post" action="homon">
        <p>Sententia:<br />
        <input name="message" size="50"></input>
        <input type="submit" /></p>
      </form>
      </div>
</div>
<hr/>
{ croala:footer() }
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
  %rest:path("/hello/{$world}")
  %rest:GET
  function page:hello(
    $world as xs:string)
    as element(response)
{
  <response>
    <title>Hello { $world }!</title>
    <time>The current time is: { current-time() }</time>
  </response>
};

(:~
 : This function returns the result of a form request.
 : @param  $message  message to be included in the response
 : @param $agent  user agent string
 : @return response element 
 :)
declare
  %rest:path("/form")
  %rest:POST
  %rest:form-param("message","{$message}", "(no message)")
  %rest:header-param("User-Agent", "{$agent}")
  function page:hello-postman(
    $message as xs:string,
    $agent   as xs:string*)
    as element(response)
{
  <response type='form'>
    <message>{ $message }</message>
    <user-agent>{ $agent }</user-agent>
  </response>
};

(:~
 : This function returns lexical information on words from a form request.
 : @param  $message  message to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/homon")
  %rest:POST
  %rest:form-param("message","{$message}", "(no message)")
  function page:homon-postman(
    $message as xs:string)
    { let $url := ("http://services.perseids.org/bsp/morphologyservice/analysis/word?word=RIJEC&amp;lang=lat&amp;engine=morpheuslat")
		(: convert string into sequence :)
let $rijeci := tokenize($message, "\W+")
(: for each item in sequence :)
return element w { for $r in $rijeci
let $parsed := (doc(replace($url,'RIJEC',$r)))
return element ana { $parsed } }
};

(:~
 : A free-form XQuery.
 :)

(:~
 : Search for names.
 :)
declare
  %rest:path("/nominaxq")
  %rest:POST
  %rest:form-param("nomq","{$nomq}", "(no nomq)")
  function page:cpxq-nomina(
    $nomq as xs:string)
    { 
		element p { 
		let $nomqq := $nomq || '.*'
			for $i in collection('croalabib')//*:person/*:persName[text() contains text {$nomqq} using wildcards]
	        return element v {$i/../@xml:id , $i } }
};



(:~
 : Get all entries with an ID from the name.
 :)
declare
  %rest:path("/nomid")
  %rest:POST
  %rest:form-param("nomid","{$nomid}", "(no nomid)")
  function page:cpxq-nomid(
    $nomid as xs:string)
    { 
		element p { 
		let $nomidd := $nomid || '.*'
		 for $aref in collection('croalabib')//*:person[*:persName[text() contains text {$nomidd} using wildcards]]/@xml:id
         let $elem := (collection('croalabib')//*:biblStruct)|(collection('croalabib')//*:bibl)|(collection('croalabib')//*:msDesc)|(collection('croalabib')//*:person)
		 return $elem[descendant::*:ref[@target[. eq $aref]]]
	 }
};


return
