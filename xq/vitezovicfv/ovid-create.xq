(: create a db of Ovid's files from Perseus DL :)
(: include the Tristia, Ex Ponto, Heroides :)
(: pull files directly from Github repository :)

let $body := (
"https://github.com/PerseusDL/canonical-latinLit/raw/master/data/phi0959/phi002/phi0959.phi002.perseus-lat2.xml",
"https://github.com/PerseusDL/canonical-latinLit/raw/master/data/phi0959/phi008/phi0959.phi008.perseus-lat2.xml",
"https://github.com/PerseusDL/canonical-latinLit/raw/master/data/phi0959/phi009/phi0959.phi009.perseus-lat2.xml"
)

return db:create("ovid-pdl2", $body , (), map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })