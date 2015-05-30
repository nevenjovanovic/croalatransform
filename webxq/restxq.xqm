(:~
 : This module contains some basic examples for RESTXQ annotations and some croalabib queries
 : @author BaseX Team, Neven Jovanović
 :)
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: round a number :)
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

(: count titles total :)
declare function croala:bibcount() {
count( collection("croalabib")//*:listBibl/(*:bibl|*:biblStruct)
)
};



(: count persons total :)
declare function croala:perscount() {
count( collection("croalabib")//*:listPerson/*:person
)
};
(: count mss total :)
declare function croala:mscount() {
count( collection("croalabib")//*:msDesc
)
};
(: count works total :)
declare function croala:opcount() {
count( collection("croalabib")//*:listBibl[@ana='croala.opera']/*:bibl
)
};
(: count exemplars total :)
declare function croala:itemcount() {
count( collection("croalabib")//*:relatedItem[*:ref/@target]
)
};
(: count digital total :)
declare function croala:digicount() {
count( collection("croalabib")//*:relatedItem[descendant-or-self::*[contains(@type, "internet")]]
)
};
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
      <title>Croatiae auctores Latini DB</title>
      <link rel="stylesheet" type="text/css" href="static/style.css"/>
    </head>
    <body>
      <div class="right"><img src="static/morlaque.jpg"/></div>
      <h2>Croatiae auctorum Latinorum bibliographia: BaseX + TEI XML</h2>
			<div>Croatica et Tyrolensia, { replace(proc:system('date', '-I'), '\n', '') }.</div>
			<div>
			<ul>
			<li>Tituli: { croala:bibcount() }</li>
			<li>Personae: { croala:perscount() }</li>
			<li>Opera: { croala:opcount() }</li>
			<li>Manuscripta: { croala:mscount() }</li>
			<li>Exemplaria: { croala:itemcount() }</li>
			<li>Digitalia: { croala:digicount() }</li>
			</ul></div>
			
      
      <h3>Search authors in croalabib db</h3>
 <p>Enter name, or part of name, of a Croatian Latin author (reproduce the capitalization).</p>
      <form method="post" action="nominaxq">
        <p>E. g. <b>Marulić</b>:<br />
        <input name="nomq" size="50"></input>
        <input type="submit" /></p>
      </form>
      
      <h3>Search for works by an author in croalabib db</h3>
 <p>Enter name, or part of name, of a Croatian Latin author (capitalization is important).</p>
      <form method="post" action="nomid">
        <p>Name:<br />
        <input name="nomid" size="50"></input>
        <input type="submit" /></p>
      </form>
      
      <h3>Works in croalabib db</h3>
 <p>Enter part of title of work (as opposed to manifestation). Wildcards possible (e. g. <b>oratio.*</b> = orationem, orationis...)</p>
      <form method="post" action="croalabib-opera">
        <p>Words from work title:<br />
        <input name="opq" size="50"></input>
        <input type="submit" /></p>
      </form>
      <br/>
      
      <h3>Write an XQuery</h3>
 <p>Compose your own <a href="www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:basex-adv">XQuery</a>.</p>
      <form method="post" action="compoxq">
        <p>XQuery:<br />
        <textarea name="query" rows="5" cols="80"></textarea><br/>
        <input type="submit" /></p>
      </form>
      <h3>Parse words from Latin sentence</h3>
 <p>Enter a Latin sentence which you want to parse. 
    The result will be an XML file with lots of grammatical
    information for each word.</p>
      <form method="post" action="homon">
        <p>Sententia:<br />
        <input name="message" size="50"></input>
        <input type="submit" /></p>
      </form>


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
			for $i in collection('croalabib')//*:person/*:persName[contains(text(), $nomq)]
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
		 for $aref in collection('croalabib')//*:person[*:persName[contains(text(), $nomid)]]/@xml:id
         let $elem := (collection('croalabib')//*:biblStruct)|(collection('croalabib')//*:bibl)|(collection('croalabib')//*:msDesc)|(collection('croalabib')//*:person)
		 return $elem[descendant::*:ref[@target[. eq $aref]]]
	 }
};


return
