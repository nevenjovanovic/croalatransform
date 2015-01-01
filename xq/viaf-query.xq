(: query viaf for a list of names, get viafID's :)
declare namespace ns2="http://viaf.org/viaf/terms#";
declare namespace ns3="http://viaf.org/viaf/terms#";
(: address to which we are sending the queries :)
let $url := ("http://www.viaf.org/viaf/search?query=local.personalNames+all+%22REPLACE_URN%22&amp;maximumRecords=1&amp;sortKeys=holdingscount&amp;httpAccept=text/xml")
(: model as follows :)
(: http://viaf.org/viaf/search?query=[cqlQuery]&maximumRecords=100&startRecord=[startIndex]&sortKeys=holdingscount&httpAccept=text/xml :)
(: our sequence :)
let $rijeci := 

<a>
  <n>Adelmann von Adelmannsfelden, Konrad</n>
  <n>Aegidii, Guillermus</n>
  <n>Alexander, Natalis</n>
  <n>Algerus</n>
  <n>Alvarez, Manuel</n>
  <n>Amort, Eusebius</n>
  <n>Anastasius Sinaita</n>
  <n>Anderson, Alexander</n>
  <n>Andreae, Jakob</n>
  <n>Andrian, Karl</n>
  <n>Andry de Boisregard, Nicolas</n>
  <n>Annat, Pierre</n>
  <n>Antoine, Paul Gabriel</n>
  <n>Antonius, Florentinus</n>
  <n>Apponyi, Balazs</n>
  <n>Arconatus, Hieronymus</n>
  <n>Aristeas</n>
  <n>Augustinus, Aurelius</n>
  <n>Bade, Josse</n>
  <n>Baeuerle, Adolf</n>
  <n>Baker, Thomas</n>
  <n>Baldo degli Ubaldi</n>
  <n>Bandini, Angiolo Maria</n>
  <n>Barleci, Marin</n>
  <n>Batthyany, Ignaz</n>
  <n>Baudrand, Michel Antoine</n>
  <n>Bautschner, Marcelinus</n>
  <n>Bautschner, Marcellinus</n>
  <n>Becanus, Martinus</n>
  <n>Bel, Matyas</n>
  <n>Bellarmino, Roberto</n>
  <n>Benedictus XIII</n>
  <n>Benedictus XIV</n>
  <n>Benvenuti, Carlo</n>
  <n>Bering, Vitus Johanssen</n>
  <n>Bernino, Domenico</n>
  <n>Bessarion, Johannes</n>
  <n>Bibliander, Theodorus</n>
  <n>Biesmann, Caspar</n>
  <n>Bodin, Jean</n>
  <n>Bogdani, Petar</n>
  <n>Boissard, Jean Jacques</n>
  <n>Bolognini, Bartolommeo</n>
  <n>Bona, Giovanni</n>
  <n>Bonciarius, Antonius</n>
  <n>Bonfini, Antonio</n>
  <n>Bongars, Jacques</n>
  <n>Borromeo, Carolus</n>
  <n>Bosius, Johannes Andreas</n>
  <n>Bossuet, Jacques Benigne</n>
  <n>Brancadoro, Cesare</n>
  <n>Bremond, Antonius</n>
  <n>Brendt, Jodocus</n>
  <n>Brewer, Heinrich</n>
  <n>Burman, Peter</n>
  <n>Busbequius, Augerius</n>
  <n>Camerarius, Joachim</n>
  <n>Camillus, Blasius Auximas</n>
  <n>Campadelli, Giovanni Battista</n>
  <n>Canisius, Henricus</n>
  <n>Canisius, Petrus</n>
  <n>Cappello, Carlo</n>
  <n>Cellarius, Christophorus</n>
  <n>Ceruti, Matteo</n>
  <n>Cesari, Antonio</n>
  <n>Chaptal, Jean Antoine Claude</n>
  <n>Chytraeus, David</n>
  <n>Clemens XIV</n>
  <n>Coleti, Jacopo</n>
  <n>Colonna Galatino, Pietro</n>
  <n>Conradus de Alemannia</n>
  <n>Conring, Hermann</n>
  <n>Cordara, Giulio Cesare</n>
  <n>Cornaeus, Melchior</n>
  <n>Corner, Flaminio</n>
  <n>Crato von Krafftheim, Johann</n>
  <n>Crespin, Jean</n>
  <n>Cronstedt, Axel Friedrich</n>
  <n>Cuspinianus, Iohannes</n>
  <n>Danes, Pierre Louis</n>
  <n>David ben Joseph, Kimhi</n>
  <n>Denis, Michael</n>
  <n>Dierkens, Petrus</n>
  <n>Dillingen, Urlich</n>
  <n>Dionysius &lt;Areopagita&gt;</n>
  <n>Dionysius Cartusianus</n>
  <n>Diotallevi, Alessandro</n>
  <n>Does, Johan van der</n>
  <n>Dolci de Vicković, Frano</n>
  <n>Dolliner, Thomas</n>
  <n>Dominicus de Sancto Geminiano</n>
  <n>Donfrid, Johann</n>
  <n>Du Cange, Charles du Fresne</n>
  <n>Du Change, Charles</n>
  <n>Duellius, Raimundus</n>
  <n>Dufrene, Maximilian</n>
  <n>Dumont, Jean</n>
  <n>Duns Scotus, Iohannes</n>
  <n>Eckhel, Joseph Hilar</n>
  <n>Ehrentreich, Adam</n>
  <n>Erasmus Desiderius</n>
  <n>Erastus, Thomas</n>
  <n>Espen, Zeger Bernard van</n>
  <n>Estella, Diego de</n>
  <n>Eybel, Joseph Valentin</n>
  <n>Fagnani, Prospero</n>
  <n>Febei, Francesco</n>
  <n>Fecht, Johann</n>
  <n>Ferrari, Francesco Bernardino</n>
  <n>Ferrari, Sigismund</n>
  <n>Ferraris, Lucius</n>
  <n>Ferruccio, Michele</n>
  <n>Ficino, Marsilio Florentino</n>
  <n>Fidelis, Cassandra</n>
  <n>Firmianus, Petrus</n>
  <n>Firmicus Maternus, Julius</n>
  <n>Fleury, Claude</n>
  <n>Foglietta, Umberto</n>
  <n>Folengo, Giambattista</n>
  <n>Fredericus, Achilles</n>
  <n>Fredro, Andreas Maximilian</n>
  <n>Frusius, Andreas</n>
  <n>Gallandius, Andreas</n>
  <n>Gallucci, Giovanni Paolo</n>
  <n>Gallus, Nicolaus</n>
  <n>Garet, Jean</n>
  <n>Gennadius, Georges Scholarius</n>
  <n>Geuffroy, Antoine</n>
  <n>Gianni, Francesco</n>
  <n>Giustiniani, Pietro</n>
  <n>Goldast, Melchior</n>
  <n>Gontery, Jean</n>
  <n>Gottsched, Johann Christoph</n>
  <n>Graevius, Johann Georg</n>
  <n>Gramond, Gabriel Brthelemy de</n>
  <n>Gratius, Ortwinus</n>
  <n>Gregoire de Tours</n>
  <n>Gregorius I</n>
  <n>Gregorius XVI</n>
  <n>Gregorius XVI, papa</n>
  <n>Grosez, Jean Etienne</n>
  <n>Guidi, Ippolito Camillo</n>
  <n>Haschka, Lorenz Leopold</n>
  <n>Heinsius, Daniel Heins</n>
  <n>Heldelin, Kaspar</n>
  <n>Helian, Louis</n>
  <n>Herigone, Pierre</n>
  <n>Heroldt, Basilius</n>
  <n>Hesiodos</n>
  <n>Hieronymus</n>
  <n>Hippocrates</n>
  <n>Hoblik, Martinus</n>
  <n>Homerus</n>
  <n>Hottinger, Johann Heinrich</n>
  <n>Huszty, Istvan</n>
  <n>Innocentius III</n>
  <n>Innocentius XI.</n>
  <n>Iohannes Chrysostomus</n>
  <n>Iohannes Damascenus</n>
  <n>Iosephus Flavius</n>
  <n>Irenaeus, Sanctus</n>
  <n>Isocrates</n>
  <n>Iustinianus</n>
  <n>Iuvenalis, Decimus Iunius</n>
  <n>Johann Albert I</n>
  <n>Johann Friedrich II</n>
  <n>Kaprinai, Istvan</n>
  <n>Katona, Istvan</n>
  <n>Kazy, Ferenc</n>
  <n>Khalkokondyles, Laonikos</n>
  <n>Kircher, Atanasije</n>
  <n>Kopcsanyi, Mihaly</n>
  <n>Kracho, Joseph</n>
  <n>Kreutzen, Henryk Kasimir</n>
  <n>Kubinyi, Sandor</n>
  <n>La Bigne, Margarinus de</n>
  <n>La Caille, Nicolas Louis de</n>
  <n>La Croix, Francois de</n>
  <n>Lamormaini, Guillaume de</n>
  <n>Lampredi, Urbano</n>
  <n>Lapide, Cornelius a</n>
  <n>Laski, Jan</n>
  <n>Lavater, Johann Rudolph</n>
  <n>Le Quien, Michel</n>
  <n>Leardi, Paolo</n>
  <n>Leibniz, Gottfried Wilhelm</n>
  <n>Leo I</n>
  <n>Leo X</n>
  <n>Leo XII</n>
  <n>Leslie, Charles</n>
  <n>Leunclavius, Johannes</n>
  <n>Limborch, Philipp van</n>
  <n>Littrow, Josef Johann</n>
  <n>Lodereker, Petr</n>
  <n>Lohner, Tobias</n>
  <n>Lonicer, Philippus</n>
  <n>Loredano, Antonio</n>
  <n>Loscani, Francesco</n>
  <n>Lubomirski, Stanislaw Herakliusz</n>
  <n>Lucianus Samosatensis</n>
  <n>Luenig, Johann Christian</n>
  <n>Luther, Martin</n>
  <n>Magri, Domenico</n>
  <n>Mailath, Janos</n>
  <n>Maire, Christophe</n>
  <n>Mancinello, Lucido</n>
  <n>Mansi, Giovanni Domenico</n>
  <n>Mantelly, Carolus de</n>
  <n>Mantova, Marco Benavidio</n>
  <n>Marini, Marino</n>
  <n>Marmontel, Jean Francois</n>
  <n>Martialis, Marcus Valerius</n>
  <n>Massei, Giuseppe</n>
  <n>Mayerhofer, Ignaz</n>
  <n>Mazzolari, Giuseppe Maria</n>
  <n>Meczner, August</n>
  <n>Medini, Tommaso</n>
  <n>Mela, Pomponius</n>
  <n>Meletius Tiberiopolitanus</n>
  <n>Meneghelli, Antonio</n>
  <n>Menis, Wilhelm</n>
  <n>Mesenguy, Francois Phillippe</n>
  <n>Michaeler, Karl</n>
  <n>Miniati, Lorenzo</n>
  <n>Mirabilis, Nicolaus</n>
  <n>Modrzewski, Andrzej Frycz</n>
  <n>Monawius, Jacobus</n>
  <n>Monti, Vincenzo</n>
  <n>Morcelli, Stefano Antonio</n>
  <n>Morelli, Jacopo</n>
  <n>Morosini, Andrea</n>
  <n>Moschus</n>
  <n>Muratori, Ludovico Antonio</n>
  <n>Musaeus, Simon</n>
  <n>Naldi, Matteo</n>
  <n>Naogeorgus, Thomas</n>
  <n>Newton, Isaac</n>
  <n>Nieberle, Aemilianus</n>
  <n>Nieupoort, Willem Hendrik</n>
  <n>Nilus Thessalonicensis</n>
  <n>Nitray, Gabriel</n>
  <n>Noceti, Carlo</n>
  <n>Oinoprepius, Martinus</n>
  <n>Olah, Miklos</n>
  <n>Oppolitanus, Iohannes</n>
  <n>Orciano, Aminta</n>
  <n>Oresme, Nicolas</n>
  <n>Orivallius, Marinus</n>
  <n>Otfrid von Weissenburg</n>
  <n>Oughtred, William</n>
  <n>Ovidius Naso, Publius</n>
  <n>Paitoni, Giambattista</n>
  <n>Paleotimus, Lucius</n>
  <n>Palladio, Domizio</n>
  <n>Palma, Karoly Ferenc</n>
  <n>Pardies, Ignace Gaston</n>
  <n>Pascoli, Alessandro</n>
  <n>Paterno, Francesco Saverio</n>
  <n>Paulus III</n>
  <n>Paxy, Ludovicus</n>
  <n>Pechy, Andreas</n>
  <n>Pelago, Ludovicus a</n>
  <n>Penckler, Joseph</n>
  <n>Pereira de Figueiredo, Antonio</n>
  <n>Perghold, Paulus Lucas</n>
  <n>Peterffy, Karoly</n>
  <n>Pethe, Martinus</n>
  <n>Petitdidier, Mathieu</n>
  <n>Petronius Arbiter, Titus</n>
  <n>Petrus, Chrysologus</n>
  <n>Pez, Bernard</n>
  <n>Phaedrus</n>
  <n>Philoponus, Johannes Grammaticus</n>
  <n>Photius</n>
  <n>Pichler, Joseph</n>
  <n>Pinamonti, Giovanni Pietro</n>
  <n>Pindemonte, Ippolito</n>
  <n>Pio, Giovanni Battista</n>
  <n>Pisanelli, Baldassare</n>
  <n>Pitatus, Petrus</n>
  <n>Pius IV</n>
  <n>Pius IX</n>
  <n>Podlusani, Sigismundus</n>
  <n>Pole, Reginald</n>
  <n>Poliziano, Angelo</n>
  <n>Polybius</n>
  <n>Pomey, Francois</n>
  <n>Postel, Guillaume</n>
  <n>Pray, Gyorgy</n>
  <n>Prileszky, Janos</n>
  <n>Prileszky, Pavao</n>
  <n>Proclus</n>
  <n>Prosper, Aquitanus</n>
  <n>Ptolemaeus, Claudius</n>
  <n>Ptolomaeus Claudius</n>
  <n>Raby, Samuel</n>
  <n>Ransanus, Petrus</n>
  <n>Regnault, Noel</n>
  <n>Reina, Placido</n>
  <n>Reusch, Erhardo</n>
  <n>Reusch, Johann</n>
  <n>Riegger, Paul Joseph</n>
  <n>Ritter, Johann Balthasar</n>
  <n>Roncalli Parolino, Francesco</n>
  <n>Rondolini, Lorenzo</n>
  <n>Rosani, Giovanni Battista</n>
  <n>Rosarius, Simon</n>
  <n>Rosbach, Ignaz</n>
  <n>Rosenau, Ferdinand</n>
  <n>Roti, Carlo Antonio</n>
  <n>Sabinus, Georgius</n>
  <n>Sahl ibn Bishr</n>
  <n>Salvioni, Giovacchino</n>
  <n>Sambucus, Iohannes</n>
  <n>Saminati, Federico</n>
  <n>San Marco, Ottavio</n>
  <n>Sarpi, Paolo</n>
  <n>Schard, Simon</n>
  <n>Schendl, Fredericus</n>
  <n>Schilter, Johann</n>
  <n>Schlusselburg, Konradt</n>
  <n>Schmettau, Friedrich von</n>
  <n>Scholtz, Lorenz</n>
  <n>Schott, Gašpar</n>
  <n>Schraud, Franz</n>
  <n>Schuetz, Michael</n>
  <n>Segneri, Paolo</n>
  <n>Seneca, Lucius Annaeus</n>
  <n>Serlin, Wilhelm</n>
  <n>Sichard, Johannes</n>
  <n>Silius Italicus, Tiberius Catius Asconius</n>
  <n>Soardi, G. B.</n>
  <n>Socino, Fausto</n>
  <n>Sommarelli, Ottavio</n>
  <n>Sorge, Giuseppe</n>
  <n>Spreng, Jacobus</n>
  <n>Staphylus, Fridericus</n>
  <n>Stepling, Josephus</n>
  <n>Stilting, Iohann</n>
  <n>Stoltz, Johann</n>
  <n>Strabon</n>
  <n>Struve, Burkhard Gotthelf</n>
  <n>Suardi, Giambattista</n>
  <n>Sulpicius Severus</n>
  <n>Szent-Ivanyi, Marton</n>
  <n>Szirmay, Antal</n>
  <n>Szymonowicz, Szymon</n>
  <n>Tacquet, Andre</n>
  <n>Tana, Agostino</n>
  <n>Taucher, Michael</n>
  <n>Telegdi, Miklos</n>
  <n>Terentius Afer, Publius</n>
  <n>Teretius, Gregorcz</n>
  <n>Thalnitscher, Joannes Gregorius</n>
  <n>Themistius</n>
  <n>Theocritus</n>
  <n>Theophilus</n>
  <n>Thomas Aquinas</n>
  <n>Thomas a Kempis</n>
  <n>Thurius, Paulus</n>
  <n>Tolomeo, Giovanni Battista</n>
  <n>Torquemada, Juan de</n>
  <n>Ughelli, Ferdinando</n>
  <n>Ujhazy, Jozsef</n>
  <n>Urbanus, Averroista</n>
  <n>Valvasor, Janez Vajkard</n>
  <n>Vanden Broecke, Petrus Adrianus</n>
  <n>Vanni, Pietro</n>
  <n>Venini, Ignazio</n>
  <n>Veronius, Franciscus</n>
  <n>Vicomercatus, Franciscus</n>
  <n>Viete, Francois</n>
  <n>Vigerio, Marco</n>
  <n>Vincentius Lerinensis</n>
  <n>Vitruvius Pollio, Marcus</n>
  <n>Vittorelli, Giacomo</n>
  <n>Viva, Domenico</n>
  <n>Wernerus, T.</n>
  <n>Wicelius, Georgius</n>
  <n>Willebrand, Nicolaus</n>
  <n>Wolf, Iohannes</n>
  <n>Zaccaria, Francesco Antonio</n>
  <n>Zenner, Ferdinand</n>
  <n>Zoller, Martin</n>
</a>

(: for each item in sequence, batches of 100 :)
for $r in $rijeci/n[401>position() and position()>=301]

let $qrijeci := replace($r, " ", "+")
let $parsed := (doc(replace($url,'REPLACE_URN',$qrijeci)))

return element author { element ref { attribute type { "viaf" } , attribute target { data($parsed//ns2:VIAFCluster/ns2:viafID) } , data($r) } }
