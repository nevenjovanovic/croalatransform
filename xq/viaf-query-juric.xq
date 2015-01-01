(: query viaf for a list of names, get viafID's :)
declare namespace ns2="http://viaf.org/viaf/terms#";
declare namespace ns3="http://viaf.org/viaf/terms#";
(: address to which we are sending the queries :)
let $url := ("http://www.viaf.org/viaf/search?query=local.personalNames+all+%22REPLACE_URN%22&amp;maximumRecords=1&amp;sortKeys=holdingscount&amp;httpAccept=text/xml")
(: model as follows :)
(: http://viaf.org/viaf/search?query=[cqlQuery]&maximumRecords=100&startRecord=[startIndex]&sortKeys=holdingscount&httpAccept=text/xml :)
(: our sequence :)
let $rijeci := 

<nostri>
  <author ime="Adamović, Ladislav" type="croala" target="adamovicd1e3"/>
  <author ime="Agustinović, Đuro" type="croala" target="agustinovicd1e5"/>
  <author ime="Aichelburg, Andrija" type="croala" target="aichelburgd1e7"/>
  <author ime="Aigl, Glicerij" type="croala" target="aigld1e9"/>
  <author ime="Akai, Joannes" type="croala" target="akaid1e11"/>
  <author ime="Alagović, Aleksandar" type="croala" target="alagovicd1e14"/>
  <author ime="Albelly, Ludovicus" type="croala" target="albellyd1e16"/>
  <author ime="Albely, Antun Ferdinand" type="croala" target="albelyd1e18"/>
  <author ime="Albertini, Giorgio Maria"
           type="croala"
           target="albertinid1e20"/>
  <author ime="Aleksić, Mihajlo" type="croala" target="aleksicd1e22"/>
  <author ime="Alschinger, Andreas" type="croala" target="alschingerd1e24"/>
  <author ime="Althan, Josip Mihovil" type="croala" target="althand1e27"/>
  <author ime="Ambrozović, Ivan Nepomuk"
           type="croala"
           target="ambrozovicd1e29"/>
  <author ime="Andasy, Josef Ludvik" type="croala" target="andasyd1e31"/>
  <author ime="Andreis, Ivan" type="croala" target="andreisd1e33"/>
  <author ime="Andrejević, Bogoljub" type="croala" target="andrejevicd1e35"/>
  <author ime="Andrijašević, Vital" type="croala" target="andrijasevicd1e37"/>
  <author ime="Angelis, Ivan Karlo" type="croala" target="angelisd1e40"/>
  <author ime="Antolković, Mirko" type="croala" target="antolkovicd1e42"/>
  <author ime="Antonio Sivrich" type="croala" target="d1e44"/>
  <author ime="Aretophylus, Šimun" type="croala" target="aretophylusd1e46"/>
  <author ime="Attomyr, Josip" type="croala" target="attomyrd1e48"/>
  <author ime="Babić, Toma" type="croala" target="babicd1e50"/>
  <author ime="Babić, Vinko Marija" type="croala" target="babicd1e53"/>
  <author ime="Babulak, Oton" type="croala" target="babulakd1e55"/>
  <author ime="Badlahar, Ivan" type="croala" target="badlahard1e57"/>
  <author ime="Badovinac, Marko" type="croala" target="badovinacd1e59"/>
  <author ime="Bady, Hijacint" type="croala" target="badyd1e61"/>
  <author ime="Badz, Maximilianus" type="croala" target="badzd1e63"/>
  <author ime="Baglivi, Đuro" type="croala" target="baglivid1e66"/>
  <author ime="Bakšaj, Stjepan" type="croala" target="baksajd1e68"/>
  <author ime="Balla, Pavao" type="croala" target="ballad1e70"/>
  <author ime="Banduri, Anselmo" type="croala" target="bandurid1e72"/>
  <author ime="Banert, Franjo Ksaver" type="croala" target="banertd1e74"/>
  <author ime="Banić, Ivan" type="croala" target="banicd1e76"/>
  <author ime="Banjoni, Leonard" type="croala" target="banjonid1e79"/>
  <author ime="Bardarini, Josip" type="croala" target="bardarinid1e81"/>
  <author ime="Barić, Adalbert Adam" type="croala" target="baricd1e83"/>
  <author ime="Baričević, Adam Alojzij" type="croala" target="baricevicd1e85"/>
  <author ime="Bartaković, Jožef" type="croala" target="bartakovicd1e87"/>
  <author ime="Bartoletti Zulatti, Vinko"
           type="croala"
           target="bartoletti zulattid1e89"/>
  <author ime="Bartolomeo, Ivan Krstitelj"
           type="croala"
           target="bartolomeod1e92"/>
  <author ime="Barts, Ivan" type="croala" target="bartsd1e94"/>
  <author ime="Basilisco, Benedikt" type="croala" target="basiliscod1e96"/>
  <author ime="Basilisco, Lujo Karlo" type="croala" target="basiliscod1e98"/>
  <author ime="Bastašić, Pavao" type="croala" target="bastasicd1e100"/>
  <author ime="Batić, Lovro" type="croala" target="baticd1e102"/>
  <author ime="Bašić, Stjepan" type="croala" target="basicd1e105"/>
  <author ime="Beccadelli, Lodovico" type="croala" target="beccadellid1e107"/>
  <author ime="Bedeković Komorski, Ivan"
           type="croala"
           target="bedekovic komorskid1e109"/>
  <author ime="Bekšin, Antun" type="croala" target="beksind1e111"/>
  <author ime="Belan, Đuro" type="croala" target="beland1e113"/>
  <author ime="Belavić, Gabrijel Stjepan"
           type="croala"
           target="belavicd1e115"/>
  <author ime="Belglava, Antun" type="croala" target="belglavad1e118"/>
  <author ime="Belli Predojević, Pavao"
           type="croala"
           target="belli predojevicd1e120"/>
  <author ime="Bencur, Josef" type="croala" target="bencurd1e122"/>
  <author ime="Benetelli, Franjo" type="croala" target="benetellid1e124"/>
  <author ime="Benić, Bono" type="croala" target="benicd1e126"/>
  <author ime="Benković, Benedikt" type="croala" target="benkovicd1e128"/>
  <author ime="Benzon, Josip" type="croala" target="benzond1e131"/>
  <author ime="Benzoni, Ivan Antun" type="croala" target="benzonid1e133"/>
  <author ime="Berislavić, Stjepan" type="croala" target="berislavicd1e135"/>
  <author ime="Berković, Matija" type="croala" target="berkovicd1e137"/>
  <author ime="Bettera, Baro" type="croala" target="betterad1e139"/>
  <author ime="Bettini, Ivan Krstitelj" type="croala" target="bettinid1e141"/>
  <author ime="Beuvelet, Matthias" type="croala" target="beuveletd1e144"/>
  <author ime="Bioni, Viktor" type="croala" target="bionid1e146"/>
  <author ime="Birly, Florijan Eduard" type="croala" target="birlyd1e148"/>
  <author ime="Bizanti, Juraj" type="croala" target="bizantid1e150"/>
  <author ime="Blank, Josip" type="croala" target="blankd1e152"/>
  <author ime="Blašković, Aleksandar" type="croala" target="blaskovicd1e154"/>
  <author ime="Blašković, Fabijan" type="croala" target="blaskovicd1e157"/>
  <author ime="Blažinčić, Petar" type="croala" target="blazincicd1e159"/>
  <author ime="Blum, Josip" type="croala" target="blumd1e161"/>
  <author ime="Bobaljević Mišetić, Sabo"
           type="croala"
           target="bobaljevic miseticd1e163"/>
  <author ime="Bobić, Adam" type="croala" target="bobicd1e165"/>
  <author ime="Bogdanović, Martin" type="croala" target="bogdanovicd1e167"/>
  <author ime="Bogdanović, Sava" type="croala" target="bogdanovicd1e170"/>
  <author ime="Bogdanović, Urban" type="croala" target="bogdanovicd1e172"/>
  <author ime="Bogetić, Jakov" type="croala" target="bogeticd1e174"/>
  <author ime="Boiardi, Giovanni" type="croala" target="boiardid1e176"/>
  <author ime="Boić, Gabro" type="croala" target="boicd1e178"/>
  <author ime="Boić, Ilija" type="croala" target="boicd1e180"/>
  <author ime="Bolmarčić, Josip" type="croala" target="bolmarcicd1e183"/>
  <author ime="Bona-Boliris, Ivan" type="croala" target="bonabolirisd1e185"/>
  <author ime="Bonbardi, Michael" type="croala" target="bonbardid1e187"/>
  <author ime="Bonefačić, Bože Natal" type="croala" target="bonefacicd1e189"/>
  <author ime="Boni, Mauro" type="croala" target="bonid1e191"/>
  <author ime="Bonicelli, Frano" type="croala" target="bonicellid1e193"/>
  <author ime="Bonicelli, Niccolo" type="croala" target="bonicellid1e196"/>
  <author ime="Bordini, Filip Dominik" type="croala" target="bordinid1e198"/>
  <author ime="Boschi, Vicko" type="croala" target="boschid1e200"/>
  <author ime="Botteri, Ivan Marija" type="croala" target="botterid1e202"/>
  <author ime="Bozanić, Bartul" type="croala" target="bozanicd1e204"/>
  <author ime="Bozdogh, Martin" type="croala" target="bozdoghd1e206"/>
  <author ime="Bošković, Ruđer Josip" type="croala" target="boskovicd1e209"/>
  <author ime="Bradičić, Juraj" type="croala" target="bradicicd1e211"/>
  <author ime="Brambilla, Agostino" type="croala" target="brambillad1e213"/>
  <author ime="Brandl, Matthaeus" type="croala" target="brandld1e215"/>
  <author ime="Braniša, Josip" type="croala" target="branisad1e217"/>
  <author ime="Branjug, Juraj" type="croala" target="branjugd1e219"/>
  <author ime="Bratanić, Josip" type="croala" target="bratanicd1e222"/>
  <author ime="Bračuljević, Lovro" type="croala" target="braculjevicd1e224"/>
  <author ime="Bressan, Ivan" type="croala" target="bressand1e226"/>
  <author ime="Bresslauer, Jakob" type="croala" target="bresslauerd1e228"/>
  <author ime="Brigenti, Andrija" type="croala" target="brigentid1e230"/>
  <author ime="Briglević, Josip" type="croala" target="briglevicd1e232"/>
  <author ime="Bruerević, Marko" type="croala" target="bruerevicd1e235"/>
  <author ime="Bruna, Franjo" type="croala" target="brunad1e237"/>
  <author ime="Bruso, Livius Franciscus" type="croala" target="brusod1e239"/>
  <author ime="Bubanović, Silvestar" type="croala" target="bubanovicd1e241"/>
  <author ime="Buberlee, Terencijan" type="croala" target="buberleed1e243"/>
  <author ime="Bujanović, Julije" type="croala" target="bujanovicd1e245"/>
  <author ime="Bulić, Ilija" type="croala" target="bulicd1e248"/>
  <author ime="Bunić, Jerolim Frano" type="croala" target="bunicd1e250"/>
  <author ime="Bunić, Junije" type="croala" target="bunicd1e252"/>
  <author ime="Bunić, Luka Mihov" type="croala" target="bunicd1e254"/>
  <author ime="Bunić-Vučić, Ivan" type="croala" target="bunicvucicd1e256"/>
  <author ime="Bunić-Vučičević, Nikolica"
           type="croala"
           target="bunicvucicevicd1e258"/>
  <author ime="Burić, Frano" type="croala" target="buricd1e261"/>
  <author ime="Burić, Lovro" type="croala" target="buricd1e263"/>
  <author ime="Buća, Dominik" type="croala" target="bucad1e265"/>
  <author ime="Bučinjelić, Miho" type="croala" target="bucinjelicd1e267"/>
  <author ime="Bučić, Mihajlo" type="croala" target="bucicd1e269"/>
  <author ime="Bužan, Herman" type="croala" target="buzand1e271"/>
  <author ime="Bužan, Ivan" type="croala" target="buzand1e274"/>
  <author ime="Byff, Alojzije" type="croala" target="byffd1e276"/>
  <author ime="Calmet, Augustin" type="croala" target="calmetd1e278"/>
  <author ime="Capitaneis, Josip" type="croala" target="capitaneisd1e280"/>
  <author ime="Carrara, Franjo" type="croala" target="carrarad1e282"/>
  <author ime="Cecchini, Toma" type="croala" target="cecchinid1e284"/>
  <author ime="Cecchini, Tomaso" type="croala" target="cecchinid1e287"/>
  <author ime="Cedulini, Petar" type="croala" target="cedulinid1e289"/>
  <author ime="Celebrini, Ivan Nepomuk"
           type="croala"
           target="celebrinid1e291"/>
  <author ime="Cerineo, Ante" type="croala" target="cerineod1e293"/>
  <author ime="Ciccarelli, Andrija" type="croala" target="ciccarellid1e295"/>
  <author ime="Cigler, Josip" type="croala" target="ciglerd1e297"/>
  <author ime="Cimiotti, Anton" type="croala" target="cimiottid1e300"/>
  <author ime="Cimiotti-Steinberg, Ljudevit Josip"
           type="croala"
           target="cimiottisteinbergd1e302"/>
  <author ime="Cipiko, Lelij" type="croala" target="cipikod1e304"/>
  <author ime="Ciron, Innocent de" type="croala" target="cirond1e306"/>
  <author ime="Coler, Jacob" type="croala" target="colerd1e308"/>
  <author ime="Collognath, Leopold" type="croala" target="collognathd1e310"/>
  <author ime="Cornet, Rajmund" type="croala" target="cornetd1e313"/>
  <author ime="Cortivo, Ivan Krstitelj" type="croala" target="cortivod1e315"/>
  <author ime="Cosmi, Stjepan" type="croala" target="cosmid1e317"/>
  <author ime="Cosmini, Jakob" type="croala" target="cosminid1e319"/>
  <author ime="Crevato, Franjo" type="croala" target="crevatod1e321"/>
  <author ime="Crijević Tuberon, Ludovik"
           type="croala"
           target="crijevic tuberond1e323"/>
  <author ime="Crijević, Toma" type="croala" target="crijevicd1e326"/>
  <author ime="Crndić, Pavao" type="croala" target="crndicd1e328"/>
  <author ime="Crnota, Krsto" type="croala" target="crnotad1e330"/>
  <author ime="Cronfeld, Barnabas" type="croala" target="cronfeldd1e332"/>
  <author ime="Cruciani, Antun" type="croala" target="crucianid1e334"/>
  <author ime="Cservenyak, Ivan Nepomuk"
           type="croala"
           target="cservenyakd1e336"/>
  <author ime="Cupilli, Stjepan" type="croala" target="cupillid1e339"/>
  <author ime="Cvetinović, Đuro" type="croala" target="cvetinovicd1e341"/>
  <author ime="Dall'Acqua, Matteo" type="croala" target="dall'acquad1e343"/>
  <author ime="Damjan Tuheljski, Ivan"
           type="croala"
           target="damjan tuheljskid1e345"/>
  <author ime="Damjan Tuheljski, Vilim Fridrik"
           type="croala"
           target="damjan tuheljskid1e347"/>
  <author ime="Danilo, Franjo" type="croala" target="danilod1e349"/>
  <author ime="Danić, Mirko" type="croala" target="danicd1e352"/>
  <author ime="De Franceschi, Carlo"
           type="croala"
           target="de franceschid1e354"/>
  <author ime="Definis, Jerolim" type="croala" target="definisd1e356"/>
  <author ime="Definis, Vicko" type="croala" target="definisd1e358"/>
  <author ime="Della Bella, Ardelio" type="croala" target="della bellad1e360"/>
  <author ime="Demeter, Dimitrija" type="croala" target="demeterd1e362"/>
  <author ime="Dinarić, Stjepan" type="croala" target="dinaricd1e365"/>
  <author ime="Dojmi, Lujo" type="croala" target="dojmid1e367"/>
  <author ime="Dombay, Franjo" type="croala" target="dombayd1e369"/>
  <author ime="Domin Petruševečki, Ignjat"
           type="croala"
           target="domin petruseveckid1e371"/>
  <author ime="Domin, Josip Franjo" type="croala" target="domind1e373"/>
  <author ime="Dominik iz Dubrovnika" type="croala" target="d1e375"/>
  <author ime="Dominis, Markantun de" type="croala" target="dominisd1e378"/>
  <author ime="Dominković, Modest" type="croala" target="dominkovicd1e380"/>
  <author ime="Donatus, Aelius" type="croala" target="donatusd1e382"/>
  <author ime="Dorotić, Andrija" type="croala" target="doroticd1e384"/>
  <author ime="Draganić Vrančić, Friderik"
           type="croala"
           target="draganic vrancicd1e386"/>
  <author ime="Dragač, Jakov" type="croala" target="dragacd1e388"/>
  <author ime="Dragojević, Ivan" type="croala" target="dragojevicd1e391"/>
  <author ime="Dragonić, Gašpar" type="croala" target="dragonicd1e393"/>
  <author ime="Drašković, Ignac" type="croala" target="draskovicd1e395"/>
  <author ime="Drašković, Ivan" type="croala" target="draskovicd1e397"/>
  <author ime="Drašković, Juraj II" type="croala" target="draskovicd1e399"/>
  <author ime="Drašković, Juraj IV" type="croala" target="draskovicd1e401"/>
  <author ime="Dražić, Ivan" type="croala" target="drazicd1e404"/>
  <author ime="Dražić, Miroslav" type="croala" target="drazicd1e406"/>
  <author ime="Dražić, Nikola" type="croala" target="drazicd1e408"/>
  <author ime="Drčić, Josip Aleksander" type="croala" target="drcicd1e410"/>
  <author ime="Dubravec, Aleksandar Grgur"
           type="croala"
           target="dubravecd1e412"/>
  <author ime="Dumbović, Nikola" type="croala" target="dumbovicd1e414"/>
  <author ime="Dzian, Stephanus" type="croala" target="dziand1e417"/>
  <author ime="Ebner, Ladislav" type="croala" target="ebnerd1e419"/>
  <author ime="Elena, Giuseppe Maria" type="croala" target="elenad1e421"/>
  <author ime="Erdody, Ivan Nepomuk" type="croala" target="erdodyd1e423"/>
  <author ime="Erdody, Karlo" type="croala" target="erdodyd1e425"/>
  <author ime="Erdody, Petar" type="croala" target="erdodyd1e427"/>
  <author ime="Ernst, Ferdinand" type="croala" target="ernstd1e430"/>
  <author ime="Esterhazy, Mirko" type="croala" target="esterhazyd1e432"/>
  <author ime="Eszeki, Emerik" type="croala" target="eszekid1e434"/>
  <author ime="Fabek, Josip" type="croala" target="fabekd1e436"/>
  <author ime="Faber, Anton" type="croala" target="faberd1e438"/>
  <author ime="Faber, Dominik" type="croala" target="faberd1e440"/>
  <author ime="Faber, Philippus" type="croala" target="faberd1e443"/>
  <author ime="Faby, Mauricije" type="croala" target="fabyd1e445"/>
  <author ime="Facchinetti, Giovanni"
           type="croala"
           target="facchinettid1e447"/>
  <author ime="Fanfonja, Frane" type="croala" target="fanfonjad1e449"/>
  <author ime="Farkaš, Konstantin" type="croala" target="farkasd1e451"/>
  <author ime="Farlati, Daniele" type="croala" target="farlatid1e453"/>
  <author ime="Fat, Gustav" type="croala" target="fatd1e456"/>
  <author ime="Ferk, Nevin" type="croala" target="ferkd1e458"/>
  <author ime="Ferro, Pier Barnaba" type="croala" target="ferrod1e460"/>
  <author ime="Ferruzzi, Domnius" type="croala" target="ferruzzid1e462"/>
  <author ime="Fodroci, Juraj" type="croala" target="fodrocid1e464"/>
  <author ime="Fodroci, Ladislav" type="croala" target="fodrocid1e466"/>
  <author ime="Fogh, Ivan Hrizostom" type="croala" target="foghd1e469"/>
  <author ime="Folnegović, Fran" type="croala" target="folnegovicd1e471"/>
  <author ime="Forgach, Imre" type="croala" target="forgachd1e473"/>
  <author ime="Fortis, Alberto" type="croala" target="fortisd1e475"/>
  <author ime="Francetić, Petar" type="croala" target="franceticd1e477"/>
  <author ime="Frankopan, Bernardin" type="croala" target="frankopand1e479"/>
  <author ime="Frankopan, Juraj" type="croala" target="frankopand1e482"/>
  <author ime="Frankopan, Krsto" type="croala" target="frankopand1e484"/>
  <author ime="Frankopan, Vuk" type="croala" target="frankopand1e486"/>
  <author ime="Frari, Antun Anđelo" type="croala" target="frarid1e488"/>
  <author ime="Frari, Lujo" type="croala" target="frarid1e490"/>
  <author ime="Frint, Jacob" type="croala" target="frintd1e492"/>
  <author ime="Frkić, Mate" type="croala" target="frkicd1e495"/>
  <author ime="Fuchs, Franjo Ksaver" type="croala" target="fuchsd1e497"/>
  <author ime="Funtek, Đuro" type="croala" target="funtekd1e499"/>
  <author ime="Furjaković, Ivan Ernest"
           type="croala"
           target="furjakovicd1e501"/>
  <author ime="Fustinioni, Franjo Paulski"
           type="croala"
           target="fustinionid1e503"/>
  <author ime="Fuček, Ferdinand" type="croala" target="fucekd1e505"/>
  <author ime="Fuček, Štefan" type="croala" target="fucekd1e508"/>
  <author ime="Gajdek, Tomo" type="croala" target="gajdekd1e510"/>
  <author ime="Galjuf, Bernardin Antun" type="croala" target="galjufd1e512"/>
  <author ime="Galjuf, Josip" type="croala" target="galjufd1e514"/>
  <author ime="Gall, Josip" type="croala" target="galld1e516"/>
  <author ime="Galzigna, Ivan Petar" type="croala" target="galzignad1e518"/>
  <author ime="Gartner, Theodosius" type="croala" target="gartnerd1e521"/>
  <author ime="Gavrančić, Mihovil" type="croala" target="gavrancicd1e523"/>
  <author ime="Gašparić, Grgur Josip" type="croala" target="gasparicd1e525"/>
  <author ime="Gašparović, Nikola" type="croala" target="gasparovicd1e527"/>
  <author ime="Gebičić, Marko" type="croala" target="gebicicd1e529"/>
  <author ime="Georgijević, Teodor" type="croala" target="georgijevicd1e531"/>
  <author ime="Getaldić, Blaž" type="croala" target="getaldicd1e534"/>
  <author ime="Getaldić, Marin" type="croala" target="getaldicd1e536"/>
  <author ime="Giacich, Antonio Felice" type="croala" target="giacichd1e538"/>
  <author ime="Giuriceo, Antun" type="croala" target="giuriceod1e540"/>
  <author ime="Giuriceo, Nikola" type="croala" target="giuriceod1e542"/>
  <author ime="Glavač, Stjepan" type="croala" target="glavacd1e544"/>
  <author ime="Glavina, Venancij" type="croala" target="glavinad1e547"/>
  <author ime="Glavinić, Franjo" type="croala" target="glavinicd1e549"/>
  <author ime="Glavinić, Sebastijan" type="croala" target="glavinicd1e551"/>
  <author ime="Glezer, Dominik" type="croala" target="glezerd1e553"/>
  <author ime="Glogovac, Franjo" type="croala" target="glogovacd1e555"/>
  <author ime="Gmaz, Stjepan" type="croala" target="gmazd1e557"/>
  <author ime="Godeassi, Josip" type="croala" target="godeassid1e560"/>
  <author ime="Godenić, Venancije" type="croala" target="godenicd1e562"/>
  <author ime="Golner, Valentin" type="croala" target="golnerd1e564"/>
  <author ime="Gopčević, Đuro" type="croala" target="gopcevicd1e566"/>
  <author ime="Gorakuća, Ivan Aleksandar"
           type="croala"
           target="gorakucad1e568"/>
  <author ime="Goricaj, Alojzije Ladislav"
           type="croala"
           target="goricajd1e570"/>
  <author ime="Goričanec, Ivan" type="croala" target="goricanecd1e573"/>
  <author ime="Goričanec, Tomaš" type="croala" target="goricanecd1e575"/>
  <author ime="Gorjup, Ferko" type="croala" target="gorjupd1e577"/>
  <author ime="Grbčić, Petar Matija" type="croala" target="grbcicd1e579"/>
  <author ime="Gres, Ivan" type="croala" target="gresd1e581"/>
  <author ime="Gretser, Jakob" type="croala" target="gretserd1e583"/>
  <author ime="Grgić, Inocencijo" type="croala" target="grgicd1e586"/>
  <author ime="Grgić, Vinko" type="croala" target="grgicd1e588"/>
  <author ime="Grgur Šibenčanin" type="croala" target="d1e590"/>
  <author ime="Grisogono, Lovro" type="croala" target="grisogonod1e592"/>
  <author ime="Grličić, Ivan Feliks" type="croala" target="grlicicd1e594"/>
  <author ime="Grubanović, Josip" type="croala" target="grubanovicd1e596"/>
  <author ime="Grubišić, Klement" type="croala" target="grubisicd1e599"/>
  <author ime="Guglielmi, Luiđ" type="croala" target="guglielmid1e601"/>
  <author ime="Guidotto, Ivan" type="croala" target="guidottod1e603"/>
  <author ime="Gulnerić, Dragutin" type="croala" target="gulnericd1e605"/>
  <author ime="Gundulić, Frana Lucijan" type="croala" target="gundulicd1e607"/>
  <author ime="Gundulić, Ivan" type="croala" target="gundulicd1e609"/>
  <author ime="Gundulić, Josip Fran" type="croala" target="gundulicd1e612"/>
  <author ime="Gučetić, Vladislav Lukše" type="croala" target="guceticd1e614"/>
  <author ime="Gvidacerij, Agatij" type="croala" target="gvidacerijd1e616"/>
  <author ime="Gyulay Maros-Nemeth, Ignjat"
           type="croala"
           target="gyulay marosnemethd1e618"/>
  <author ime="Habdelić, Juraj" type="croala" target="habdelicd1e620"/>
  <author ime="Hadžić, Ivan" type="croala" target="hadzicd1e622"/>
  <author ime="Haller, Franjo" type="croala" target="hallerd1e625"/>
  <author ime="Haulik, Juraj" type="croala" target="haulikd1e627"/>
  <author ime="Hausar, Stjepan" type="croala" target="hausard1e629"/>
  <author ime="Hegedušević, Josip" type="croala" target="hegedusevicd1e631"/>
  <author ime="Hektorović, Petar" type="croala" target="hektorovicd1e633"/>
  <author ime="Henfner, Johannes" type="croala" target="henfnerd1e635"/>
  <author ime="Herwig, Bohuslav" type="croala" target="herwigd1e638"/>
  <author ime="Heyden, Sebald" type="croala" target="heydend1e640"/>
  <author ime="Hinterholzer, Franjo Ksaver"
           type="croala"
           target="hinterholzerd1e642"/>
  <author ime="Hinterholzer, Mihajlo"
           type="croala"
           target="hinterholzerd1e644"/>
  <author ime="Hormayer, Franjo" type="croala" target="hormayerd1e646"/>
  <author ime="Horvat, Gašpar" type="croala" target="horvatd1e648"/>
  <author ime="Horvat, Marko" type="croala" target="horvatd1e651"/>
  <author ime="Horvath Stanšić, Grgur"
           type="croala"
           target="horvath stansicd1e653"/>
  <author ime="Horvath, Ivan Krstitelj" type="croala" target="horvathd1e655"/>
  <author ime="Horvath, Josip" type="croala" target="horvathd1e657"/>
  <author ime="Horvath, Mihaly" type="croala" target="horvathd1e659"/>
  <author ime="Horvath, Miho" type="croala" target="horvathd1e661"/>
  <author ime="Horvath, Toma Zenon" type="croala" target="horvathd1e664"/>
  <author ime="Horvath-Stanšić, Grgur"
           type="croala"
           target="horvathstansicd1e666"/>
  <author ime="Horvatović, Marko" type="croala" target="horvatovicd1e668"/>
  <author ime="Hossche, Sidronio de" type="croala" target="hossched1e670"/>
  <author ime="Host, Nikola Toma" type="croala" target="hostd1e672"/>
  <author ime="Hrgović, Hinko" type="croala" target="hrgovicd1e674"/>
  <author ime="Ilija, Andrija" type="croala" target="ilijad1e677"/>
  <author ime="Ilijić, Grgo" type="croala" target="ilijicd1e679"/>
  <author ime="Imreffy, Stjepan" type="croala" target="imreffyd1e681"/>
  <author ime="Iohannes de Livno" type="croala" target="d1e683"/>
  <author ime="Iustinus Severus" type="croala" target="d1e685"/>
  <author ime="Ivanić, Jerko" type="croala" target="ivanicd1e687"/>
  <author ime="Ivanišević, Ivo" type="croala" target="ivanisevicd1e690"/>
  <author ime="Ivanović, Andrija" type="croala" target="ivanovicd1e692"/>
  <author ime="Ivančević, Nikola" type="croala" target="ivancevicd1e694"/>
  <author ime="Ivančić, Ivan" type="croala" target="ivancicd1e696"/>
  <author ime="Ivačić, Ljudevit" type="croala" target="ivacicd1e698"/>
  <author ime="Ivul, Gabor" type="croala" target="ivuld1e700"/>
  <author ime="Jaić, Marijan" type="croala" target="jaicd1e703"/>
  <author ime="Jakobović, Antun" type="croala" target="jakobovicd1e705"/>
  <author ime="Jakobovčanin, Đuro" type="croala" target="jakobovcanind1e707"/>
  <author ime="Jakonja, Nikola" type="croala" target="jakonjad1e709"/>
  <author ime="Jakovčić, Ante Pavao" type="croala" target="jakovcicd1e711"/>
  <author ime="Jakočević, Jeronim" type="croala" target="jakocevicd1e713"/>
  <author ime="Jakošić, Josip" type="croala" target="jakosicd1e716"/>
  <author ime="Jalošić, Andrija" type="croala" target="jalosicd1e718"/>
  <author ime="Jamometić, Andrija" type="croala" target="jamometicd1e720"/>
  <author ime="Janda, Franjo" type="croala" target="jandad1e722"/>
  <author ime="Jandera, Antun" type="croala" target="janderad1e724"/>
  <author ime="Janešić, Franjo Ksaver" type="croala" target="janesicd1e726"/>
  <author ime="Janković, Antun" type="croala" target="jankovicd1e729"/>
  <author ime="Janković, Josip" type="croala" target="jankovicd1e731"/>
  <author ime="Janković, Martin" type="croala" target="jankovicd1e733"/>
  <author ime="Janković-Spader, Oktavijan"
           type="croala"
           target="jankovicspaderd1e735"/>
  <author ime="Janson, Ivan Nepomuk" type="croala" target="jansond1e737"/>
  <author ime="Jančić, Pave" type="croala" target="jancicd1e739"/>
  <author ime="Jaskaj, Ivan" type="croala" target="jaskajd1e742"/>
  <author ime="Jelačić, Josip" type="croala" target="jelacicd1e744"/>
  <author ime="Jelenić, Mihovil" type="croala" target="jelenicd1e746"/>
  <author ime="Jelić, Vinko" type="croala" target="jelicd1e748"/>
  <author ime="Jelić-Dražojević, Mate"
           type="croala"
           target="jelicdrazojevicd1e750"/>
  <author ime="Jeličić Bakić, Ivan"
           type="croala"
           target="jelicic bakicd1e752"/>
  <author ime="Jeličić, Mate" type="croala" target="jelicicd1e755"/>
  <author ime="Jelčić, Frano" type="croala" target="jelcicd1e757"/>
  <author ime="Johannes de Mediolano" type="croala" target="d1e759"/>
  <author ime="Jordan, Augustin" type="croala" target="jordand1e761"/>
  <author ime="Josipović, Đuro" type="croala" target="josipovicd1e763"/>
  <author ime="Jozepac, Ivan" type="croala" target="jozepacd1e765"/>
  <author ime="Juraj Dubrovčanin" type="croala" target="d1e768"/>
  <author ime="Juranić, Juraj" type="croala" target="juranicd1e770"/>
  <author ime="Juretić, Martin" type="croala" target="jureticd1e772"/>
  <author ime="Jurin, Josip" type="croala" target="jurind1e774"/>
  <author ime="Jurjević, Gabrijel" type="croala" target="jurjevicd1e776"/>
  <author ime="Jurjević, Josip" type="croala" target="jurjevicd1e778"/>
  <author ime="Jurković, Ivan" type="croala" target="jurkovicd1e781"/>
  <author ime="Kabužić, Maroje" type="croala" target="kabuzicd1e783"/>
  <author ime="Kadčić, Antun" type="croala" target="kadcicd1e785"/>
  <author ime="Kadčić-Miošić, Pavao"
           type="croala"
           target="kadcicmiosicd1e787"/>
  <author ime="Kallivoda, Josip" type="croala" target="kallivodad1e789"/>
  <author ime="Kamauf, Đuro Ernest" type="croala" target="kamaufd1e791"/>
  <author ime="Kampion, Hijacint" type="croala" target="kampiond1e794"/>
  <author ime="Kanižlić, Antun" type="croala" target="kanizlicd1e796"/>
  <author ime="Kapy, Jozsef" type="croala" target="kapyd1e798"/>
  <author ime="Karaman Matijašević, Antun"
           type="croala"
           target="karaman matijasevicd1e800"/>
  <author ime="Karaman, Matija" type="croala" target="karamand1e802"/>
  <author ime="Kardoš, Josip" type="croala" target="kardosd1e804"/>
  <author ime="Kargačin, A." type="croala" target="kargacind1e807"/>
  <author ime="Karina, Josip" type="croala" target="karinad1e809"/>
  <author ime="Karner, Ivan Žigmund" type="croala" target="karnerd1e811"/>
  <author ime="Karninčić, Nikola" type="croala" target="karnincicd1e813"/>
  <author ime="Karolyi, Franciscus" type="croala" target="karolyid1e815"/>
  <author ime="Karolyi, Loerinc" type="croala" target="karolyid1e817"/>
  <author ime="Kačić Miošić, Anđelo"
           type="croala"
           target="kacic miosicd1e820"/>
  <author ime="Keglević Bužinski, Josip"
           type="croala"
           target="keglevic buzinskid1e822"/>
  <author ime="Keglević, Franjo Ksaver" type="croala" target="keglevicd1e824"/>
  <author ime="Keglević, Ladislav" type="croala" target="keglevicd1e826"/>
  <author ime="Keglević, Stjepan" type="croala" target="keglevicd1e828"/>
  <author ime="Keglević, Toma" type="croala" target="keglevicd1e830"/>
  <author ime="Keglević, Đuro" type="croala" target="keglevicd1e833"/>
  <author ime="Keglević, Žigmund" type="croala" target="keglevicd1e835"/>
  <author ime="Keresturi, Josip Alojz" type="croala" target="keresturid1e837"/>
  <author ime="Kery, Jan" type="croala" target="keryd1e839"/>
  <author ime="Kerznay, Bernard" type="croala" target="kerznayd1e841"/>
  <author ime="Kincel, Josip Ivan Nepomuk"
           type="croala"
           target="kinceld1e843"/>
  <author ime="Kirinić, Valentin" type="croala" target="kirinicd1e846"/>
  <author ime="Kitonić Kostajnički, Ivan"
           type="croala"
           target="kitonic kostajnickid1e848"/>
  <author ime="Kišević Horvat, Gašpar"
           type="croala"
           target="kisevic horvatd1e850"/>
  <author ime="Klaar, Alojz Ivan" type="croala" target="klaard1e852"/>
  <author ime="Klein, Karlo" type="croala" target="kleind1e854"/>
  <author ime="Klemen, Mihovil" type="croala" target="klemend1e856"/>
  <author ime="Klemenčić, Božidar" type="croala" target="klemencicd1e859"/>
  <author ime="Klemenčić, Martin Josip"
           type="croala"
           target="klemencicd1e861"/>
  <author ime="Klobučarić, Karlo" type="croala" target="klobucaricd1e863"/>
  <author ime="Klobušicki, Franjo" type="croala" target="klobusickid1e865"/>
  <author ime="Klohamer, Franjo" type="croala" target="klohamerd1e867"/>
  <author ime="Knežević, Bartul" type="croala" target="knezevicd1e869"/>
  <author ime="Knežević, Ladislav" type="croala" target="knezevicd1e872"/>
  <author ime="Kobbe, Đuro Vinko" type="croala" target="kobbed1e874"/>
  <author ime="Kocian, Samuel" type="croala" target="kociand1e876"/>
  <author ime="Koleczani, Adam" type="croala" target="koleczanid1e878"/>
  <author ime="Kolenić, Andrija" type="croala" target="kolenicd1e880"/>
  <author ime="Kolinović, Gabrijel" type="croala" target="kolinovicd1e882"/>
  <author ime="Koller, Franciscus" type="croala" target="kollerd1e885"/>
  <author ime="Kombol, Gašpar" type="croala" target="kombold1e887"/>
  <author ime="Komnenović, Grigorije" type="croala" target="komnenovicd1e889"/>
  <author ime="Konšćak, Ferdinand" type="croala" target="konscakd1e891"/>
  <author ime="Koroskenyi, Ludovik" type="croala" target="koroskenyid1e893"/>
  <author ime="Kosirić, Josip" type="croala" target="kosiricd1e895"/>
  <author ime="Kovačević, Toma" type="croala" target="kovacevicd1e898"/>
  <author ime="Kovačević, Vicko" type="croala" target="kovacevicd1e900"/>
  <author ime="Kovačić, Josip Nikola" type="croala" target="kovacicd1e902"/>
  <author ime="Kovačoci, Baltazar" type="croala" target="kovacocid1e904"/>
  <author ime="Košutić, Josip" type="croala" target="kosuticd1e906"/>
  <author ime="Krainz, Ivan" type="croala" target="krainzd1e908"/>
  <author ime="Krajačić, Marko" type="croala" target="krajacicd1e911"/>
  <author ime="Krajačić, Petar" type="croala" target="krajacicd1e913"/>
  <author ime="Krajčović, Adam" type="croala" target="krajcovicd1e915"/>
  <author ime="Kralić, Nikola" type="croala" target="kralicd1e917"/>
  <author ime="Kraljić, Josip" type="croala" target="kraljicd1e919"/>
  <author ime="Krieger, Ljudevit Josip" type="croala" target="kriegerd1e921"/>
  <author ime="Kristian, Pavel" type="croala" target="kristiand1e924"/>
  <author ime="Kristianopulo, Herman Dominik"
           type="croala"
           target="kristianopulod1e926"/>
  <author ime="Kristijanović, Alojzije"
           type="croala"
           target="kristijanovicd1e928"/>
  <author ime="Križ, Krizostom" type="croala" target="krizd1e930"/>
  <author ime="Križan, Dioniz" type="croala" target="krizand1e932"/>
  <author ime="Krkvarić, Đuro" type="croala" target="krkvaricd1e934"/>
  <author ime="Krmpotić, Joso" type="croala" target="krmpoticd1e937"/>
  <author ime="Kružić, Matija" type="croala" target="kruzicd1e939"/>
  <author ime="Krznaj, Bernard" type="croala" target="krznajd1e941"/>
  <author ime="Krčelić, Matija" type="croala" target="krcelicd1e943"/>
  <author ime="Krčmeri, Vjenceslav" type="croala" target="krcmerid1e945"/>
  <author ime="Krša, Antun" type="croala" target="krsad1e947"/>
  <author ime="Kuhačević, Vuk" type="croala" target="kuhacevicd1e950"/>
  <author ime="Kukavac, Ante" type="croala" target="kukavacd1e952"/>
  <author ime="Kukec, Antun" type="croala" target="kukecd1e954"/>
  <author ime="Kukuljević, Franjo" type="croala" target="kukuljevicd1e956"/>
  <author ime="Kukuljević, Vuk" type="croala" target="kukuljevicd1e958"/>
  <author ime="Kulundžić, Stjepan" type="croala" target="kulundzicd1e960"/>
  <author ime="Kulundžić, Tomo" type="croala" target="kulundzicd1e963"/>
  <author ime="Kundek, Josip" type="croala" target="kundekd1e965"/>
  <author ime="Kurelić, Antun" type="croala" target="kurelicd1e967"/>
  <author ime="Kučinić, Hinko" type="croala" target="kucinicd1e969"/>
  <author ime="Kušević, Josip" type="croala" target="kusevicd1e971"/>
  <author ime="Lacković, Ladislav" type="croala" target="lackovicd1e973"/>
  <author ime="Lakić, Juraj Sigismund" type="croala" target="lakicd1e976"/>
  <author ime="Lakić, Juraj Žigmund" type="croala" target="lakicd1e978"/>
  <author ime="Lalangue, Jean Baptiste" type="croala" target="lalangued1e980"/>
  <author ime="Laminecius, Simon" type="croala" target="lamineciusd1e982"/>
  <author ime="Lamprecht, Rudolf" type="croala" target="lamprechtd1e984"/>
  <author ime="Lanosović, Marijan" type="croala" target="lanosovicd1e986"/>
  <author ime="Lanza, Francesco" type="croala" target="lanzad1e989"/>
  <author ime="Laslović, August Dragutin"
           type="croala"
           target="laslovicd1e991"/>
  <author ime="Lastrić-Oćevac, Filip"
           type="croala"
           target="lastricocevacd1e993"/>
  <author ime="Latković, Stjepan" type="croala" target="latkovicd1e995"/>
  <author ime="Leaković, Bernardin" type="croala" target="leakovicd1e997"/>
  <author ime="Lešević, Josip" type="croala" target="lesevicd1e999"/>
  <author ime="Lešćan, Udalrik" type="croala" target="lescand1e1002"/>
  <author ime="Lion, Zaharija" type="croala" target="liond1e1004"/>
  <author ime="Lipić, Fran Viljem" type="croala" target="lipicd1e1006"/>
  <author ime="Lipovčić, Jeronim" type="croala" target="lipovcicd1e1008"/>
  <author ime="Lipšić, Mihael" type="croala" target="lipsicd1e1010"/>
  <author ime="Lipšić, Mihovil" type="croala" target="lipsicd1e1012"/>
  <author ime="Livak, Franjo Ksaver" type="croala" target="livakd1e1015"/>
  <author ime="Ljubić, Ivan" type="croala" target="ljubicd1e1017"/>
  <author ime="Lopes, Gregorio" type="croala" target="lopesd1e1019"/>
  <author ime="Lornja, Antun Marija" type="croala" target="lornjad1e1021"/>
  <author ime="Lornja, Antun Marije" type="croala" target="lornjad1e1023"/>
  <author ime="Losgott, Stanislav" type="croala" target="losgottd1e1025"/>
  <author ime="Lovinić, Mijo" type="croala" target="lovinicd1e1028"/>
  <author ime="Lovrenčić, Ivan" type="croala" target="lovrencicd1e1030"/>
  <author ime="Lošić, Stjepan" type="croala" target="losicd1e1032"/>
  <author ime="Lubin, Antun" type="croala" target="lubind1e1034"/>
  <author ime="Lucić, Franjo" type="croala" target="lucicd1e1036"/>
  <author ime="Lukavski, Donat" type="croala" target="lukavskid1e1038"/>
  <author ime="Lukačić, Ivan" type="croala" target="lukacicd1e1041"/>
  <author ime="Luković, Antun" type="croala" target="lukovicd1e1043"/>
  <author ime="Lupati, Andrija" type="croala" target="lupatid1e1045"/>
  <author ime="Lutter, Josip" type="croala" target="lutterd1e1047"/>
  <author ime="Macokatić, Franjo" type="croala" target="macokaticd1e1049"/>
  <author ime="Mahanović, Marko" type="croala" target="mahanovicd1e1051"/>
  <author ime="Majlath de Szekhely, Josef"
           type="croala"
           target="majlath de szekhelyd1e1054"/>
  <author ime="Major, Bernardin" type="croala" target="majord1e1056"/>
  <author ime="Makale, Stjepan" type="croala" target="makaled1e1058"/>
  <author ime="Makar, Andrija" type="croala" target="makard1e1060"/>
  <author ime="Makrančić, Petar" type="croala" target="makrancicd1e1062"/>
  <author ime="Malać, Đuro" type="croala" target="malacd1e1064"/>
  <author ime="Maljevac, Juraj" type="croala" target="maljevacd1e1067"/>
  <author ime="Manger, Petar" type="croala" target="mangerd1e1069"/>
  <author ime="Manola, Ivo" type="croala" target="manolad1e1071"/>
  <author ime="Manzador, Pijo" type="croala" target="manzadord1e1073"/>
  <author ime="Manzin, Josip Stjepan" type="croala" target="manzind1e1075"/>
  <author ime="Manzoni, Mihovil" type="croala" target="manzonid1e1077"/>
  <author ime="Maraković, Nikola" type="croala" target="marakovicd1e1080"/>
  <author ime="Marburg, Ivan Josip" type="croala" target="marburgd1e1082"/>
  <author ime="Marburg, Ksaver Klement" type="croala" target="marburgd1e1084"/>
  <author ime="Marcocchia, Ante" type="croala" target="marcocchiad1e1086"/>
  <author ime="Marcocchia, Karlo" type="croala" target="marcocchiad1e1088"/>
  <author ime="Marešević, Ivan Petar" type="croala" target="maresevicd1e1090"/>
  <author ime="Mariani, Jakov" type="croala" target="marianid1e1093"/>
  <author ime="Marijanović, Stjepan"
           type="croala"
           target="marijanovicd1e1095"/>
  <author ime="Marini, Stjepan" type="croala" target="marinid1e1097"/>
  <author ime="Marinković, Ante" type="croala" target="marinkovicd1e1099"/>
  <author ime="Marinković, Petar" type="croala" target="marinkovicd1e1101"/>
  <author ime="Marinović, Josip" type="croala" target="marinovicd1e1103"/>
  <author ime="Mariosa, Jakov" type="croala" target="mariosad1e1106"/>
  <author ime="Marković, Ambroz" type="croala" target="markovicd1e1108"/>
  <author ime="Marković, Franjo Ksaver"
           type="croala"
           target="markovicd1e1110"/>
  <author ime="Marković, Ivan" type="croala" target="markovicd1e1112"/>
  <author ime="Marković, Ivan Nepomuk" type="croala" target="markovicd1e1114"/>
  <author ime="Marković, Matija" type="croala" target="markovicd1e1116"/>
  <author ime="Marković, Matija Antun" type="croala" target="markovicd1e1119"/>
  <author ime="Marković, Pavao Antun" type="croala" target="markovicd1e1121"/>
  <author ime="Marotti Jurjenić, Andrija"
           type="croala"
           target="marotti jurjenicd1e1123"/>
  <author ime="Marotti, Đuro Franjo Ksaver"
           type="croala"
           target="marottid1e1125"/>
  <author ime="Marsigli, Luigi Ferdinando"
           type="croala"
           target="marsiglid1e1127"/>
  <author ime="Martinis, Andrija" type="croala" target="martinisd1e1129"/>
  <author ime="Martinović, Dominik Ignacije"
           type="croala"
           target="martinovicd1e1132"/>
  <author ime="Martinović, Petar" type="croala" target="martinovicd1e1134"/>
  <author ime="Marčelja, Josip" type="croala" target="marceljad1e1136"/>
  <author ime="Maslač, Anđeo" type="croala" target="maslacd1e1138"/>
  <author ime="Matafaris, Nicolaus de"
           type="croala"
           target="matafarisd1e1140"/>
  <author ime="Matačić, Petar" type="croala" target="matacicd1e1142"/>
  <author ime="Matijašević, Ivan Marija"
           type="croala"
           target="matijasevicd1e1145"/>
  <author ime="Matković, Ivan" type="croala" target="matkovicd1e1147"/>
  <author ime="Matschkal, Karlo" type="croala" target="matschkald1e1149"/>
  <author ime="Matsik, Josip" type="croala" target="matsikd1e1151"/>
  <author ime="Maurović, Josip" type="croala" target="maurovicd1e1153"/>
  <author ime="Mayerik, Eugen" type="croala" target="mayerikd1e1155"/>
  <author ime="Mazorani, Josip" type="croala" target="mazoranid1e1158"/>
  <author ime="Mazzoleni Dalmata, Antonius"
           type="croala"
           target="mazzoleni dalmatad1e1160"/>
  <author ime="Mačik, Josip" type="croala" target="macikd1e1162"/>
  <author ime="Mašek, Ivan" type="croala" target="masekd1e1164"/>
  <author ime="Mažuranić, Antun" type="croala" target="mazuranicd1e1166"/>
  <author ime="Medarić, Filip" type="croala" target="medaricd1e1168"/>
  <author ime="Medo, Antun" type="croala" target="medod1e1171"/>
  <author ime="Mekinić, Grgur" type="croala" target="mekinicd1e1173"/>
  <author ime="Merula, Vinko" type="croala" target="merulad1e1175"/>
  <author ime="Michelazzi, Augustin" type="croala" target="michelazzid1e1177"/>
  <author ime="Migić, Franjo" type="croala" target="migicd1e1179"/>
  <author ime="Mihailjević, Ivan" type="croala" target="mihailjevicd1e1181"/>
  <author ime="Mihailović, Ivan" type="croala" target="mihailovicd1e1184"/>
  <author ime="Mihalić, Antun" type="croala" target="mihalicd1e1186"/>
  <author ime="Mihalović, Ivan" type="croala" target="mihalovicd1e1188"/>
  <author ime="Mikalja, Jakov" type="croala" target="mikaljad1e1190"/>
  <author ime="Mikloušić, Tomo" type="croala" target="miklousicd1e1192"/>
  <author ime="Mikoci, Josip" type="croala" target="mikocid1e1194"/>
  <author ime="Mikulić, Aleksandar Ignacije"
           type="croala"
           target="mikulicd1e1197"/>
  <author ime="Mikussay, Ivan" type="croala" target="mikussayd1e1199"/>
  <author ime="Milaković, Ivan Nepomuk"
           type="croala"
           target="milakovicd1e1201"/>
  <author ime="Milesius, Gregorius Pius"
           type="croala"
           target="milesiusd1e1203"/>
  <author ime="Miličić, Franjo" type="croala" target="milicicd1e1205"/>
  <author ime="Milišić, Miho Marija" type="croala" target="milisicd1e1207"/>
  <author ime="Milko, Leopold" type="croala" target="milkod1e1210"/>
  <author ime="Milković, Mihovil" type="croala" target="milkovicd1e1212"/>
  <author ime="Miller, Antun" type="croala" target="millerd1e1214"/>
  <author ime="Miller, Celestin" type="croala" target="millerd1e1216"/>
  <author ime="Miller, Iacobus Ferdinandus"
           type="croala"
           target="millerd1e1218"/>
  <author ime="Milovec, Baltazar" type="croala" target="milovecd1e1220"/>
  <author ime="Miloš, Josip" type="croala" target="milosd1e1223"/>
  <author ime="Milčić, Antun" type="croala" target="milcicd1e1225"/>
  <author ime="Mirošević, Nikola" type="croala" target="mirosevicd1e1227"/>
  <author ime="Mitterpacher, Josip"
           type="croala"
           target="mitterpacherd1e1229"/>
  <author ime="Mitterpacher, Ludwig"
           type="croala"
           target="mitterpacherd1e1231"/>
  <author ime="Mišetić, Ante" type="croala" target="miseticd1e1233"/>
  <author ime="Mišković, Cirin" type="croala" target="miskovicd1e1236"/>
  <author ime="Mladinić, Sebastijan" type="croala" target="mladinicd1e1238"/>
  <author ime="Mladošović, Matija" type="croala" target="mladosovicd1e1240"/>
  <author ime="Mlinarić, Josip" type="croala" target="mlinaricd1e1242"/>
  <author ime="Molnar, Antun" type="croala" target="molnard1e1244"/>
  <author ime="Molnar, Pavao" type="croala" target="molnard1e1246"/>
  <author ime="Monasterioti, Teodor"
           type="croala"
           target="monasteriotid1e1249"/>
  <author ime="Moro, Alojzije" type="croala" target="morod1e1251"/>
  <author ime="Moyses, Štefan" type="croala" target="moysesd1e1253"/>
  <author ime="Mraović, Aleksa st." type="croala" target="mraovicd1e1255"/>
  <author ime="Mravinec, Adam" type="croala" target="mravinecd1e1257"/>
  <author ime="Mraz, Mihael" type="croala" target="mrazd1e1259"/>
  <author ime="Mueller, Gašpar" type="croala" target="muellerd1e1262"/>
  <author ime="Mulih, Juraj" type="croala" target="mulihd1e1264"/>
  <author ime="Muljačić, Nikola" type="croala" target="muljacicd1e1266"/>
  <author ime="Mulle, Janez" type="croala" target="mulled1e1268"/>
  <author ime="Mutiis, Donatus a" type="croala" target="mutiisd1e1270"/>
  <author ime="Nagy, Fortunat Srećko" type="croala" target="nagyd1e1272"/>
  <author ime="Nagy, Ivan" type="croala" target="nagyd1e1275"/>
  <author ime="Nagy, Roko" type="croala" target="nagyd1e1277"/>
  <author ime="Nais, Joannes Baptista" type="croala" target="naisd1e1279"/>
  <author ime="Nani, Ivan" type="croala" target="nanid1e1281"/>
  <author ime="Nazor, Mihajlo" type="croala" target="nazord1e1283"/>
  <author ime="Nemčić, Antun" type="croala" target="nemcicd1e1285"/>
  <author ime="Niger, Petrus" type="croala" target="nigerd1e1288"/>
  <author ime="Nigretić, Franjo" type="croala" target="nigreticd1e1290"/>
  <author ime="Nikolić, Izidor" type="croala" target="nikolicd1e1292"/>
  <author ime="Nikolić, Mate" type="croala" target="nikolicd1e1294"/>
  <author ime="Nikolić, Đuro" type="croala" target="nikolicd1e1296"/>
  <author ime="Nikolorić, Ante" type="croala" target="nikoloricd1e1298"/>
  <author ime="Niseteo, Marko Antun" type="croala" target="niseteod1e1301"/>
  <author ime="Nolden, Hugo" type="croala" target="noldend1e1303"/>
  <author ime="Nonveiller, Lujo" type="croala" target="nonveillerd1e1305"/>
  <author ime="Novak, Josip Frane" type="croala" target="novakd1e1307"/>
  <author ime="Novak, Mirko" type="croala" target="novakd1e1309"/>
  <author ime="Nović, Josip" type="croala" target="novicd1e1311"/>
  <author ime="Novoselić, Josip" type="croala" target="novoselicd1e1314"/>
  <author ime="Nutrizio-Grisogono, Petar"
           type="croala"
           target="nutriziogrisogonod1e1316"/>
  <author ime="Obad, Đuro" type="croala" target="obadd1e1318"/>
  <author ime="Oberster, Josip Dragutin"
           type="croala"
           target="obersterd1e1320"/>
  <author ime="Obratković, Mihovil" type="croala" target="obratkovicd1e1322"/>
  <author ime="Ocskay, Antun" type="croala" target="ocskayd1e1324"/>
  <author ime="Opoevčanin, Stjepan" type="croala" target="opoevcanind1e1327"/>
  <author ime="Oriovčanin, Klement" type="croala" target="oriovcanind1e1329"/>
  <author ime="Orsetti, Klement" type="croala" target="orsettid1e1331"/>
  <author ime="Oršić, Ernestina" type="croala" target="orsicd1e1333"/>
  <author ime="Ostoić, Jeronim" type="croala" target="ostoicd1e1335"/>
  <author ime="Ostoić, Niko" type="croala" target="ostoicd1e1337"/>
  <author ime="Ostojić, Ivan" type="croala" target="ostojicd1e1340"/>
  <author ime="Ožegović, Mirko" type="croala" target="ozegovicd1e1342"/>
  <author ime="Padovan, Marko" type="croala" target="padovand1e1344"/>
  <author ime="Pagan, Just" type="croala" target="pagand1e1346"/>
  <author ime="Pakši, Ivan Krstitelj" type="croala" target="paksid1e1348"/>
  <author ime="Palković, Andrija" type="croala" target="palkovicd1e1350"/>
  <author ime="Pančić, Josip" type="croala" target="pancicd1e1353"/>
  <author ime="Papafava, Roberto" type="croala" target="papafavad1e1355"/>
  <author ime="Papanek, Georgius" type="croala" target="papanekd1e1357"/>
  <author ime="Papušljić, Antun" type="croala" target="papusljicd1e1359"/>
  <author ime="Paravia, Pier Alessandro"
           type="croala"
           target="paraviad1e1361"/>
  <author ime="Paravić, Romualdo" type="croala" target="paravicd1e1363"/>
  <author ime="Parčić, Franjo" type="croala" target="parcicd1e1366"/>
  <author ime="Paschalis a Varisio" type="croala" target="d1e1368"/>
  <author ime="Pasconi, Klaro" type="croala" target="pasconid1e1370"/>
  <author ime="Paskvić, Ivan N." type="croala" target="paskvicd1e1372"/>
  <author ime="Passero, Gabriele" type="croala" target="passerod1e1374"/>
  <author ime="Pastore, Raphael" type="croala" target="pastored1e1376"/>
  <author ime="Patačić, Adam" type="croala" target="patacicd1e1379"/>
  <author ime="Patačić, Gabrijel Herman"
           type="croala"
           target="patacicd1e1381"/>
  <author ime="Patačić, Ivan" type="croala" target="patacicd1e1383"/>
  <author ime="Patković, Baltazar" type="croala" target="patkovicd1e1385"/>
  <author ime="Patuna, Bartol" type="croala" target="patunad1e1387"/>
  <author ime="Pavao iz Baje" type="croala" target="d1e1389"/>
  <author ime="Pavić, Antun Aleksandar" type="croala" target="pavicd1e1392"/>
  <author ime="Pavić, Emerik" type="croala" target="pavicd1e1394"/>
  <author ime="Pavić, Karlo" type="croala" target="pavicd1e1396"/>
  <author ime="Pavlić, Pavao" type="croala" target="pavlicd1e1398"/>
  <author ime="Pavlović Lučić, Ivan Josip"
           type="croala"
           target="pavlovic lucicd1e1400"/>
  <author ime="Payer, Ivan Leopold" type="croala" target="payerd1e1402"/>
  <author ime="Paštrić, Ivan" type="croala" target="pastricd1e1405"/>
  <author ime="Pehm, Kerubin" type="croala" target="pehmd1e1407"/>
  <author ime="Pejaković, Stjepan" type="croala" target="pejakovicd1e1409"/>
  <author ime="Pejačević, Franjo Ksaver"
           type="croala"
           target="pejacevicd1e1411"/>
  <author ime="Pejačević, Jakov" type="croala" target="pejacevicd1e1413"/>
  <author ime="Pejačević, Petar" type="croala" target="pejacevicd1e1415"/>
  <author ime="Pellegrini, Cezar" type="croala" target="pellegrinid1e1418"/>
  <author ime="Pellegrini, Kazimir" type="croala" target="pellegrinid1e1420"/>
  <author ime="Pereczky, Antun" type="croala" target="pereczkyd1e1422"/>
  <author ime="Peri, Thomas de" type="croala" target="perid1e1424"/>
  <author ime="Perin, Leonard" type="croala" target="perind1e1426"/>
  <author ime="Peruviz, Ivan Marijan" type="croala" target="peruvizd1e1428"/>
  <author ime="Peterfi, Adalbert" type="croala" target="peterfid1e1431"/>
  <author ime="Petev, Stjepan" type="croala" target="petevd1e1433"/>
  <author ime="Petraš, Josip" type="croala" target="petrasd1e1435"/>
  <author ime="Petretić, Petar" type="croala" target="petreticd1e1437"/>
  <author ime="Petretić, Stjepan" type="croala" target="petreticd1e1439"/>
  <author ime="Petrić, P. C." type="croala" target="petricd1e1441"/>
  <author ime="Petričević, Gašpar" type="croala" target="petricevicd1e1444"/>
  <author ime="Petrović, Ivan Grgur" type="croala" target="petrovicd1e1446"/>
  <author ime="Petrović, Josip" type="croala" target="petrovicd1e1448"/>
  <author ime="Petrović, Matija" type="croala" target="petrovicd1e1450"/>
  <author ime="Petruševec, Ignac Domin"
           type="croala"
           target="petrusevecd1e1452"/>
  <author ime="Pešle, Albert" type="croala" target="pesled1e1454"/>
  <author ime="Peštalić, Grgur" type="croala" target="pestalicd1e1457"/>
  <author ime="Pfisterer, Andrija" type="croala" target="pfistererd1e1459"/>
  <author ime="Piljurović, Aleksa" type="croala" target="piljurovicd1e1461"/>
  <author ime="Pinelli, Nicolo" type="croala" target="pinellid1e1463"/>
  <author ime="Pini, Alojzije Marija" type="croala" target="pinid1e1465"/>
  <author ime="Pini, Žigmund" type="croala" target="pinid1e1467"/>
  <author ime="Pintarić, Fortunat Srećko"
           type="croala"
           target="pintaricd1e1470"/>
  <author ime="Pir, Didak" type="croala" target="pird1e1472"/>
  <author ime="Pisačić, Emerik" type="croala" target="pisacicd1e1474"/>
  <author ime="Pisačić, Fridrik Kazimir"
           type="croala"
           target="pisacicd1e1476"/>
  <author ime="Piuković, Nikola" type="croala" target="piukovicd1e1478"/>
  <author ime="Pizzelli, Nikola" type="croala" target="pizzellid1e1480"/>
  <author ime="Plemić, Franjo" type="croala" target="plemicd1e1483"/>
  <author ime="Plepelić, Ivan" type="croala" target="plepelicd1e1485"/>
  <author ime="Pleyel, Josip Kalasancije"
           type="croala"
           target="pleyeld1e1487"/>
  <author ime="Pleše, Jeronim" type="croala" target="plesed1e1489"/>
  <author ime="Polikarp Severitan, Ivan"
           type="croala"
           target="polikarp severitand1e1491"/>
  <author ime="Polić, Luka" type="croala" target="policd1e1493"/>
  <author ime="Pongrac, Antun" type="croala" target="pongracd1e1496"/>
  <author ime="Pongrac, J." type="croala" target="pongracd1e1498"/>
  <author ime="Popović, Franjo Josip" type="croala" target="popovicd1e1500"/>
  <author ime="Posavec, Ivan Ljudevit" type="croala" target="posavecd1e1502"/>
  <author ime="Posedarski, Stjepan" type="croala" target="posedarskid1e1504"/>
  <author ime="Posilović, Pavao" type="croala" target="posilovicd1e1506"/>
  <author ime="Potočnjak, Grgur" type="croala" target="potocnjakd1e1509"/>
  <author ime="Prandt, Ignjat Adam" type="croala" target="prandtd1e1511"/>
  <author ime="Praunsperger, Aleksa"
           type="croala"
           target="praunspergerd1e1513"/>
  <author ime="Prevendar, Ivan" type="croala" target="prevendard1e1515"/>
  <author ime="Prigl, Lovro" type="croala" target="prigld1e1517"/>
  <author ime="Protić, Bazilije" type="croala" target="proticd1e1519"/>
  <author ime="Prusac, Danijel" type="croala" target="prusacd1e1522"/>
  <author ime="Pucić, Fran" type="croala" target="pucicd1e1524"/>
  <author ime="Puović, Mihovil" type="croala" target="puovicd1e1526"/>
  <author ime="Purgstall, Antun" type="croala" target="purgstalld1e1528"/>
  <author ime="Purulić, Matija" type="croala" target="purulicd1e1530"/>
  <author ime="Rac, Istvan" type="croala" target="racd1e1532"/>
  <author ime="Radeljević, Rafael" type="croala" target="radeljevicd1e1535"/>
  <author ime="Radić, Antun" type="croala" target="radicd1e1537"/>
  <author ime="Radić, Ludovik" type="croala" target="radicd1e1539"/>
  <author ime="Radičević, Juraj Antun"
           type="croala"
           target="radicevicd1e1541"/>
  <author ime="Radočaj, Ivan" type="croala" target="radocajd1e1543"/>
  <author ime="Radulović, Didak" type="croala" target="radulovicd1e1545"/>
  <author ime="Radulović, Marko" type="croala" target="radulovicd1e1548"/>
  <author ime="Raffay, Emerik Karlo" type="croala" target="raffayd1e1550"/>
  <author ime="Rain, Ignac" type="croala" target="raind1e1552"/>
  <author ime="Raisp, Antun" type="croala" target="raispd1e1554"/>
  <author ime="Rakovac, Aleksa" type="croala" target="rakovacd1e1556"/>
  <author ime="Randić, Luka" type="croala" target="randicd1e1558"/>
  <author ime="Randić, Srećko" type="croala" target="randicd1e1561"/>
  <author ime="Ranić, Stjepan" type="croala" target="ranicd1e1563"/>
  <author ime="Rasch, Johann" type="croala" target="raschd1e1565"/>
  <author ime="Ratkaj, Juraj" type="croala" target="ratkajd1e1567"/>
  <author ime="Rauth, Edo" type="croala" target="rauthd1e1569"/>
  <author ime="Rauš, Franjo" type="croala" target="rausd1e1571"/>
  <author ime="Rauš, Ivan" type="croala" target="rausd1e1574"/>
  <author ime="Razzi, Serafino" type="croala" target="razzid1e1576"/>
  <author ime="Rački, Franjo" type="croala" target="rackid1e1578"/>
  <author ime="Raškaj, Alojzije" type="croala" target="raskajd1e1580"/>
  <author ime="Rebić, Šimun" type="croala" target="rebicd1e1582"/>
  <author ime="Rebrić, Josip" type="croala" target="rebricd1e1584"/>
  <author ime="Reiner, Mavro" type="croala" target="reinerd1e1587"/>
  <author ime="Relković, Matija Antun" type="croala" target="relkovicd1e1589"/>
  <author ime="Resaver, Ivan Krstitelj" type="croala" target="resaverd1e1591"/>
  <author ime="Reusner, Nicolaus" type="croala" target="reusnerd1e1593"/>
  <author ime="Rezer, Ferdinand" type="croala" target="rezerd1e1595"/>
  <author ime="Rešetarić, Petar" type="croala" target="resetaricd1e1597"/>
  <author ime="Ribic, Đurđa Rudolf" type="croala" target="ribicd1e1600"/>
  <author ime="Rigi, Vinko" type="croala" target="rigid1e1602"/>
  <author ime="Rinaldi, Petar Antun" type="croala" target="rinaldid1e1604"/>
  <author ime="Ritter-Vitezović, Pavao"
           type="croala"
           target="rittervitezovicd1e1606"/>
  <author ime="Rizman, Mihael" type="croala" target="rizmand1e1608"/>
  <author ime="Rohony, Jur" type="croala" target="rohonyd1e1610"/>
  <author ime="Roić, Juraj" type="croala" target="roicd1e1613"/>
  <author ime="Rosenberg, Sigmund" type="croala" target="rosenbergd1e1615"/>
  <author ime="Rossi, Karlo de" type="croala" target="rossid1e1617"/>
  <author ime="Roženić, Luka Jakov" type="croala" target="rozenicd1e1619"/>
  <author ime="Rožić, Antun" type="croala" target="rozicd1e1621"/>
  <author ime="Rudić, Josip" type="croala" target="rudicd1e1623"/>
  <author ime="Rudolf, Franjo" type="croala" target="rudolfd1e1626"/>
  <author ime="Ruini, Vinko" type="croala" target="ruinid1e1628"/>
  <author ime="Rukel, Žigmund" type="croala" target="rukeld1e1630"/>
  <author ime="Sabić, Josip" type="croala" target="sabicd1e1632"/>
  <author ime="Sabolić, Ksaver" type="croala" target="sabolicd1e1634"/>
  <author ime="Sachs, Mavro" type="croala" target="sachsd1e1636"/>
  <author ime="Sajković, Stjepan" type="croala" target="sajkovicd1e1639"/>
  <author ime="Salagius, Stephanus" type="croala" target="salagiusd1e1641"/>
  <author ime="Salić, Josip" type="croala" target="salicd1e1643"/>
  <author ime="Sandini, Antonio" type="croala" target="sandinid1e1645"/>
  <author ime="Santorio, Santorio" type="croala" target="santoriod1e1647"/>
  <author ime="Savi, L." type="croala" target="savid1e1649"/>
  <author ime="Schaubauer, Matija" type="croala" target="schaubauerd1e1652"/>
  <author ime="Schlosser, Josip Kalasancije"
           type="croala"
           target="schlosserd1e1654"/>
  <author ime="Schmitth, Nicolaus" type="croala" target="schmitthd1e1656"/>
  <author ime="Schrott, Josip" type="croala" target="schrottd1e1658"/>
  <author ime="Schveighart, Ivan Nepomuk"
           type="croala"
           target="schveighartd1e1660"/>
  <author ime="Seman, Josip" type="croala" target="semand1e1662"/>
  <author ime="Senibus, Aloysius de" type="croala" target="senibusd1e1665"/>
  <author ime="Sermage, Josip" type="croala" target="sermaged1e1667"/>
  <author ime="Sermage, Karlo Ivan Petar"
           type="croala"
           target="sermaged1e1669"/>
  <author ime="Sibenegg, Josip" type="croala" target="sibeneggd1e1671"/>
  <author ime="Simandi, Ladislav" type="croala" target="simandid1e1673"/>
  <author ime="Sivrić, Ante" type="croala" target="sivricd1e1675"/>
  <author ime="Skakoc, Ivan" type="croala" target="skakocd1e1678"/>
  <author ime="Skakoc, Luiđ" type="croala" target="skakocd1e1680"/>
  <author ime="Skauer, Leopold" type="croala" target="skauerd1e1682"/>
  <author ime="Sklenski, Vjenceslav" type="croala" target="sklenskid1e1684"/>
  <author ime="Slaby, Franjo" type="croala" target="slabyd1e1686"/>
  <author ime="Slade, Sebastijan" type="croala" target="sladed1e1688"/>
  <author ime="Slankamenac, Ivan" type="croala" target="slankamenacd1e1691"/>
  <author ime="Slatković, Matija" type="croala" target="slatkovicd1e1693"/>
  <author ime="Smodek, Matija" type="croala" target="smodekd1e1695"/>
  <author ime="Sokolić, Stanislav" type="croala" target="sokolicd1e1697"/>
  <author ime="Somborčević, Vinko" type="croala" target="somborcevicd1e1699"/>
  <author ime="Soppe, Jerolim" type="croala" target="sopped1e1701"/>
  <author ime="Spaić, Ladislav" type="croala" target="spaicd1e1704"/>
  <author ime="Spaić, Stjepan" type="croala" target="spaicd1e1706"/>
  <author ime="Spingaroli, Dominik Antun"
           type="croala"
           target="spingarolid1e1708"/>
  <author ime="Spongia, Giovanni Filippo"
           type="croala"
           target="spongiad1e1710"/>
  <author ime="Stajdacher, Josip" type="croala" target="stajdacherd1e1712"/>
  <author ime="Stalio, Bonagracija" type="croala" target="staliod1e1714"/>
  <author ime="Stanić, Konstantin" type="croala" target="stanicd1e1717"/>
  <author ime="Stanković, Ivan" type="croala" target="stankovicd1e1719"/>
  <author ime="Staroveški, Dragutin Filip"
           type="croala"
           target="staroveskid1e1721"/>
  <author ime="Statilić, Marin" type="croala" target="statilicd1e1723"/>
  <author ime="Statilić, Nikola" type="croala" target="statilicd1e1725"/>
  <author ime="Stauduar, F. S." type="croala" target="stauduard1e1727"/>
  <author ime="Steger, Joakim Pavao" type="croala" target="stegerd1e1730"/>
  <author ime="Steinbach, Ante Lujo" type="croala" target="steinbachd1e1732"/>
  <author ime="Steindel, Franjo Ksaver"
           type="croala"
           target="steindeld1e1734"/>
  <author ime="Stijić, Petar" type="croala" target="stijicd1e1736"/>
  <author ime="Stojčević, Andrija" type="croala" target="stojcevicd1e1738"/>
  <author ime="Stratico, Ivan Dominik" type="croala" target="straticod1e1740"/>
  <author ime="Stratico, Šimun Filip" type="croala" target="straticod1e1743"/>
  <author ime="Streim, Đuro" type="croala" target="streimd1e1745"/>
  <author ime="Stručić, Marko" type="croala" target="strucicd1e1747"/>
  <author ime="Stulli, Luka" type="croala" target="stullid1e1749"/>
  <author ime="Styber, Iohannes Capistranus"
           type="croala"
           target="styberd1e1751"/>
  <author ime="Subota, Đuro" type="croala" target="subotad1e1753"/>
  <author ime="Sudić, Franjo" type="croala" target="sudicd1e1756"/>
  <author ime="Sučić, Antun" type="croala" target="sucicd1e1758"/>
  <author ime="Svetinčić, Aleksandar Maksim"
           type="croala"
           target="svetincicd1e1760"/>
  <author ime="Svilović, Luka" type="croala" target="svilovicd1e1762"/>
  <author ime="Sylvius Sylvanus, Marcus"
           type="croala"
           target="sylvius sylvanusd1e1764"/>
  <author ime="Szabadhegyi, Hieronymus"
           type="croala"
           target="szabadhegyid1e1766"/>
  <author ime="Szegedy, Janos" type="croala" target="szegedyd1e1769"/>
  <author ime="Szentkereszty, Pal"
           type="croala"
           target="szentkeresztyd1e1771"/>
  <author ime="Szorsa, Mihovil" type="croala" target="szorsad1e1773"/>
  <author ime="Szvorenyi, Mihaly" type="croala" target="szvorenyid1e1775"/>
  <author ime="Taispergar, Josip" type="croala" target="taispergard1e1777"/>
  <author ime="Taruffi, Giuseppe Antonio"
           type="croala"
           target="taruffid1e1779"/>
  <author ime="Tauses, Elzear" type="croala" target="tausesd1e1782"/>
  <author ime="Terzy, Vinko" type="croala" target="terzyd1e1784"/>
  <author ime="Tijan, Konrad Antun" type="croala" target="tijand1e1786"/>
  <author ime="Tikowski, Adalbertus" type="croala" target="tikowskid1e1788"/>
  <author ime="Tkalac, Mirko" type="croala" target="tkalacd1e1790"/>
  <author ime="Tokić, Antun" type="croala" target="tokicd1e1792"/>
  <author ime="Tolentić, Luka" type="croala" target="tolenticd1e1795"/>
  <author ime="Toma Ilirik" type="croala" target="d1e1797"/>
  <author ime="Tomašević, Antun" type="croala" target="tomasevicd1e1799"/>
  <author ime="Tomašinović, Inocencije"
           type="croala"
           target="tomasinovicd1e1801"/>
  <author ime="Tomičić Paulski, Franjo"
           type="croala"
           target="tomicic paulskid1e1803"/>
  <author ime="Tomičić, Franjo Paulski" type="croala" target="tomicicd1e1805"/>
  <author ime="Tommaseo, Antun" type="croala" target="tommaseod1e1808"/>
  <author ime="Tommaseo, Luiđ" type="croala" target="tommaseod1e1810"/>
  <author ime="Tommaseo, Niccolo" type="croala" target="tommaseod1e1812"/>
  <author ime="Topić, Ivan" type="croala" target="topicd1e1814"/>
  <author ime="Torre, Ivan" type="croala" target="torred1e1816"/>
  <author ime="Torre, Luca" type="croala" target="torred1e1818"/>
  <author ime="Tramontana, Lovro" type="croala" target="tramontanad1e1821"/>
  <author ime="Travirca, Marko" type="croala" target="travircad1e1823"/>
  <author ime="Tribinac, Nikola" type="croala" target="tribinacd1e1825"/>
  <author ime="Tricarico, Franjo" type="croala" target="tricaricod1e1827"/>
  <author ime="Trputec, Josip" type="croala" target="trputecd1e1829"/>
  <author ime="Trtina, Mihovil" type="croala" target="trtinad1e1831"/>
  <author ime="Turković, Dragutin" type="croala" target="turkovicd1e1834"/>
  <author ime="Turčić, Nikola" type="croala" target="turcicd1e1836"/>
  <author ime="Udvinac, Ivan Nepomuk" type="croala" target="udvinacd1e1838"/>
  <author ime="Utišenić, Juraj" type="croala" target="utisenicd1e1840"/>
  <author ime="Užarević, Jakov" type="croala" target="uzarevicd1e1842"/>
  <author ime="Valić, Josip ml." type="croala" target="valicd1e1844"/>
  <author ime="Valla, Hijacint" type="croala" target="vallad1e1847"/>
  <author ime="Vancaš, Aleksa" type="croala" target="vancasd1e1849"/>
  <author ime="Varga, Franjo" type="croala" target="vargad1e1851"/>
  <author ime="Velikanović, Ivan" type="croala" target="velikanovicd1e1853"/>
  <author ime="Verneda, Franjo Ksaver" type="croala" target="vernedad1e1855"/>
  <author ime="Verona, Stanislav" type="croala" target="veronad1e1857"/>
  <author ime="Vezdin, Ivan Filip" type="croala" target="vezdind1e1860"/>
  <author ime="Viličić Budrović, Ante"
           type="croala"
           target="vilicic budrovicd1e1862"/>
  <author ime="Virag, Ferdinand" type="croala" target="viragd1e1864"/>
  <author ime="Visiani, Roberto" type="croala" target="visianid1e1866"/>
  <author ime="Vitaljić, Andrija" type="croala" target="vitaljicd1e1868"/>
  <author ime="Vitelli, Karlo" type="croala" target="vitellid1e1870"/>
  <author ime="Vladimirović, Luka" type="croala" target="vladimirovicd1e1873"/>
  <author ime="Vlah, Franjo" type="croala" target="vlahd1e1875"/>
  <author ime="Vlačić, Matija" type="croala" target="vlacicd1e1877"/>
  <author ime="Vlačić, Matija ml." type="croala" target="vlacicd1e1879"/>
  <author ime="Vlašić, Franjo" type="croala" target="vlasicd1e1881"/>
  <author ime="Vojković, Franjo Wojkffy"
           type="croala"
           target="vojkovicd1e1883"/>
  <author ime="Vojnović, Josip Božidar"
           type="croala"
           target="vojnovicd1e1886"/>
  <author ime="Vojvodić, Filip" type="croala" target="vojvodicd1e1888"/>
  <author ime="Volarić, Mate" type="croala" target="volaricd1e1890"/>
  <author ime="Volfić, Rajmund" type="croala" target="volficd1e1892"/>
  <author ime="Volgyi, Silvestar" type="croala" target="volgyid1e1894"/>
  <author ime="Voltić, Josip" type="croala" target="volticd1e1896"/>
  <author ime="Voršić, Ivan" type="croala" target="vorsicd1e1899"/>
  <author ime="Vrabec, I. Ljudevit" type="croala" target="vrabecd1e1901"/>
  <author ime="Vragović, Franjo" type="croala" target="vragovicd1e1903"/>
  <author ime="Vramec, Antun" type="croala" target="vramecd1e1905"/>
  <author ime="Vrcan, Marko" type="croala" target="vrcand1e1907"/>
  <author ime="Vrtarić, Venancij" type="croala" target="vrtaricd1e1909"/>
  <author ime="Vuk, Andrija" type="croala" target="vukd1e1912"/>
  <author ime="Vuk, Mihovil" type="croala" target="vukd1e1914"/>
  <author ime="Vukotinović, Ljudevit"
           type="croala"
           target="vukotinovicd1e1916"/>
  <author ime="Vuković, Dimitrije" type="croala" target="vukovicd1e1918"/>
  <author ime="Vučetić, Mate" type="croala" target="vuceticd1e1920"/>
  <author ime="Wadschedl Veroczensis, Stjepan"
           type="croala"
           target="wadschedl veroczensisd1e1922"/>
  <author ime="Wagner, Franz" type="croala" target="wagnerd1e1925"/>
  <author ime="Walter, Johann Jacob" type="croala" target="walterd1e1927"/>
  <author ime="Weiss, Ferenc" type="croala" target="weissd1e1929"/>
  <author ime="Werntle, Antun" type="croala" target="werntled1e1931"/>
  <author ime="Winkler, Mirko Josip" type="croala" target="winklerd1e1933"/>
  <author ime="Wohlgemuth, Filip" type="croala" target="wohlgemuthd1e1935"/>
  <author ime="Wolfstein, Josip" type="croala" target="wolfsteind1e1938"/>
  <author ime="Wraucny, Wlastenec" type="croala" target="wraucnyd1e1940"/>
  <author ime="Wuerffel, Đuro" type="croala" target="wuerffeld1e1942"/>
  <author ime="Zaccaria, Julije" type="croala" target="zaccariad1e1944"/>
  <author ime="Zadro, Iluminat" type="croala" target="zadrod1e1946"/>
  <author ime="Zakmardi, Ivan" type="croala" target="zakmardid1e1948"/>
  <author ime="Zamanja, Brno" type="croala" target="zamanjad1e1951"/>
  <author ime="Zamanja, Mate" type="croala" target="zamanjad1e1953"/>
  <author ime="Zamberger, Andrija" type="croala" target="zambergerd1e1955"/>
  <author ime="Zanchi, Josip" type="croala" target="zanchid1e1957"/>
  <author ime="Zane, Bernard" type="croala" target="zaned1e1959"/>
  <author ime="Zdelar, Ivan Franjo" type="croala" target="zdelard1e1961"/>
  <author ime="Zdenčaj, Nikola" type="croala" target="zdencajd1e1964"/>
  <author ime="Zebić, Benedikt" type="croala" target="zebicd1e1966"/>
  <author ime="Zechmeister, Franjo" type="croala" target="zechmeisterd1e1968"/>
  <author ime="Zermeg, Ivan" type="croala" target="zermegd1e1970"/>
  <author ime="Zika, Eugen" type="croala" target="zikad1e1972"/>
  <author ime="Zlatarović, Josip" type="croala" target="zlatarovicd1e1974"/>
  <author ime="Zmajević, Vicko" type="croala" target="zmajevicd1e1977"/>
  <author ime="Zmajević, Vinko" type="croala" target="zmajevicd1e1979"/>
  <author ime="Zohar, Ivan Franjo" type="croala" target="zohard1e1981"/>
  <author ime="Zola, Karlo" type="croala" target="zolad1e1983"/>
  <author ime="Zondin, Pavao" type="croala" target="zondind1e1985"/>
  <author ime="Zovetti, Ivo" type="croala" target="zovettid1e1987"/>
  <author ime="Zrinski, Adam" type="croala" target="zrinskid1e1990"/>
  <author ime="Zrinski, Nikola Ladislav"
           type="croala"
           target="zrinskid1e1992"/>
  <author ime="Zrinski, Nikola VII" type="croala" target="zrinskid1e1994"/>
  <author ime="Zulati, Ante" type="croala" target="zulatid1e1996"/>
  <author ime="Ćolić, Maksimilijan" type="croala" target="colicd1e1998"/>
  <author ime="Čanji, Ivan" type="croala" target="canjid1e2000"/>
  <author ime="Čaplovič, Jan" type="croala" target="caplovicd1e2003"/>
  <author ime="Čavlović, Pavao" type="croala" target="cavlovicd1e2005"/>
  <author ime="Čačković, Ladislav" type="croala" target="cackovicd1e2007"/>
  <author ime="Česmički, Ivan" type="croala" target="cesmickid1e2009"/>
  <author ime="Čevapović, Grgur" type="croala" target="cevapovicd1e2011"/>
  <author ime="Čikulin, Ivan Franjo" type="croala" target="cikulind1e2013"/>
  <author ime="Čilić, Luka" type="croala" target="cilicd1e2016"/>
  <author ime="Čordašić, Bartol" type="croala" target="cordasicd1e2018"/>
  <author ime="Črnko, Franjo" type="croala" target="crnkod1e2020"/>
  <author ime="Đuriković, Georgius" type="croala" target="durikovicd1e2022"/>
  <author ime="Đuričić, Đuro" type="croala" target="duricicd1e2024"/>
  <author ime="Đurošević, Franjo Solan"
           type="croala"
           target="durosevicd1e2026"/>
  <author ime="Đurđević, Bartul" type="croala" target="durdevicd1e2029"/>
  <author ime="Šarić, Vlaho Ante" type="croala" target="saricd1e2031"/>
  <author ime="Šibenik, Sebastijan" type="croala" target="sibenikd1e2033"/>
  <author ime="Šilobod Bolšić, Mihalj"
           type="croala"
           target="silobod bolsicd1e2035"/>
  <author ime="Šimanović, Franjo Mirko"
           type="croala"
           target="simanovicd1e2037"/>
  <author ime="Šimun Hvaranin" type="croala" target="d1e2039"/>
  <author ime="Šimunić, Ivan Krstitelj" type="croala" target="simunicd1e2042"/>
  <author ime="Šitović, Lovro" type="croala" target="sitovicd1e2044"/>
  <author ime="Škenderlić, Petar" type="croala" target="skenderlicd1e2046"/>
  <author ime="Školanić, Jože Franjo" type="croala" target="skolanicd1e2048"/>
  <author ime="Škrlec od Lomnice, Nikola"
           type="croala"
           target="skrlec od lomniced1e2050"/>
  <author ime="Škrlec, Nikola" type="croala" target="skrlecd1e2052"/>
  <author ime="Škrlec, Petar" type="croala" target="skrlecd1e2055"/>
  <author ime="Škvorc, Stjepan" type="croala" target="skvorcd1e2057"/>
  <author ime="Šoretić, Mihajlo" type="croala" target="soreticd1e2059"/>
  <author ime="Špoljarić, Žigmund" type="croala" target="spoljaricd1e2061"/>
  <author ime="Šporer, Juraj Matija" type="croala" target="sporerd1e2063"/>
  <author ime="Štefan, Josip" type="croala" target="stefand1e2065"/>
  <author ime="Štefanac, Šimun" type="croala" target="stefanacd1e2068"/>
  <author ime="Šug, Juraj" type="croala" target="sugd1e2070"/>
  <author ime="Šuhaj, Mirko" type="croala" target="suhajd1e2072"/>
  <author ime="Šulek, Bogoslav" type="croala" target="sulekd1e2074"/>
  <author ime="Šuljaga, Stjepan" type="croala" target="suljagad1e2076"/>
  <author ime="Šunjić, Marijan" type="croala" target="sunjicd1e2078"/>
  <author ime="Švagelj, Fortunat" type="croala" target="svageljd1e2081"/>
  <author ime="Švajcer, Josip Rikard" type="croala" target="svajcerd1e2083"/>
  <author ime="Švajger, Antun" type="croala" target="svajgerd1e2085"/>
  <author ime="Švalek, Ljudevit" type="croala" target="svalekd1e2087"/>
  <author ime="Švear, Ivan" type="croala" target="sveard1e2089"/>
  <author ime="Žalec, Josip" type="croala" target="zalecd1e2091"/>
  <author ime="Žigrović Pretočki, Franjo"
           type="croala"
           target="zigrovic pretockid1e2094"/>
  <author ime="Živić, Matija" type="croala" target="zivicd1e2096"/>
  <author ime="Župan, Franjo" type="croala" target="zupand1e2098"/>
</nostri>


(: for each item in sequence, batches of 100 :)
for $r in $rijeci/author/@ime

let $qrijeci := replace($r, " ", "+")
let $parsed := (doc(replace($url,'REPLACE_URN',$qrijeci)))

return element person { attribute type { "juric"} ,
attribute xml:id {data($r/../@target)},
element persName { attribute xml:lang { "hrv" } , data($r) } ,
element bibl { attribute type { "authorID" } , element ref { attribute type { "viaf" } , attribute target { data($parsed//ns2:VIAFCluster/ns2:viafID) } , concat("VIAF: " , data($parsed//ns2:VIAFCluster/ns2:viafID)) } }
}
