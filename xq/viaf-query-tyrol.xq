(: query viaf for a list of names, get viafID's :)
declare namespace ns2="http://viaf.org/viaf/terms#";
declare namespace ns3="http://viaf.org/viaf/terms#";
(: address to which we are sending the queries :)
let $url := ("http://www.viaf.org/viaf/search?query=local.personalNames+all+%22REPLACE_URN%22&amp;maximumRecords=1&amp;sortKeys=holdingscount&amp;httpAccept=text/xml")
(: model as follows :)
(: http://viaf.org/viaf/search?query=[cqlQuery]&maximumRecords=100&startRecord=[startIndex]&sortKeys=holdingscount&httpAccept=text/xml :)
return element ol {
(: our sequence :)
let $rijeci := 

<a>
<n>Azzone, Marcus</n>
<n>Bacca, Jakobus a</n>
<n>Bacchetoni, Hieronymus L.</n>
<n>Bagatini, Nicolaus Antonius</n>
<n>Bagatta, Hieronymus</n>
<n>Balan, Pietro</n>
<n>Balde, Jakob</n>
<n>Baldessare, Gaspare Melchiorre</n>
<n>Baldinger, E. G. (?)</n>
<n>Baldovini, Johann Baptista de</n>
<n>Balducci, Giacopo</n>
<n>Balista, Cristophorus Niger</n>
<n>Balista, Martino</n>
<n>Balista, Quintilio</n>
<n>Balke, Teodoricus</n>
<n>Balneoregio, Silvester de</n>
<n>Balthasar, Joannes Franc.</n>
<n>Bandelie, Jacob</n>
<n>Banholzer, Johann</n>
<n>Banniza von Bazan, Joseph Leonhard</n>
<n>Barbacovi, Francesco V.</n>
<n>Barbacovi, Johann</n>
<n>Barisella, Agostino OSF</n>
<n>Barlezio, Marino</n>
<n>Baroni Cavalcabó, Clemente</n>
<n>Baronius, Carolo-Hieronymus</n>
<n>Barthel, Johann Caspar</n>
<n>Bartholomaeus Tridentinus</n>
<n>Bartholomaeus, J. P.</n>
<n>Bartolomei, Simon Pietro</n>
<n>Bartolommei, Franciscus Stephanus</n>
<n>Bartolommei, Simone Pietro d. Ä.</n>
<n>Bassi, Antonio</n>
<n>Basso, Francesco Antonio Begnudelli</n>
<n>Bastus (?), Gabriel</n>
<n>Battaglia de Ponte Alto, Carlo Girolamo</n>
<n>Battisti, Bartholom. de</n>
<n>Battoclet., Ioa. Andrea</n>
<n>Baudrexel, Philipp Jacob</n>
<n>Baumann, Christian SJ</n>
<n>Baur, Johann Baptist</n>
<n>Baur, Johannes Georgius</n>
<n>Bayer, Ignaz</n>
<n>Bayer, Johann Michael</n>
<n>Bayer, Johann Michael SJ</n>
<n>Becanus, Martinus SJ</n>
<n>Bechtlin, Christoph</n>
<n>Beham, Hippolytus M. OSM</n>
<n>Belfanti, Johann Baptist</n>
<n>Bellavite, Nicoló Francesco</n>
<n>Bellecius, Aloysius P.</n>
<n>Bellone, Antonio</n>
<n>Bellono, Giovanni Francesco</n>
<n>Bellutti, Dominikus</n>
<n>Beltrami, Giovanni P.</n>
<n>Bemb, Franz Johann</n>
<n>Benardelli, Josef</n>
<n>Benassuti, Francesco</n>
<n>Bencius, Franciscus SJ</n>
<n>Benedictis, Anton F. de</n>
<n>Benedictis, Franciscus Antonius de</n>
<n>Benedictus XIII. (papa)</n>
<n>Benedictus XIV. (papa)</n>
<n>Beniamus, Maximianus OFMC</n>
<n>Benigni, Johann Ludwig</n>
<n>Benignus, Georgius</n>
<n>Benvenuti, Ioannes Petrus</n>
<n>Bergani, Georgius Iodocus</n>
<n>Bergmeister, Albert</n>
<n>Bergmeister, Andreas Joannes</n>
<n>Bernardelli, Pietro</n>
<n>Bernardis, Antonius de</n>
<n>Bernegger, Matthias</n>
<n>Bernstich, Johann Baptist SJ</n>
<n>Bersellino, Francesco</n>
<n>Berset, Franciscus Philippus</n>
<n>Bertanza, Giovanni</n>
<n>Bertelli, Rochus</n>
<n>Berti, Ioannes Franciscus</n>
<n>Bertieri, Iosephus</n>
<n>Bertola, Aurelio</n>
<n>Bertoldo, Giovanni Battista SJ</n>
<n>Bertondelli, Ludovicus</n>
<n>Bessel, Gottfried</n>
<n>Betta, Alvise</n>
<n>Betta, Balthassare</n>
<n>Betta, Carlo Antonio</n>
<n>Betta, Felix Iosephus</n>
<n>Bevilacqua, Nikolaus</n>
<n>Biagi, Johann Maria</n>
<n>Bianchi, Battista</n>
<n>Bickel, Gustav</n>
<n>Bidermann, Ernst</n>
<n>Biecheler, Rudolf</n>
<n>Biederlack, Joseph</n>
<n>Biener, Bernard</n>
<n>Bienner, Wilhelm</n>
<n>Binder, Aemilian</n>
<n>Biner, Joseph</n>
<n>Birti von Weinfeld, Josephus</n>
<n>Bischof Heinrich von Metz</n>
<n>Bitterich, Johann</n>
<n>Blacque, Jean</n>
<n>Blankenbach, Arnold</n>
<n>Blesius, Petrus</n>
<n>Bliemel, Wilhelm</n>
<n>Blosius, Ludovicus</n>
<n>Blum, I.</n>
<n>Blumenau, Laurentius</n>
<n>Bolognetus, Albertus</n>
<n>Bomporto, Francesco Antonio</n>
<n>Bona, Johann</n>
<n>Bonani, Joseph SJ</n>
<n>Bonaquistus, Fortunatus</n>
<n>Bonaventura, Gabriel von Preiß OFM</n>
<n>Bonbardi, Michael SJ</n>
<n>Bondenus, Vincentius</n>
<n>Bonelli, Benedetto</n>
<n>Bonelli, Carlo</n>
<n>Bonfioli, Francesco</n>
<n>Bonifacius fil. q. ser. Odorici not. q. s. Bonifacii de Tridento</n>
<n>Bonomo, Francesco</n>
<n>Bonomus, Petrus</n>
<n>Bononi, Girolamo</n>
<n>Bonora, Agostino</n>
<n>Bonus, Petrus Lombardus</n>
<n>Bonvicino, Francisco</n>
<n>Boppingen, Ioannes Anhang von</n>
<n>Borghesi, Franciscus</n>
<n>Borgo, Andrea</n>
<n>Borgo, Maurizio da  OFM</n>
<n>Boroi, Lodovico</n>
<n>Boronus, Petrus</n>
<n>Borromeo, Carlo</n>
<n>Borromeus, Carolus</n>
<n>Borsieri, Giovanni Battista</n>
<n>Bortolazzi, Giacomo Antonio</n>
<n>Bortolotti de Montfort et Prichenheim, Udalrichus Josephus</n>
<n>Borzatti</n>
<n>Borzi, Pantaleone</n>
<n>Boscius, Ioannes</n>
<n>Bosini, Ambros</n>
<n>Botsch, Theodor</n>
<n>Bozulo, Remigius a</n>
<n>Braher, Georg</n>
<n>Brambilla, Joannes Carolus</n>
<n>Brandis, Christoph SJ</n>
<n>Brandis, Franz Adam von</n>
<n>Brant, Sebastian</n>
<n>Brassavola, Renato</n>
<n>Bratzius, Norbert</n>
<n>Braun, Placidus OSB</n>
<n>Brausi, Ioannes</n>
<n>Bresadola, Giacomo</n>
<n>Breuss, Christian Josef</n>
<n>Briet, Philippe</n>
<n>Briggl, Christian</n>
<n>Britannicus, Gregorius</n>
<n>Bronzin, Antonius</n>
<n>Brugglacher, Joh. Gg.</n>
<n>Brugnara, Josef</n>
<n>Brugora, Galeazzo</n>
<n>Brunacci, Giovanni</n>
<n>Brunatti, Josephus</n>
<n>Brunelli, Domenico</n>
<n>Brunellus, Jacobus</n>
<n>Brunner, Andreas</n>
<n>Brunner, Andreas</n>
<n>Brunner, Giovanni Battista</n>
<n>Brunus, Ludovicus</n>
<n>Brusch, Kaspar</n>
<n>Bruti, Iosephus</n>
<n>Bucelin, Gabriel</n>
<n>Buckenmayer, Nico(laus)</n>
<n>Budelius, Rener</n>
<n>Buecher, Franciscus</n>
<n>Buffa, Antonio</n>
<n>Buol, Konrad</n>
<n>Burger, Casparus Josephus Andreas</n>
<n>Burgews, Br. Heinrich von</n>
<n>Burgklechner, Matthias</n>
<n>Burglehner, Ignatz</n>
<n>Busnardus, Laurentius</n>
<n>Buttalosso, Simone</n>
<n>Büchler, Leopold Karl</n>
<n>Caballus, Seraphin</n>
<n>Caccia, Franciscus</n>
</a>

(: for each item in sequence, batches of 100 :)
for $r in $rijeci/n

let $qrijeci := replace($r, " ", "+")
let $parsed := (doc(replace($url,'REPLACE_URN',$qrijeci)))

return element li { element a { attribute href { if (empty($parsed//ns2:VIAFCluster/ns2:viafID))
then "http://neolatin.lbg.ac.at/en/database"
else concat("http://viaf.org/viaf/",data($parsed//ns2:VIAFCluster/ns2:viafID))  } , data($r) } }
}