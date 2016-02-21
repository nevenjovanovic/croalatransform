# A list of CroALaBib XQueries

* List works in croalabib bibliography: [croala.ffzg.unizg.hr/basex/croalabib-opera-index](http://croala.ffzg.unizg.hr/basex/croalabib-opera-index) -- [croalabib-list-works.xq](webapp/restxq/croalabib-list-works.xq)
* List authors in collection: [solr.ffzg.hr/basex/indexauctorum/croalabib](http://solr.ffzg.hr/basex/indexauctorum/croalabib) -- [croalabib-pers-auct1.xq](webapp/restxq/croalabib-pers-auct1.xq)
* List digital titles in CroALa: [croala.ffzg.unizg.hr/basex/croalatituli](http://croala.ffzg.unizg.hr/basex/croalatituli) -- [croalabib-index-croala-tituli.xq](webapp/restxq/croalabib-index-croala-tituli.xq)
* Show particular title in CroALA: [croala.ffzg.unizg.hr/basex/croalatitulus/vrancic-m-ligario](http://croala.ffzg.unizg.hr/basex/croalatitulus/vrancic-m-ligario) -- [croalabib-titulus-croala-2.xq](webapp/restxq/croalabib-titulus-croala-2.xq)

* Bibliography of secondary works on Croatian Latin literature: [solr.ffzg.hr/basex/biblio](http://solr.ffzg.hr/basex/biblio) -- [croalabib-bibl1.xq](webapp/croalabib-bibl1.xq)

* Bibliography of secondary works on Croatian Latin drama: [solr.ffzg.hr/basex/dramabib](http://solr.ffzg.hr/basex/dramabib) -- [croalabib-drama-biblio-page2.xq](webapp/restxq/croalabib-drama-biblio-page2.xq)
* Show individual secondary works titles with titles of plays they refer to: [batušićn1987](http://solr.ffzg.hr/basex/dramabib-titleref/batu%C5%A1i%C4%87n1987) -- [croalabib-drama-bibliorefs-page2.xq](webapp/restxq/croalabib-drama-bibliorefs-page2.xq)
* Show record for a specific Croatian Latin play: [croala.drama.d1e30217](http://solr.ffzg.hr/basex/dramata/croala.drama.d1e30217) -- [croalabib-drama-page2.xq](webapp/restxq/croalabib-drama-page2.xq)
* List persons with Wikidata references: [solr.ffzg.hr/basex/wpersonae](http://solr.ffzg.hr/basex/wpersonae) -- [croalabib-wdata2.xq](webapp/restxq/croalabib-wdata2.xq)
* Display authors by periods in CroALa and LatTy, as tables side by side: [solr.ffzg.hr/basex/auctores/periodi](http://solr.ffzg.hr/basex/auctores/periodi) -- [croala-latty-periods2.xq](webapp/restxq/croala-latty-periods2.xq)
* Find works (as opposed to manifestations) by a specific author: [solr.ffzg.hr/basex/](http://solr.ffzg.hr/basex/) -- *nomid* function in [restxq.xqm](webapp/restxq.xqm)
# Antiturcica XQueries
* Display authors with more than one work, and years of their works: [solr.ffzg.hr/basex/antitur-auth](http://solr.ffzg.hr/basex/antitur-auth) -- *antitur:auctorannus* function in [antitur.xqm](repo/antitur.xqm) -- page displayed by RestXQ function [antitur-auctorannus-01.xq](webapp/restxq/antitur-auctorannus-01.xq)
* Display genres over years: [solr.ffzg.hr/basex/antitur-genera](http://solr.ffzg.hr/basex/antitur-genera) -- *antitur:generannus* function in [antitur.xqm](repo/antitur.xqm) -- page displayed by RestXQ function [antitur-generannus-01.xq](webapp/restxq/antitur-generannus-01.xq)
* Display genres over languages: [solr.ffzg.hr/basex/antitur-generaling](http://solr.ffzg.hr/basex/antitur-generaling) -- *antitur:generaling* function in [antitur.xqm](repo/antitur.xqm) -- page displayed by RestXQ function [antitur-generaling-01.xq](webapp/restxq/antitur-generaling-01.xq)
* Display whole record from croantiturcica DB: e. g. [solr.ffzg.hr/basex/antiturcica/croala.antitur.4907](http://solr.ffzg.hr/basex/antiturcica/croala.antitur.4907) -- *antitur:record* function in [antitur.xqm](repo/antitur.xqm) -- page displayed by RestXQ function [antitur-nota-01.xq](webapp/restxq/antitur-nota-01.xq)
* Display authors of texts as a timeline 1435--1601: [solr.ffzg.hr/basex/antitur-synoptice](http://solr.ffzg.hr/basex/antitur-synoptice) -- *antitur:sinergija* function in [antitur.xqm](repo/antitur.xqm) -- page displayed by RestXQ function [antitur-auctorannus-02.xq](webapp/restxq/antitur-auctorannus-02.xq)
* Display genres of texts as a timeline 1435--1601: [solr.ffzg.hr/basex/antitur-genera-synoptice](http://solr.ffzg.hr/basex/antitur-genera-synoptice) -- *antitur:syngenera* function in [antitur.xqm](repo/antitur.xqm) -- page displayed by RestXQ function [antitur-genusannus-02.xq](webapp/restxq/antitur-genusannus-02.xq)
