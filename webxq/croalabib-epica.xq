import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace db = 'http://basex.org/modules/db';
declare namespace proc = 'http://basex.org/modules/proc';
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare %rest:GET %rest:POST %rest:path("croalabib-epica")

function page:croalabib-epica() { 

(: HTML template starts here :)


    
    

<html>
<head><title>CroalaBib: annotationes</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
      <div class="right"><img src="static/morlaque.jpg"  align="right"/></div>

<h2>CroalaBib: annotationes</h2>
<div><p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }. Functio nominatur: {rest:uri()}</p></div>

      <form method="post" action="croalabib-ep2">
        <p>Siglum quaere (e. g. 'gen.b2' <i>poesis epica omnimoda</i>):<br />
        <input name="epq" size="50"></input>
        <input type="submit" /></p>
      </form>
 <table>
 <tr>
   <td>gen.b2</td>
   <td>Epska poezija</td>
</tr>
<tr>
   <td>gen.b2.1</td>
   <td>Epska pjesma</td>
</tr>
<tr>
   <td>gen.b2.2</td>
   <td>Epilij</td>
</tr>
<tr>
   <td>gen.b2.3</td>
   <td>Poema, herojska</td>
</tr>
<tr>
   <td>gen.b2.4</td>
   <td>Ep</td>
</tr>
<tr>
   <td>gen.b2.4.0</td>
   <td>Junački ep</td>
</tr>
<tr>
   <td>gen.b2.4.0.1</td>
   <td>Junački ep - kršćanski</td>
</tr>
<tr>
   <td>gen.b2.4.0.2</td>
   <td>Junački ep - povijesni</td>
</tr>
<tr>
   <td>gen.b2.4.0.3</td>
   <td>Junački ep - alegorija</td>
</tr>
<tr>
   <td>gen.b2.4.1</td>
   <td>Poučni ep (didaktički ep, poučni spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.2</td>
   <td>Lokalni ep (lokalni spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.3</td>
   <td>Alegorijski ep (alegorijski spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.4</td>
   <td>Autobiografski ep (autobiografski spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.5</td>
   <td>Biblijski ep (biblijski spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.6</td>
   <td>Kršćanski ep (kršćanski spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.6.1</td>
   <td>Kršćanski ep - alegorija (kršćanski spjev - alegorija) </td>
</tr>
<tr>
   <td>gen.b2.4.7</td>
   <td>Povijesni ep (povijesni spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.8</td>
   <td>Filozofski ep (filozofski spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.9</td>
   <td>Nedovršen ep (nedovršen spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.10</td>
   <td>Makaronski ep (makaronski spjev) </td>
</tr>
<tr>
   <td>gen.b2.4.11</td>
   <td>Epsko djelo - samoproglašeno</td>
</tr>
<tr>
   <td>gen.d</td>
   <td>Prijevodna književnost</td>
</tr>
<tr>
   <td>gen.d1</td>
   <td>Prijevodi religioznih i homiletičkih djela</td>
</tr>
<tr>
   <td>gen.d2</td>
   <td>Prijevodi s engleskog</td>
</tr>
<tr>
   <td>gen.d3</td>
   <td>Prijevodi s grčkog</td>
</tr>
<tr>
   <td>gen.d3.1</td>
   <td>Prijevod s grčkog u prozi</td>
</tr>
<tr>
   <td>gen.d3.2</td>
   <td>Prijevod s grčkog u stihovima</td>
</tr>
<tr>
   <td>gen.d4</td>
   <td>Prijevodi s hrvatskog</td>
</tr>
<tr>
   <td>gen.d4.1</td>
   <td>Prijevod vlastitog djela s hrvatskog</td>
</tr>
<tr>
   <td>gen.d4.2</td>
   <td>Prijevod s hrvatskog u prozi</td>
</tr>
<tr>
   <td>gen.d4.3</td>
   <td>Prijevod s hrvatskog u stihovima</td>
</tr>
<tr>
   <td>gen.d5</td>
   <td>Prijevodi s talijanskog</td>
</tr>
<tr>
   <td>gen.d5.1</td>
   <td>Prijevod s talijanskog u prozi</td>
</tr>
<tr>
   <td>gen.d5.2</td>
   <td>Prijevod s talijanskog u stihovima</td>
</tr>
<tr>
   <td>classstat-diocjel</td>
   <td>Dio veće cjeline</td>
</tr>
<tr>
   <td>classstat-nedovr</td>
   <td>Sačuvano, nedovršeno.</td>
</tr>
<tr>
   <td>classstat-cj</td>
   <td>Sačuvano u cijelosti.</td>
</tr>
<tr>
   <td>classstat-fragm</td>
   <td>Sačuvano fragmentarno (djelomično).</td>
</tr>
<tr>
   <td>classstat-izg</td>
   <td>Izgubljeno (nesačuvano).</td>
</tr>
<tr>
   <td>classstat-rkp</td>
   <td>Sačuvano u rukopisu.</td>
</tr>
<tr>
   <td>classstat-rkp-autogr</td>
   <td>Sačuvano u rukopisu - autograf.</td>
</tr>
<tr>
   <td>classstat-obj</td>
   <td>Objavljeno tiskom.</td>
</tr>
<tr>
   <td>classstat-obj-kritizd</td>
   <td>Objavljeno tiskom - kritičko izdanje.</td>
</tr>
<tr>
   <td>classstat-obj-prijevod</td>
   <td>Objavljeno tiskom - u prijevodu.</td>
</tr>
<tr>
   <td>classstat-obj-djelom</td>
   <td>Djelomično objavljeno tiskom.</td>
</tr>
<tr>
   <td>classstat-obj-navod</td>
   <td>Navodno objavljeno tiskom.</td>
</tr>
<tr>
   <td>classstat-obj-digital</td>
   <td>Objavljeno - digitalno izdanje.</td>
</tr>
<tr>
   <td>classstat-obj-digital-internet</td>
   <td>Objavljeno - digitalno izdanje na internetu.</td>
</tr>

 </table>
 </body>
  </html>
};

return