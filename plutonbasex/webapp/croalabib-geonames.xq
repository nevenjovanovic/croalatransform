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
declare %rest:GET %rest:POST %rest:path("croalabib-geo")
function page:croalabib-geo() { 

(: Create index of names by sessions and months :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: ubi libri in lucem prodiere</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: ubi libri in lucem prodiere</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table width="100%">
    
    <thead>
      <tr>
          <td>Urbs</td>
          <td>In GeoNames</td>
          <td>Quoties in croalabib</td>
          <td>Ubi in croalabib</td>
      </tr>
    </thead>
    <tbody>{ 
(: The actual XQuery starts here :)
let $doc := collection("croalabib")//tei:body
    let $string := "http://solr.ffzg.hr/basex/geonamref?var=BROJ"
    let $geostring := "http://api.geonames.org/get?geonameId=BROJ&amp;username=nevenjovanovic"
let $a := 
<r>
   <lemma>
      <w>A Paris</w>
      <n>Paris</n>
      <l type="geonames">2988507</l>
   </lemma>
   
   
   
   
   <lemma>
      <w>Alessandria</w>
      <n>Alessandria</n>
      <l type="geonames">3183299</l>
   </lemma>
   <lemma>
      <w>Alexandriae</w>
      <n>Alessandria</n>
      <l type="geonames">3183299</l>
   </lemma>
   
   
   
   
   
   
   
   
   <lemma>
      <w>Apud Sanctam Coloniam</w>
      <n>Köln</n>
      <l type="geonames">2886242</l>
   </lemma>
   <lemma>
      <w>Apud inclitam Coloniam</w>
      <n>Köln</n>
      <l type="geonames">2886242</l>
   </lemma>
   <lemma>
      <w>Apud inclytam Basileam</w>
      <n>Basel</n>
      <l type="geonames">2661604</l>
   </lemma>
   <lemma>
      <w>Aradini</w>
      <n>Arad</n>
      <l type="geonames">686253</l>
   </lemma>
   
   
   

   
   
   <lemma>
      <w>Augustae Tribantum</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Augustae Tribocorum</w>
      <n>Augsburg</n>
      <l type="geonames">2954172</l>
   </lemma>
   
   <lemma>
      <w>Augustae Vindelicorum et Graecii</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Augustae Vindelicorum et Oeniponti</w>
      <n/>
      <l/>
   </lemma>
   
   <lemma>
      <w>Bartphae</w>
      <n>Bardejov</n>
      <l type="geonames">725168</l>
   </lemma>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   <lemma>
      <w>Budae et Tyrnaviae</w>
      <n/>
      <l/>
   </lemma>
   
   <lemma>
      <w>Calocae</w>
      <n>Kalocsa</n>
      <l type="geonames">3050719</l>
   </lemma>
   <lemma>
      <w>Camberii</w>
      <n/>
      <l/>
   </lemma>
   
   <lemma>
      <w>Canthurii</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Carlostadii</w>
      <n>Karlovac</n>
      <l type="geonames">3198259</l>
   </lemma>
   <lemma>
      <w>Carolostadii</w>
      <n>Karlovac</n>
      <l type="geonames">3198259</l>
   </lemma>
   <lemma>
      <w>Carolostadii in Croatia</w>
      <n>Karlovac</n>
      <l type="geonames">3198259</l>
   </lemma>
   
   
   <lemma>
      <w>Cattopoli</w>
      <n>Giessen Marburg</n>
      <l>cnl00009442 cnl00011508</l>
   </lemma>
   <lemma>
      <w>Cesenae</w>
      <n>Cesena</n>
      <l type="geonames">3178957</l>
   </lemma>
   <lemma>
      <w>Chambery</w>
      <n>Chambery</n>
      <l type="geonames">3027422</l>
   </lemma>
   
   
   
   
   
   
   
   <lemma>
      <w>Coloniae</w>
      <n>Köln</n>
      <l type="geonames">2886242</l>
   </lemma>
   <lemma>
      <w>Coloniae Agripinae</w>
      <n>Köln</n>
      <l type="geonames">2886242</l>
   </lemma>
   <lemma>
      <w>Coloniae Agrippinae</w>
      <n>Köln</n>
      <l type="geonames">2886242</l>
   </lemma>
   <lemma>
      <w>Comaromii</w>
      <n>Komárom</n>
      <l type="geonames">3049519</l>
   </lemma>
   <lemma>
      <w>Craccoviae</w>
      <n>Kraków</n>
      <l type="geonames">3094802</l>
   </lemma>
   <lemma>
      <w>Cracoviae</w>
      <n>Kraków</n>
      <l type="geonames">3094802</l>
   </lemma>
   
   <lemma>
      <w>Czenstochowae</w>
      <n>Częstochowa</n>
      <l type="geonames">3100946</l>
   </lemma>
   
   

   
   
   

   

   
   
   
   

   
   
   
   <lemma>
      <w>Firmi</w>
      <n>Fermo Firmi</n>
      <l>cnl00022433 cnl00009120 cnl00009146</l>
   </lemma>
   
   
   
   
   
   <lemma>
      <w>Franckfurth und Leipzig</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Francoforti</w>
      <n>Frankfurt am Main</n>
      <l type="geonames">2925533</l>
   </lemma>
   
   <lemma>
      <w>Francofurdi</w>
      <n>Frankfurt am Main</n>
      <l type="geonames">2925533</l>
   </lemma>
   <lemma>
      <w>Francofurti</w>
      <n>Frankfurt am Main</n>
      <l type="geonames">2925533</l>
   </lemma>
   
   
   
   <lemma>
      <w>Francofurti et</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Francofurti et Lipsiae</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Francofurti et Spirae</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Frankofurti</w>
      <n>Frankfurt am Main</n>
      <l type="geonames">2925533</l>
   </lemma>
   <lemma>
      <w>Frankofurti ad M.</w>
      <n>Frankfurt am Main</n>
      <l type="geonames">2925533</l>
   </lemma>
   
   
   <lemma>
      <w>Garecii</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Gattapolis</w>
      <n>Giessen Perugia</n>
      <l>cnl00009442 cnl00012718</l>
   </lemma>
   
   
   
   
   <lemma>
      <w>Germania</w>
      <n>Posen Deutschland Göttingen Breslau Geneve Mannheim Belgien</n>
      <l>cnl00012937 cnl00000740 cnl00009564 cnl00007710 cnl00009361 cnl00016131 cnl00001192</l>
   </lemma>
   <lemma>
      <w>Graecomonti</w>
      <n>Zagreb</n>
      <l type="geonames">3186886</l>
   </lemma>
   <lemma>
      <w>In Firenze</w>
      <n>Firenze</n>
      <l type="geonames">3176959</l>
   </lemma>
   <lemma>
      <w>In Fiume</w>
      <n>Rijeka</n>
      <l type="geonames">3191648</l>
   </lemma>
   <lemma>
      <w>In Lucca</w>
      <n>Lucca</n>
      <l type="geonames">3174530</l>
   </lemma>
   <lemma>
      <w>In Padova</w>
      <n>Padova</n>
      <l type="geonames">3171728</l>
   </lemma>
   <lemma>
      <w>In Pathmo</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>In Roma</w>
      <n>Roma</n>
      <l type="geonames">3169070</l>
   </lemma>
   <lemma>
      <w>In Udine</w>
      <n>Udine</n>
      <l type="geonames">3165072</l>
   </lemma>
   <lemma>
      <w>In Venetia</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>In Venetiia</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>In Venezia</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>In Wagensperg</w>
      <n/>
      <l/>
   </lemma>
   
   
   
   
   
   
   
   <lemma>
      <w>Irenopoli</w>
      <n> Weria Amsterdam</n>
      <l>cnl00006149 cnl00000506 cnl00016270</l>
   </lemma>
   
   
   


   
   
   
   
   
   

   
   <lemma>
      <w>Laybach-Nuernberg</w>
      <n/>
      <l/>
   </lemma>
   

   <lemma>
      <w>Lemoviciis</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Leopoli</w>
      <n>Leopolis L'viv</n>
      <l>cnl00016603 cnl00010853</l>
   </lemma>

   
   
   
   
   
   
   
   <lemma>
      <w>Loreto</w>
      <n>Loreto</n>
      <l type="geonames">3174567</l>
   </lemma>
   <lemma>
      <w>Loretto</w>
      <n>Loreto</n>
      <l type="geonames">3174567</l>
   </lemma>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   <lemma>
      <w>Magno-Karolini</w>
      <n/>
      <l/>
   </lemma>


   
   
   
   
   
   
   
   

   
   
   
   
   
   

   
   
   
   <lemma>
      <w>Nancy</w>
      <n>Nancy</n>
      <l type="geonames">2990999</l>
   </lemma>
   
   
   
   <lemma>
      <w>Neoburgi</w>
      <n>Neuburg an der Donau Neuburg</n>
      <l>cnl00012125 cnl00001015</l>
   </lemma>
   <lemma>
      <w>Neoplantae</w>
      <n>Novi Sad</n>
      <l type="geonames">3194360</l>
   </lemma>
   <lemma>
      <w>Neosolii</w>
      <n>Banská Bystrica</n>
      <l type="geonames">3061186</l>
   </lemma>
   
   
   
   
   
   
   

   


   
   
   
   
   
   
   
   
   
   
   <lemma>
      <w>Pampelonae</w>
      <n/>
      <l/>
   </lemma>
   
   
   
   
   
   
   
   
   
   
   
   
   

   

   <lemma>
      <w>Phariae</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Philadelphiae</w>
      <n/>
      <l/>
   </lemma>
   
   <lemma>
      <w>Poczaioviae</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Pontidae</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Poperingis</w>
      <n/>
      <l/>
   </lemma>
   
   
   <lemma>
      <w>Posonii et Pestini</w>
      <n/>
      <l/>
   </lemma>
   
   
   <lemma>
      <w>Pri Sz. Krisi</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Pristinae</w>
      <n/>
      <l/>
   </lemma>
   
   
   


   


   


   
   
   
   
   <lemma>
      <w>Regii Lepidi</w>
      <n>Reggio nell'Emilia</n>
      <l type="geonames">3169522</l>
   </lemma>
   
   
   


   
   <lemma>
      <w>Ripae</w>
      <n>Ribben Riva</n>
      <l>cnl00013238 cnl00013216</l>
   </lemma>
   
   
   <lemma>
      <w>Romae - Venetiis</w>
      <n/>
      <l/>
   </lemma>
   
   
   
   
   
   
   
   
   

   
   
   
   <lemma>
      <w>Sundii</w>
      <n>Stralsund</n>
      <l type="geonames">2826287</l>
   </lemma>
   <lemma>
      <w>Szakolczae</w>
      <n>Skalica</n>
      <l type="geonames">3057630</l>
   </lemma>

   
   
   
   

   
   
   <lemma>
      <w>Tiguri</w>
      <n>Tegernsee Zürich</n>
      <l>cnl00016235 cnl00015710</l>
   </lemma>
   
   
   
   
   

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   <lemma>
      <w>U Loretu</w>
      <n>Loreto</n>
      <l type="geonames">3174567</l>
   </lemma>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   <lemma>
      <w>V. Ecclesiis</w>
      <n>Pécs</n>
      <l type="geonames">3046526</l>
   </lemma>
   


   
   
   
   <lemma>
      <w>Venetiis ac Bassani</w>
      <n/>
      <l/>
   </lemma>
   

   <lemma>
      <w>Verioduni</w>
      <n>Verdun</n>
      <l type="geonames">2969958</l>
   </lemma>
   
   
   

   
   
   
   
   
   
   
   
   <lemma>
      <w>Viennae et Tergesti</w>
      <n/>
      <l/>
   </lemma>
   <lemma>
      <w>Viennae et Zagrabiae</w>
      <n/>
      <l/>
   </lemma>
   
   
   
   <lemma>
      <w>Vindobonae - Posonii</w>
      <n/>
      <l/>
   </lemma>

   
   
   

   
   
   
   
   
   <lemma>
      <w>Vu Ternavi</w>
      <n>Trnava</n>
      <l type="geonames">3057124</l>
   </lemma>
   
   
   <lemma>
      <w>Wagenspergi in Carniolia</w>
      <n/>
      <l/>
   </lemma>
   
   <lemma>
      <w>Wiceburgi</w>
      <n/>
      <l/>
   </lemma>
   
   
   
   
   
   

   


   

   
  <!-- dopunjeni na geonames: -->
  <lemma>
      <w>Atverpiae</w>
      <n>Antwerpen</n>
      <l type="geonames">2803138</l>
  </lemma>
  <lemma>
      <w>Diakovae</w>
      <n>Đakovo</n>
      <l type="geonames">3200746</l>
  </lemma>
  <lemma>
      <w>Eperjessini</w>
      <n>Prešov</n>
      <l type="geonames">723819</l>
  </lemma>
  <lemma>
      <w>Esekini</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
  </lemma>
  <lemma>
      <w>Eszekini</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
  </lemma>
  <lemma>
      <w>Iaderae</w>
      <n>Zadar</n>
      <l type="geonames">3186952</l>
  </lemma>
  <lemma>
      <w>Iadrae</w>
      <n>Zadar</n>
      <l type="geonames">3186952</l>
  </lemma>
  <lemma>
      <w>Iaurini</w>
      <n>Győr</n>
      <l type="geonames">3052009</l>
  </lemma>
  <lemma>
      <w>Illokini</w>
      <n>Ilok</n>
      <l type="geonames">3199128</l>
  </lemma>
  <lemma>
      <w>Jaderae</w>
      <n>Zadar</n>
      <l type="geonames">3186952</l>
  </lemma>
  <lemma>
      <w>Jadrae</w>
      <n>Zadar</n>
      <l type="geonames">3186952</l>
  </lemma>
  <lemma>
      <w>Laureti</w>
      <n>Loreto</n>
     <l type="geonames">3174567</l>
  </lemma>
  <lemma>
      <w>Leipzig</w>
      <n>Leipzig</n>
      <l type="geonames">2879139</l>
  </lemma>
  <lemma>
      <w>Leutschoviae</w>
      <n>Levoča</n>
      <l type="geonames">724294</l>
  </lemma>
  <lemma>
      <w>Magdenburgae</w>
      <n>Magdeburg</n>
      <l type="geonames">2874545</l>
  </lemma>
  <lemma>
      <w>Magno-Varadini</w>
      <n>Oradea</n>
      <l type="geonames">671768</l>
  </lemma>
  <lemma>
      <w>Magnovaradini</w>
      <n>Oradea</n>
      <l type="geonames">671768</l>
  </lemma>
  <lemma>
      <w>Mnetiem</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
  </lemma>
  <lemma>
      <w>Mursae</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
  </lemma>
  <lemma>
      <w>Nuernberg</w>
      <n>Nürnberg</n>
      <l type="geonames">2861650</l>
  </lemma>
  <lemma>
      <w>Nurimbergae</w>
      <n>Nürnberg</n>
      <l type="geonames">2861650</l>
  </lemma>
  <lemma>
      <w>Ofen</w>
      <n>Budapest</n>
      <l type="geonames">3054643</l>
  </lemma>
  <lemma>
      <w>Pestini-Budae</w>
      <n>Budapest</n>
      <l type="geonames">3054643</l>
  </lemma>
  <lemma>
      <w>Petrovaradini</w>
      <n>Petrovaradin</n>
      <l type="geonames">3193406</l>
  </lemma>
  <lemma>
      <w>Quinqueecclesiis</w>
      <n>Pécs</n>
      <l type="geonames">3046526</l>
  </lemma>
  <lemma>
      <w>Rachusae</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
  </lemma>
  <lemma>
      <w>Racusae</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
  </lemma>
  <lemma>
      <w>Racusii</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
  </lemma>
  <lemma>
      <w>Ragusae</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
  </lemma>
  <lemma>
      <w>Ragusii</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
  </lemma>
  <lemma>
      <w>Rhacusae</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
  </lemma>
  <lemma>
      <w>Rhacusii</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
  </lemma>
  <lemma>
      <w>Spalati</w>
      <n>Split</n>
      <l type="geonames">3190261</l>
  </lemma>
  <lemma>
      <w>Szegedini</w>
      <n>Szeged</n>
      <l type="geonames">715429</l>
  </lemma>
  <lemma>
      <w>Tholosae</w>
      <n>Toulouse</n>
      <l type="geonames">2972315</l>
  </lemma>
  <lemma>
      <w>Trenchinii</w>
      <n>Trenčín</n>
      <l type="geonames">3057140</l>
  </lemma>
  <lemma>
      <w>Varasdini</w>
      <n>Varaždin</n>
      <l type="geonames">3188383</l>
  </lemma>
  <lemma>
      <w>Varasdinii</w>
      <n>Varaždin</n>
      <l type="geonames">3188383</l>
  </lemma>
  <lemma>
      <w>Venezia</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
  </lemma>
  <lemma>
      <w>Veszprimii</w>
      <n>Veszprém</n>
      <l type="geonames">3042929</l>
  </lemma>
  <lemma>
      <w>Vinegia</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
  </lemma>
  <lemma>
      <w>Viterbii</w>
      <n>Viterbo</n>
      <l type="geonames">3164039</l>
  </lemma>
  <lemma>
      <w>Wratislawiae</w>
      <n>Bratislava</n>
      <l type="geonames">3060972</l>
  </lemma>
  <lemma>
      <w>Zagrabiae-Graecomonti</w>
      <n>Zagreb</n>
      <l type="geonames">3186886</l>
  </lemma>
  <lemma>
      <w>Zagreabiae</w>
      <n>Zagreb</n>
      <l type="geonames">3186886</l>
  </lemma>
  <lemma>
      <w>Zara</w>
      <n>Zadar</n>
      <l type="geonames">3186952</l>
  </lemma>
   <!-- drugi prolaz -->
   <lemma>
      <w>In Zara</w>
      <n>Zadar</n>
      <l type="geonames">3186952</l>
   </lemma>
   <lemma>
      <w>In alma Taurinensi civitate</w>
      <n>Torino</n>
      <l type="geonames">3165524</l>
   </lemma>
   <lemma>
      <w>In metropoli Slavoniae Essekini</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>In urbe Cracovia</w>
      <n>Kraków</n>
      <l type="geonames">3094802</l>
   </lemma>
   <lemma>
      <w>In urbe Veneta</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>In veteri Vangionum Vormatia</w>
      <n>Worms</n>
      <l type="geonames">2806142</l>
   </lemma>
   <lemma>
      <w>Neo Pragae</w>
      <n>Prag</n>
      <l type="geonames">3067696</l>
   </lemma>
   <lemma>
      <w>Quinque Ecclesiis</w>
      <n>Pécs</n>
      <l type="geonames">3046526</l>
   </lemma>
   <lemma>
      <w>Traiecti ad Renum</w>
      <n>Utrecht</n>
      <l type="geonames">2745912</l>
   </lemma>
   <lemma>
      <w>U Bechu</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>U Bechu vu Austrie</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>U Becsu</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>U Becsu (Vienna)</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>U Bnecih</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>U Bnezieh</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>U Bolonji</w>
      <n>Bologna</n>
      <l type="geonames">3181928</l>
   </lemma>
   <lemma>
      <w>U Dubrovniku</w>
      <n>Dubrovnik</n>
      <l type="geonames">3201047</l>
   </lemma>
   <lemma>
      <w>U Gradczu</w>
      <n>Graz</n>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>U Jakinu</w>
      <n>Ancona</n>
      <l type="geonames">3183089</l>
   </lemma>
   <lemma>
      <w>U Lincu</w>
      <n>Linz</n>
      <l type="geonames">2772400</l>
   </lemma>
   <lemma>
      <w>U Mlecie</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>U Mleczi</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>U Mletcih</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>U Mletiem</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>U Mlezieh</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>U Nemskom Gradczu</w>
      <n>Graz</n>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>U Ossiku</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>U Rimu</w>
      <n>Roma</n>
      <l type="geonames">3169070</l>
   </lemma>
   <lemma>
      <w>U Splitu</w>
      <n>Split</n>
      <l type="geonames">3190261</l>
   </lemma>
   <lemma>
      <w>U Varašdinu</w>
      <n>Varaždin</n>
      <l type="geonames">3188383</l>
   </lemma>
   <lemma>
      <w>U Zadru</w>
      <n>Zadar</n>
      <l type="geonames">3186952</l>
   </lemma>
   <lemma>
      <w>U Zagrebu</w>
      <n>Zagreb</n>
      <l type="geonames">3186886</l>
   </lemma>
   <lemma>
      <w>V Lublane</w>
      <n>Ljubljana</n>
      <l type="geonames">3196359</l>
   </lemma>
   <lemma>
      <w>V Nedelischu</w>
      <n>Nedelišće</n>
      <l type="geonames">3194559</l>
   </lemma>
   <lemma>
      <w>V Nemskom Gradczu</w>
      <n>Graz</n>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>V Rimu</w>
      <n>Roma</n>
      <l type="geonames">3169070</l>
   </lemma>
   <lemma>
      <w>V Bnecih</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>Vesuntione Sequanorum</w>
      <n>Besançon</n>
      <l type="geonames">3033123</l>
   </lemma>
   <lemma>
      <w>Viennae Austrija</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Viennae in Austria</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Vu Bechu</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Vu Budimu</w>
      <n>Budapest</n>
      <l type="geonames">3054643</l>
   </lemma>
   <lemma>
      <w>Vu Gradczu</w>
      <n>Graz</n>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>Vu Varasdinu</w>
      <n>Varaždin</n>
      <l type="geonames">3188383</l>
   </lemma>
   <lemma>
      <w>Vu Zagrebu</w>
      <n>Zagreb</n>
      <l type="geonames">3186886</l>
   </lemma>
   <lemma>
      <w>Zu Laybach</w>
      <n>Ljubljana</n>
      <l type="geonames">3196359</l>
   </lemma>
   <!-- treći prolaz: -->
   <lemma>
      <w>Amstelodami</w>
      <n>Amsterdam</n>
      <l type="geonames">2759794</l>
   </lemma>
   <lemma>
      <w>Amsterdam</w>
      <n>Amsterdam</n>
      <l type="geonames">2759794</l>
   </lemma>
   <lemma>
      <w>Augsburg</w>
      <n>Augsburg</n>
      <l type="geonames">2954172</l>
   </lemma>
   <lemma>
      <w>Brescia</w>
      <n>Brescia</n>
      <l type="geonames">3181554</l>
   </lemma>
   <lemma>
      <w>Budae</w>
      <n>Budapest</n>
      <l type="geonames">3054643</l>
   </lemma>
   <lemma>
      <w>Claudiopoli</w>
      <n>Cluj-Napoca</n>
      <l type="geonames">681290</l>
   </lemma>
   <lemma>
      <w>Claudiopoli Impress</w>
      <n>Cluj-Napoca</n>
      <l type="geonames">681290</l>
   </lemma>
   <lemma>
      <w>Essekini</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>Eszeki</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>Genova</w>
      <n>Genova</n>
      <l type="geonames">3176219</l>
   </lemma>
   <lemma>
      <w>Hagenau</w>
      <n>Hagenau</n>
      <l type="geonames">2754966</l>
   </lemma>
   <lemma>
      <w>Hanoviae</w>
      <n>Hannover</n>
      <l type="geonames">2910831</l>
   </lemma>
   <lemma>
      <w>Italia</w>
      <n>Italia</n>
      <l type="geonames">3175395</l>
   </lemma>
   <lemma>
      <w>Jaurini</w>
      <n>Győr</n>
      <l type="geonames">3052009</l>
   </lemma>
   <lemma>
      <w>Jena</w>
      <n>Jena</n>
      <l type="geonames">2895044</l>
   </lemma>
   <lemma>
      <w>Leyden</w>
      <n>Leiden</n>
      <l type="geonames">2751773</l>
   </lemma>
   <lemma>
      <w>Lipsia</w>
      <n>Leipzig</n>
      <l type="geonames">2879139</l>
   </lemma>
   <lemma>
      <w>Londini</w>
      <n>London</n>
      <l type="geonames">2643743</l>
   </lemma>
   <lemma>
      <w>London</w>
      <n>London</n>
      <l type="geonames">2643743</l>
   </lemma>
   <lemma>
      <w>Lovanii</w>
      <n>Leuven</n>
      <l type="geonames">2792482</l>
   </lemma>
   <lemma>
      <w>Lucca</w>
      <n>Lucca</n>
      <l type="geonames">3174530</l>
   </lemma>
   <lemma>
      <w>Luccae</w>
      <n>Lucca</n>
      <l type="geonames">3174530</l>
   </lemma>
   <lemma>
      <w>Lugduni</w>
      <n>Lyon</n>
      <l type="geonames">2996944</l>
   </lemma>
   <lemma>
      <w>Mediolani</w>
      <n>Milano</n>
      <l type="geonames">3173435</l>
   </lemma>
   <lemma>
      <w>Monachii</w>
      <n>München</n>
      <l type="geonames">2867714</l>
   </lemma>
   <lemma>
      <w>Monyorokerek</w>
      <n>Monyorókerék</n>
      <l type="geonames">2780539</l>
   </lemma>
   <lemma>
      <w>Mursiae</w>
      <n>Osijek</n>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>Napoli</w>
      <n>Napoli</n>
      <l type="geonames">3172394</l>
   </lemma>
   <lemma>
      <w>Neapoli</w>
      <n>Napoli</n>
      <l type="geonames">3172394</l>
   </lemma>
   <lemma>
      <w>Parigi</w>
      <n>Paris</n>
      <l type="geonames">2988507</l>
   </lemma>
   <lemma>
      <w>Paris</w>
      <n>Pris</n>
      <l type="geonames">92754</l>
   </lemma>
   <lemma>
      <w>Parisiis</w>
      <n>Paris</n>
      <l type="geonames">2988507</l>
   </lemma>
   <lemma>
      <w>Patavii</w>
      <n>Padova</n>
      <l type="geonames">3171728</l>
   </lemma>
   <lemma>
      <w>Pesth</w>
      <n>Budapest</n>
      <l type="geonames">3054643</l>
   </lemma>
   <lemma>
      <w>Placentiae</w>
      <n>Piacenza</n>
      <l type="geonames">3171058</l>
   </lemma>
   <lemma>
      <w>Ratisbonae</w>
      <n>Regensburg</n>
      <l type="geonames">2849483</l>
   </lemma>
   <lemma>
      <w>Roma</w>
      <n>Roma</n>
      <l type="geonames">3169070</l>
   </lemma>
   <lemma>
      <w>Romae</w>
      <n>Roma</n>
      <l type="geonames">3169070</l>
   </lemma>
   <lemma>
      <w>Rouen</w>
      <n>Rouen</n>
      <l type="geonames">2982652</l>
   </lemma>
   <lemma>
      <w>Sopronii</w>
      <n>Sopron</n>
      <l type="geonames">3045190</l>
   </lemma>
   <lemma>
      <w>Spalato</w>
      <n>Split</n>
      <l type="geonames">3190261</l>
   </lemma>
   <lemma>
      <w>Tyrnaviae</w>
      <n>Trnava</n>
      <l type="geonames">3057124</l>
   </lemma>
   <lemma>
      <w>Vacii</w>
      <n>Vác</n>
      <l type="geonames">3043293</l>
   </lemma>
   <lemma>
      <w>Venetia</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>Venetiis</w>
      <n>Venezia</n>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>Verona</w>
      <n>Verona</n>
      <l type="geonames">3164527</l>
   </lemma>
   <lemma>
      <w>Veronae</w>
      <n>Verona</n>
      <l type="geonames">3164527</l>
   </lemma>
   <lemma>
      <w>Vienna</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Weszprimii</w>
      <n>Veszprém</n>
      <l type="geonames">3042929</l>
   </lemma>
   <lemma>
      <w>Wien</w>
      <n>Wien</n>
      <l type="geonames">2761369</l>
   </lemma>
   <!-- još jedan prolaz - svi jednostruki cerl zamijenjeni s geonames -->
   
   <lemma>
      <w>Agriae</w>
      <n>Erlau</n>
      <name>Eger</name>
      <l type="geonames">721239</l>
   </lemma>
   <lemma>
      <w>Albae Carolinae</w>
      <n>Alba Iulia</n>
      <name>Alba Iulia</name>
      <l type="geonames">686578</l>
   </lemma>
   <lemma>
      <w>Albae Juliae</w>
      <n>Alba Iulia</n>
      <name>Alba Iulia</name>
      <l type="geonames">686578</l>
   </lemma>
   <lemma>
      <w>Amstelaedami</w>
      <n>Amsterdam</n>
      <name>Amsterdam</name>
      <l type="geonames">2759794</l>
   </lemma>
   <lemma>
      <w>Ancona</w>
      <n>Ancona</n>
      <name>Ancona</name>
      <l type="geonames">3183089</l>
   </lemma>
   <lemma>
      <w>Anconae</w>
      <n>Ancona</n>
      <name>Ancona</name>
      <l type="geonames">3183089</l>
   </lemma>
   <lemma>
      <w>Antverpiae</w>
      <n>Antwerpen</n>
      <name>Antwerp</name>
      <l type="geonames">2803138</l>
   </lemma>
   <lemma>
      <w>Antwerpen</w>
      <n>Antwerpen</n>
      <name>Antwerp</name>
      <l type="geonames">2803138</l>
   </lemma>
   <lemma>
      <w>Antwerpiae</w>
      <n>Antwerpen</n>
      <name>Antwerp</name>
      <l type="geonames">2803138</l>
   </lemma>
   <lemma>
      <w>Argentinae</w>
      <n>Strasbourg</n>
      <name>Strasbourg</name>
      <l type="geonames">2973783</l>
   </lemma>
   <lemma>
      <w>Argentorati</w>
      <n>Strasbourg</n>
      <name>Strasbourg</name>
      <l type="geonames">2973783</l>
   </lemma>
   <lemma>
      <w>Ateste</w>
      <n>Este</n>
      <name>Ciudad del Este</name>
      <l type="geonames">3439101</l>
   </lemma>
   <lemma>
      <w>Augustae Taurinorum</w>
      <n>Turin</n>
      <name>Turin</name>
      <l type="geonames">3165524</l>
   </lemma>
   <lemma>
      <w>Augustae Vindelicorum</w>
      <n>Augsburg</n>
      <name>Augsburg</name>
      <l type="geonames">2954172</l>
   </lemma>
   <lemma>
      <w>Aureliae Allobrogum</w>
      <n>Geneve</n>
      <name>Geneva</name>
      <l type="geonames">2660646</l>
   </lemma>
   <lemma>
      <w>Basel</w>
      <n>Basel</n>
      <name>Basel</name>
      <l type="geonames">2661604</l>
   </lemma>
   <lemma>
      <w>Basilea</w>
      <n>Basel</n>
      <name>Basel</name>
      <l type="geonames">2661604</l>
   </lemma>
   <lemma>
      <w>Basileae</w>
      <n>Basel</n>
      <name>Basel</name>
      <l type="geonames">2661604</l>
   </lemma>
   <lemma>
      <w>Basiliae</w>
      <n>Basel</n>
      <name>Basel</name>
      <l type="geonames">2661604</l>
   </lemma>
   <lemma>
      <w>Bassani</w>
      <n>Bassano</n>
      <name>San Bassano</name>
      <l type="geonames">3168558</l>
   </lemma>
   <lemma>
      <w>Bassano</w>
      <n>Bassano</n>
      <name>San Bassano</name>
      <l type="geonames">3168558</l>
   </lemma>
   <lemma>
      <w>Bechben</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Berlini</w>
      <n>Berlin</n>
      <name>Berlin</name>
      <l type="geonames">2950159</l>
   </lemma>
   <lemma>
      <w>Berolini</w>
      <n>Berlin</n>
      <name>Berlin</name>
      <l type="geonames">2950159</l>
   </lemma>
   <lemma>
      <w>Bologna</w>
      <n>Bologna</n>
      <name>Bologna</name>
      <l type="geonames">3181928</l>
   </lemma>
   <lemma>
      <w>Bonnae</w>
      <n>Bonn</n>
      <name>Bonn</name>
      <l type="geonames">2946447</l>
   </lemma>
   <lemma>
      <w>Bononiae</w>
      <n>Bologna</n>
      <name>Bologna</name>
      <l type="geonames">3181928</l>
   </lemma>
   <lemma>
      <w>Breslae</w>
      <n>Breslau</n>
      <name>Wrocław</name>
      <l type="geonames">3081368</l>
   </lemma>
   <lemma>
      <w>Brixiae</w>
      <n>Brescia</n>
      <name>Brescia</name>
      <l type="geonames">3181554</l>
   </lemma>
   <lemma>
      <w>Brunae</w>
      <n>Brno</n>
      <name>Brno</name>
      <l type="geonames">3078610</l>
   </lemma>
   <lemma>
      <w>Brunsbergae</w>
      <n>Braniewo</n>
      <name>Braniewo</name>
      <l type="geonames">3102677</l>
   </lemma>
   <lemma>
      <w>Bruxellis</w>
      <n>Brüssel</n>
      <name>Brussels</name>
      <l type="geonames">2800866</l>
   </lemma>
   <lemma>
      <w>Budim</w>
      <n>Budapest</n>
      <name>Budapest</name>
      <l type="geonames">3054643</l>
   </lemma>
   <lemma>
      <w>Campidoni</w>
      <n>Kempten</n>
      <name>Kempten (Allgäu)</name>
      <l type="geonames">2891621</l>
   </lemma>
   <lemma>
      <w>Casoviae</w>
      <n>Kaschau</n>
      <name>Košice</name>
      <l type="geonames">724443</l>
   </lemma>
   <lemma>
      <w>Cassoviae</w>
      <n>Kaschau</n>
      <name>Košice</name>
      <l type="geonames">724443</l>
   </lemma>
   <lemma>
      <w>Christlingae</w>
      <n>Strasbourg</n>
      <name>Strasbourg</name>
      <l type="geonames">2973783</l>
   </lemma>
   <lemma>
      <w>Clagenfurti</w>
      <n>Klagenfurt</n>
      <name>Klagenfurt</name>
      <l type="geonames">2774326</l>
   </lemma>
   <lemma>
      <w>Colocae</w>
      <n>Kalocsa</n>
      <name>Kalocsa</name>
      <l type="geonames">3050719</l>
   </lemma>
   <lemma>
      <w>Colociae</w>
      <n>Kalocsa</n>
      <name>Kalocsa</name>
      <l type="geonames">3050719</l>
   </lemma>
   <lemma>
      <w>Coloczae</w>
      <n>Kalocsa</n>
      <name>Kalocsa</name>
      <l type="geonames">3050719</l>
   </lemma>
   <lemma>
      <w>Cremonae</w>
      <n>Cremona</n>
      <name>Cremona</name>
      <l type="geonames">3177838</l>
   </lemma>
   <lemma>
      <w>Daventriae</w>
      <n>Deventer</n>
      <name>Deventer</name>
      <l type="geonames">2756987</l>
   </lemma>
   <lemma>
      <w>Debrecini</w>
      <n>Debrecen</n>
      <name>Debrecen</name>
      <l type="geonames">721472</l>
   </lemma>
   <lemma>
      <w>Dilingae</w>
      <n>Dillingen</n>
      <name>Dillingen an der Donau</name>
      <l type="geonames">2936974</l>
   </lemma>
   <lemma>
      <w>Dubrovnik</w>
      <n>Dubrovnik</n>
      <name>Dubrovnik</name>
      <l type="geonames">3201047</l>
   </lemma>
   <lemma>
      <w>Duisburgi</w>
      <n>Duisburg</n>
      <name>Duisburg</name>
      <l type="geonames">2934691</l>
   </lemma>
   <lemma>
      <w>Erfordiae</w>
      <n>Erfurt</n>
      <name>Erfurt</name>
      <l type="geonames">2929670</l>
   </lemma>
   <lemma>
      <w>Essechii</w>
      <n>Osijek</n>
      <name>Osijek</name>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>Esseki</w>
      <n>Osijek</n>
      <name>Osijek</name>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>Faventiae</w>
      <n>Faenza</n>
      <name>Faenza</name>
      <l type="geonames">3177300</l>
   </lemma>
   <lemma>
      <w>Ferrariae</w>
      <n>Ferrara</n>
      <name>Ferrara</name>
      <l type="geonames">6299592</l>
   </lemma>
   <lemma>
      <w>Firenze</w>
      <n>Firenze</n>
      <name>Florence</name>
      <l type="geonames">3176959</l>
   </lemma>
   <lemma>
      <w>Fiume</w>
      <n>Rijeka</n>
      <name>Rijeka</name>
      <l type="geonames">3191648</l>
   </lemma>
   <lemma>
      <w>Florentiae</w>
      <n>Firenze</n>
      <name>Florence</name>
      <l type="geonames">3176959</l>
   </lemma>
   <lemma>
      <w>Flumine</w>
      <n>Rijeka</n>
      <name>Rijeka</name>
      <l type="geonames">3191648</l>
   </lemma>
   <lemma>
      <w>Franckfurt am Mayn</w>
      <n>Frankfurt am Main</n>
      <name>Frankfurt am Main</name>
      <l type="geonames">2925533</l>
   </lemma>
   <lemma>
      <w>Franckfurth am Mayn</w>
      <n>Frankfurt am Main</n>
      <name>Frankfurt am Main</name>
      <l type="geonames">2925533</l>
   </lemma>
   <lemma>
      <w>Francoforti ad Viadrum</w>
      <n>Frankfurt an der Oder</n>
      <name>Frankfurt (Oder)</name>
      <l type="geonames">2925535</l>
   </lemma>
   <lemma>
      <w>Francofurti a. M.</w>
      <n>Frankfurt am Main</n>
      <name>Frankfurt am Main</name>
      <l type="geonames">2925533</l>
   </lemma>
   <lemma>
      <w>Francofurti ad Moenium</w>
      <n>Frankfurt am Main</n>
      <name>Frankfurt am Main</name>
      <l type="geonames">2925533</l>
   </lemma>
   <lemma>
      <w>Francofurti ad Moenum</w>
      <n>Frankfurt am Main</n>
      <name>Frankfurt am Main</name>
      <l type="geonames">2925533</l>
   </lemma>
   <lemma>
      <w>Frisingae</w>
      <n>Freising</n>
      <name>Freising</name>
      <l type="geonames">2925034</l>
   </lemma>
   <lemma>
      <w>Fulginei</w>
      <n>Foligno</n>
      <name>Foligno</name>
      <l type="geonames">3176854</l>
   </lemma>
   <lemma>
      <w>Gattopoli</w>
      <n>Giessen</n>
      <name>Giessen</name>
      <l type="geonames">2920512</l>
   </lemma>
   <lemma>
      <w>Genevae</w>
      <n>Geneve</n>
      <name>Geneva</name>
      <l type="geonames">2660646</l>
   </lemma>
   <lemma>
      <w>Genuae</w>
      <n>Genova</n>
      <name>Genoa</name>
      <l type="geonames">3176219</l>
   </lemma>
   <lemma>
      <w>Giessae</w>
      <n>Giessen</n>
      <name>Giessen</name>
      <l type="geonames">2920512</l>
   </lemma>
   <lemma>
      <w>Ginsburgi</w>
      <n>Günzburg</n>
      <name>Günzburg</name>
      <l type="geonames">2913555</l>
   </lemma>
   <lemma>
      <w>Gissae</w>
      <n>Giessen</n>
      <name>Giessen</name>
      <l type="geonames">2920512</l>
   </lemma>
   <lemma>
      <w>Gorinchemi</w>
      <n>Gorinchem</n>
      <name>Gorinchem</name>
      <l type="geonames">2755434</l>
   </lemma>
   <lemma>
      <w>Goritiae</w>
      <n>Gradisca d'Isonzo</n>
      <name>Gradisca d'Isonzo</name>
      <l type="geonames">3175961</l>
   </lemma>
   <lemma>
      <w>Gorlicii</w>
      <n>Goerlitz</n>
      <name>Görlitz</name>
      <l type="geonames">2918987</l>
   </lemma>
   <lemma>
      <w>Goudae</w>
      <n>Gouda</n>
      <name>Gouda</name>
      <l type="geonames">2755420</l>
   </lemma>
   <lemma>
      <w>Graecii</w>
      <n>Graz</n>
      <name>Graz</name>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>Graecii Styriae</w>
      <n>Graz</n>
      <name>Graz</name>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>Graetz</w>
      <n>Graz</n>
      <name>Graz</name>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>Grecii</w>
      <n>Graz</n>
      <name>Graz</name>
      <l type="geonames">2778067</l>
   </lemma>
   <lemma>
      <w>Hagae Comitis</w>
      <n>Den Haag</n>
      <name>The Hague</name>
      <l type="geonames">2747373</l>
   </lemma>
   <lemma>
      <w>Hagae Comitum</w>
      <n>Den Haag</n>
      <name>The Hague</name>
      <l type="geonames">2747373</l>
   </lemma>
   <lemma>
      <w>Halae Magdeburgicae</w>
      <n>Halle</n>
      <name>Halle</name>
      <l type="geonames">2911522</l>
   </lemma>
   <lemma>
      <w>Hamburgi</w>
      <n>Hamburg</n>
      <name>Hamburg</name>
      <l type="geonames">2911298</l>
   </lemma>
   <lemma>
      <w>Hannoverae</w>
      <n>Hannover</n>
      <name>Hanover</name>
      <l type="geonames">2910831</l>
   </lemma>
   <lemma>
      <w>Heidelbergae</w>
      <n>Heidelberg</n>
      <name>Heidelberg</name>
      <l type="geonames">2907911</l>
   </lemma>
   <lemma>
      <w>Helmestadii</w>
      <n>Helmstedt</n>
      <name>Helmstedt</name>
      <l type="geonames">2906676</l>
   </lemma>
   <lemma>
      <w>Herbipoli</w>
      <n>Wurzburg</n>
      <name>Wurzburg</name>
      <l type="geonames">2805615</l>
   </lemma>
   <lemma>
      <w>Ingolstadii</w>
      <n>Ingolstadt</n>
      <name>Ingolstadt</name>
      <l type="geonames">2895992</l>
   </lemma>
   <lemma>
      <w>Islebiae</w>
      <n>Eisleben</n>
      <name>Eisleben Lutherstadt</name>
      <l type="geonames">7284571</l>
   </lemma>
   <lemma>
      <w>Jadera</w>
      <n>Zadar</n>
      <name>Zadar</name>
      <l type="geonames">3186952</l>
   </lemma>
   <lemma>
      <w>Jakin</w>
      <n>Ancona</n>
      <name>Ancona</name>
      <l type="geonames">3183089</l>
   </lemma>
   <lemma>
      <w>Jenae</w>
      <n>Jena</n>
      <name>Jena</name>
      <l type="geonames">2895044</l>
   </lemma>
   <lemma>
      <w>Jhena</w>
      <n>Jena</n>
      <name>Jena</name>
      <l type="geonames">2895044</l>
   </lemma>
   <lemma>
      <w>Labaci</w>
      <n>Laibach</n>
      <name>Ljubljana</name>
      <l type="geonames">3196359</l>
   </lemma>
   <lemma>
      <w>Laybach</w>
      <n>Laibach</n>
      <name>Ljubljana</name>
      <l type="geonames">3196359</l>
   </lemma>
   <lemma>
      <w>Leidae</w>
      <n>Leiden</n>
      <name>Leiden</name>
      <l type="geonames">2751773</l>
   </lemma>
   <lemma>
      <w>Leuven</w>
      <n>Leuven</n>
      <name>Leuven</name>
      <l type="geonames">2792482</l>
   </lemma>
   <lemma>
      <w>Lincii</w>
      <n>Linz</n>
      <name>Linz</name>
      <l type="geonames">2772400</l>
   </lemma>
   <lemma>
      <w>Lipsiae</w>
      <n>Leipzig</n>
      <name>Leipzig</name>
      <l type="geonames">2879139</l>
   </lemma>
   <lemma>
      <w>Lubecae</w>
      <n>Lubeck</n>
      <name>Lübeck</name>
      <l type="geonames">2875601</l>
   </lemma>
   <lemma>
      <w>Lublini</w>
      <n>Lublin</n>
      <name>Lublin</name>
      <l type="geonames">765876</l>
   </lemma>
   <lemma>
      <w>Lucae</w>
      <n>Lucca</n>
      <name>Lucca</name>
      <l type="geonames">3174530</l>
   </lemma>
   <lemma>
      <w>Lugano</w>
      <n>Lugano</n>
      <name>Lugano</name>
      <l type="geonames">2659836</l>
   </lemma>
   <lemma>
      <w>Lugduni Batavorum</w>
      <n>Leiden</n>
      <name>Leiden</name>
      <l type="geonames">2751773</l>
   </lemma>
   <lemma>
      <w>Lugduni in Batavis</w>
      <n>Leiden</n>
      <name>Leiden</name>
      <l type="geonames">2751773</l>
   </lemma>
   <lemma>
      <w>Lutetiae Parisiorum</w>
      <n>Paris</n>
      <name>Paris</name>
      <l type="geonames">2988507</l>
   </lemma>
   <lemma>
      <w>Lycii</w>
      <n>Lecce</n>
      <name>Lecce</name>
      <l type="geonames">3174953</l>
   </lemma>
   <lemma>
      <w>Lypsiae</w>
      <n>Leipzig</n>
      <name>Leipzig</name>
      <l type="geonames">2879139</l>
   </lemma>
   <lemma>
      <w>Maceratae</w>
      <n>Macerata</n>
      <name>Macerata</name>
      <l type="geonames">3174380</l>
   </lemma>
   <lemma>
      <w>Magdeburgae</w>
      <n>Magdeburg</n>
      <name>Magdeburg</name>
      <l type="geonames">2874545</l>
   </lemma>
   <lemma>
      <w>Magdeburgi</w>
      <n>Magdeburg</n>
      <name>Magdeburg</name>
      <l type="geonames">2874545</l>
   </lemma>
   <lemma>
      <w>Marburgi</w>
      <n>Marburg</n>
      <name>Marburg</name>
      <l type="geonames">2873759</l>
   </lemma>
   <lemma>
      <w>Matriti</w>
      <n>Madrid</n>
      <name>Madrid</name>
      <l type="geonames">3117735</l>
   </lemma>
   <lemma>
      <w>Mechliniae</w>
      <n>Mechelen</n>
      <name>Mechelen</name>
      <l type="geonames">2791537</l>
   </lemma>
   <lemma>
      <w>Messanae</w>
      <n>Messina</n>
      <name>Messina</name>
      <l type="geonames">2524170</l>
   </lemma>
   <lemma>
      <w>Messina</w>
      <n>Messina</n>
      <name>Messina</name>
      <l type="geonames">2524170</l>
   </lemma>
   <lemma>
      <w>Micro-Pragae</w>
      <n>Prag</n>
      <name>Prague</name>
      <l type="geonames">3067696</l>
   </lemma>
   <lemma>
      <w>Milano</w>
      <n>Mailand</n>
      <name>Milan</name>
      <l type="geonames">3173435</l>
   </lemma>
   <lemma>
      <w>Modena</w>
      <n>Modena</n>
      <name>Modena</name>
      <l type="geonames">3173331</l>
   </lemma>
   <lemma>
      <w>Moguntiae</w>
      <n>Mainz</n>
      <name>Mainz</name>
      <l type="geonames">2874225</l>
   </lemma>
   <lemma>
      <w>Monaci</w>
      <n>München</n>
      <name>Munich</name>
      <l type="geonames">2867714</l>
   </lemma>
   <lemma>
      <w>Montefalisco</w>
      <n>Montefiascone</n>
      <name>Montefiascone</name>
      <l type="geonames">3172931</l>
   </lemma>
   <lemma>
      <w>Mutinae</w>
      <n>Modena</n>
      <name>Modena</name>
      <l type="geonames">3173331</l>
   </lemma>
   <lemma>
      <w>Nagy Szombat</w>
      <n>Trnava</n>
      <name>Trnava</name>
      <l type="geonames">3057124</l>
   </lemma>
   <lemma>
      <w>Neostadii</w>
      <n>Wiener Neustadt</n>
      <name>Wiener Neustadt</name>
      <l type="geonames">2761353</l>
   </lemma>
   <lemma>
      <w>Neostadii Austriae</w>
      <n>Wiener Neustadt</n>
      <name>Wiener Neustadt</name>
      <l type="geonames">2761353</l>
   </lemma>
   <lemma>
      <w>Nissae</w>
      <n>Neisse</n>
      <name>Nysa</name>
      <l type="geonames">3090436</l>
   </lemma>
   <lemma>
      <w>Nizza</w>
      <n>Nice</n>
      <name>Nice</name>
      <l type="geonames">2990440</l>
   </lemma>
   <lemma>
      <w>Norimbergae</w>
      <n>Nürnberg</n>
      <name>Nuremberg</name>
      <l type="geonames">2861650</l>
   </lemma>
   <lemma>
      <w>Norinbergae</w>
      <n>Nürnberg</n>
      <name>Nuremberg</name>
      <l type="geonames">2861650</l>
   </lemma>
   <lemma>
      <w>Novara</w>
      <n>Novara</n>
      <name>Novara</name>
      <l type="geonames">3172189</l>
   </lemma>
   <lemma>
      <w>Nurembergae</w>
      <n>Nürnberg</n>
      <name>Nuremberg</name>
      <l type="geonames">2861650</l>
   </lemma>
   <lemma>
      <w>Offenbachi</w>
      <n>Offenbach</n>
      <name>Offenbach</name>
      <l type="geonames">2857807</l>
   </lemma>
   <lemma>
      <w>Offenbachii</w>
      <n>Offenbach</n>
      <name>Offenbach</name>
      <l type="geonames">2857807</l>
   </lemma>
   <lemma>
      <w>Oppenheimii</w>
      <n>Oppenheim</n>
      <name>Oppenheim</name>
      <l type="geonames">2857167</l>
   </lemma>
   <lemma>
      <w>Orthona Maris</w>
      <n>Ortona</n>
      <name>Ortona</name>
      <l type="geonames">3171886</l>
   </lemma>
   <lemma>
      <w>Orthonae</w>
      <n>Ortona</n>
      <name>Ortona</name>
      <l type="geonames">3171886</l>
   </lemma>
   <lemma>
      <w>Osimo</w>
      <n>Osimo</n>
      <name>Osimo</name>
      <l type="geonames">3171848</l>
   </lemma>
   <lemma>
      <w>Oxonii</w>
      <n>Oxford</n>
      <name>Oxford</name>
      <l type="geonames">2640729</l>
   </lemma>
   <lemma>
      <w>Oxonii,</w>
      <n>Oxford</n>
      <name>Oxford</name>
      <l type="geonames">2640729</l>
   </lemma>
   <lemma>
      <w>Padova</w>
      <n>Padova</n>
      <name>Padua</name>
      <l type="geonames">3171728</l>
   </lemma>
   <lemma>
      <w>Paduae</w>
      <n>Padova</n>
      <name>Padua</name>
      <l type="geonames">3171728</l>
   </lemma>
   <lemma>
      <w>Papiae</w>
      <n>Pavia</n>
      <name>Pavia</name>
      <l type="geonames">3171366</l>
   </lemma>
   <lemma>
      <w>Papie</w>
      <n>Pavia</n>
      <name>Pavia</name>
      <l type="geonames">3171366</l>
   </lemma>
   <lemma>
      <w>Parma</w>
      <n>Parma</n>
      <name>Parma</name>
      <l type="geonames">3171457</l>
   </lemma>
   <lemma>
      <w>Parmae</w>
      <n>Parma</n>
      <name>Parma</name>
      <l type="geonames">3171457</l>
   </lemma>
   <lemma>
      <w>Patavii Antenoris</w>
      <n>Padova</n>
      <name>Padua</name>
      <l type="geonames">3171728</l>
   </lemma>
   <lemma>
      <w>Perusiae</w>
      <n>Perugia</n>
      <name>Perugia</name>
      <l type="geonames">3171180</l>
   </lemma>
   <lemma>
      <w>Pesthini</w>
      <n>Budapest</n>
      <name>Budapest</name>
      <l type="geonames">3054643</l>
   </lemma>
   <lemma>
      <w>Pestini</w>
      <n>Budapest</n>
      <name>Budapest</name>
      <l type="geonames">3054643</l>
   </lemma>
   <lemma>
      <w>Petropoli</w>
      <n>Petrograd</n>
      <name>Saint-Petersburg</name>
      <l type="geonames">498817</l>
   </lemma>
   <lemma>
      <w>Posnaniae</w>
      <n>Posen</n>
      <name>Poznań</name>
      <l type="geonames">3088171</l>
   </lemma>
   <lemma>
      <w>Posonii</w>
      <n>Bratislava</n>
      <name>Bratislava</name>
      <l type="geonames">3060972</l>
   </lemma>
   <lemma>
      <w>Pragae</w>
      <n>Prag</n>
      <name>Prague</name>
      <l type="geonames">3067696</l>
   </lemma>
   <lemma>
      <w>Prato</w>
      <n>Prato</n>
      <name>Prato</name>
      <l type="geonames">3169921</l>
   </lemma>
   <lemma>
      <w>Quinque-Ecclesiae</w>
      <n>Fünfkirchen</n>
      <name>Pécs</name>
      <l type="geonames">3046526</l>
   </lemma>
   <lemma>
      <w>Quinque-Ecclesiis</w>
      <n>Fünfkirchen</n>
      <name>Pécs</name>
      <l type="geonames">3046526</l>
   </lemma>
   <lemma>
      <w>Racoviae</w>
      <n>Raków</n>
      <name>Raków</name>
      <l type="geonames">760657</l>
   </lemma>
   <lemma>
      <w>Ragusa</w>
      <n>Dubrovnik</n>
      <name>Dubrovnik</name>
      <l type="geonames">3201047</l>
   </lemma>
   <lemma>
      <w>Ratisponae</w>
      <n>Regensburg</n>
      <name>Regensburg</name>
      <l type="geonames">2849483</l>
   </lemma>
   <lemma>
      <w>Ravennae</w>
      <n>Ravenna</n>
      <name>Ravenna</name>
      <l type="geonames">3169561</l>
   </lemma>
   <lemma>
      <w>Regii</w>
      <n>Reggio nell'Emilia</n>
      <name>Reggio nell'Emilia</name>
      <l type="geonames">3169522</l>
   </lemma>
   <lemma>
      <w>Regiomonti</w>
      <n>Königsberg</n>
      <name>Kaliningrad</name>
      <l type="geonames">554234</l>
   </lemma>
   <lemma>
      <w>Regiomonti Borussiae</w>
      <n>Königsberg</n>
      <name>Kaliningrad</name>
      <l type="geonames">554234</l>
   </lemma>
   <lemma>
      <w>Regiomonti Borussorum</w>
      <n>Königsberg</n>
      <name>Kaliningrad</name>
      <l type="geonames">554234</l>
   </lemma>
   <lemma>
      <w>Rhagusii</w>
      <n>Dubrovnik</n>
      <name>Dubrovnik</name>
      <l type="geonames">3201047</l>
   </lemma>
   <lemma>
      <w>Rostochii</w>
      <n>Rostock</n>
      <name>Rostock</name>
      <l type="geonames">2844588</l>
   </lemma>
   <lemma>
      <w>Sabariae</w>
      <n>Steinamanger</n>
      <name>Szombathely</name>
      <l type="geonames">3044310</l>
   </lemma>
   <lemma>
      <w>Salingiaci</w>
      <n>Solingen</n>
      <name>Solingen</name>
      <l type="geonames">2831580</l>
   </lemma>
   <lemma>
      <w>Sandomiriae</w>
      <n>Sandomierz</n>
      <name>Sandomierz</name>
      <l type="geonames">759603</l>
   </lemma>
   <lemma>
      <w>Senis</w>
      <n>Siena</n>
      <name>Siena</name>
      <l type="geonames">3166548</l>
   </lemma>
   <lemma>
      <w>Senonis</w>
      <n>Sens</n>
      <name>Sens</name>
      <l type="geonames">2975050</l>
   </lemma>
   <lemma>
      <w>Servestae</w>
      <n>Zerbst</n>
      <name>Zerbst</name>
      <l type="geonames">2804748</l>
   </lemma>
   <lemma>
      <w>Strasbourg</w>
      <n>Strasbourg</n>
      <name>Strasbourg</name>
      <l type="geonames">2973783</l>
   </lemma>
   <lemma>
      <w>Strigonii</w>
      <n>Esztergom</n>
      <name>Esztergom</name>
      <l type="geonames">3053163</l>
   </lemma>
   <lemma>
      <w>Tarvisii</w>
      <n>Treviso</n>
      <name>Treviso</name>
      <l type="geonames">3165201</l>
   </lemma>
   <lemma>
      <w>Taurini</w>
      <n>Turin</n>
      <name>Turin</name>
      <l type="geonames">3165524</l>
   </lemma>
   <lemma>
      <w>Tergeste</w>
      <n>Triest</n>
      <name>Trieste</name>
      <l type="geonames">3165185</l>
   </lemma>
   <lemma>
      <w>Tergesti</w>
      <n>Triest</n>
      <name>Trieste</name>
      <l type="geonames">3165185</l>
   </lemma>
   <lemma>
      <w>Tholose</w>
      <n>Toulouse</n>
      <name>Toulouse</name>
      <l type="geonames">2972315</l>
   </lemma>
   <lemma>
      <w>Ticini Regii</w>
      <n>Pavia</n>
      <name>Pavia</name>
      <l type="geonames">3171366</l>
   </lemma>
   <lemma>
      <w>Tolosae</w>
      <n>Toulouse</n>
      <name>Toulouse</name>
      <l type="geonames">2972315</l>
   </lemma>
   <lemma>
      <w>Torino</w>
      <n>Turin</n>
      <name>Turin</name>
      <l type="geonames">3165524</l>
   </lemma>
   <lemma>
      <w>Traiecti Batavorum</w>
      <n>Utrecht</n>
      <name>Utrecht</name>
      <l type="geonames">2745912</l>
   </lemma>
   <lemma>
      <w>Trajecti ad Rhenum</w>
      <n>Utrecht</n>
      <name>Utrecht</name>
      <l type="geonames">2745912</l>
   </lemma>
   <lemma>
      <w>Trieste</w>
      <n>Triest</n>
      <name>Trieste</name>
      <l type="geonames">3165185</l>
   </lemma>
   <lemma>
      <w>Tubingae</w>
      <n>Tuebingen</n>
      <name>Tübingen</name>
      <l type="geonames">2820860</l>
   </lemma>
   <lemma>
      <w>U Budimu</w>
      <n>Budapest</n>
      <name>Budapest</name>
      <l type="geonames">3054643</l>
   </lemma>
   <lemma>
      <w>U Osiku</w>
      <n>Osijek</n>
      <name>Osijek</name>
      <l type="geonames">3193935</l>
   </lemma>
   <lemma>
      <w>U Rici</w>
      <n>Rijeka</n>
      <name>Rijeka</name>
      <l type="geonames">3191648</l>
   </lemma>
   <lemma>
      <w>U Rike</w>
      <n>Rijeka</n>
      <name>Rijeka</name>
      <l type="geonames">3191648</l>
   </lemma>
   <lemma>
      <w>Ulmae</w>
      <n>Ulm</n>
      <name>Ulm</name>
      <l type="geonames">2820256</l>
   </lemma>
   <lemma>
      <w>Ultraiecti</w>
      <n>Utrecht</n>
      <name>Utrecht</name>
      <l type="geonames">2745912</l>
   </lemma>
   <lemma>
      <w>Ursellis</w>
      <n>Oberursel</n>
      <name>Oberursel</name>
      <l type="geonames">2858738</l>
   </lemma>
   <lemma>
      <w>Utini</w>
      <n>Udine</n>
      <name>Udine</name>
      <l type="geonames">3165072</l>
   </lemma>
   <lemma>
      <w>Varsaviae</w>
      <n>Warschau</n>
      <name>Warsaw</name>
      <l type="geonames">756135</l>
   </lemma>
   <lemma>
      <w>Venetis</w>
      <n>Venezia</n>
      <name>Venice</name>
      <l type="geonames">3164603</l>
   </lemma>
   <lemma>
      <w>Vienae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Vienae Austriae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Viennae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Viennae Austriae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Viennae Pannoniae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Viennae austriae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Viennae, Austriae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Vindobonae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Vitebergae</w>
      <n>Lutherstadt Wittenberg</n>
      <name>Lutherstadt Wittenberg</name>
      <l type="geonames">6548975</l>
   </lemma>
   <lemma>
      <w>Vitembergae</w>
      <n>Lutherstadt Wittenberg</n>
      <name>Lutherstadt Wittenberg</name>
      <l type="geonames">6548975</l>
   </lemma>
   <lemma>
      <w>Viterbi</w>
      <n>Viterbo</n>
      <name>Viterbo</name>
      <l type="geonames">3164039</l>
   </lemma>
   <lemma>
      <w>Vittebergae</w>
      <n>Lutherstadt Wittenberg</n>
      <name>Lutherstadt Wittenberg</name>
      <l type="geonames">6548975</l>
   </lemma>
   <lemma>
      <w>Vratislaviae</w>
      <n>Breslau</n>
      <name>Wrocław</name>
      <l type="geonames">3081368</l>
   </lemma>
   <lemma>
      <w>Wiennae</w>
      <n>Wien</n>
      <name>Vienna</name>
      <l type="geonames">2761369</l>
   </lemma>
   <lemma>
      <w>Wirceburgi</w>
      <n>Wurzburg</n>
      <name>Wurzburg</name>
      <l type="geonames">2805615</l>
   </lemma>
   <lemma>
      <w>Witebergae</w>
      <n>Lutherstadt Wittenberg</n>
      <name>Lutherstadt Wittenberg</name>
      <l type="geonames">6548975</l>
   </lemma>
   <lemma>
      <w>Wittebergae</w>
      <n>Lutherstadt Wittenberg</n>
      <name>Lutherstadt Wittenberg</name>
      <l type="geonames">6548975</l>
   </lemma>
   <lemma>
      <w>Wittenbergae</w>
      <n>Lutherstadt Wittenberg</n>
      <name>Lutherstadt Wittenberg</name>
      <l type="geonames">6548975</l>
   </lemma>
   <lemma>
      <w>Zagrabiae</w>
      <n>Zagreb</n>
      <name>Zagreb</name>
      <l type="geonames">3186886</l>
   </lemma>
   <lemma>
      <w>Zagreb</w>
      <n>Zagreb</n>
      <name>Zagreb</name>
      <l type="geonames">3186886</l>
   </lemma>
</r>


for $l in distinct-values($a/lemma/l[not(contains(text(), ' ')) and node()]),
$f in distinct-values($a/lemma[l=$l]/n)
order by $f
return
element tr {
element td { $f } ,
element td { 
element a { attribute href { replace($geostring , 'BROJ' , $l) } , $l }
} ,
element td { 
 count($doc//*:pubPlace[descendant-or-self::*[@ref=$l]])
} ,
element td { 
element a { attribute href { replace($string , 'BROJ' , $l) } , $l }
}
}
}</tbody>
</table>
</blockquote>
     <p/>
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};
return
