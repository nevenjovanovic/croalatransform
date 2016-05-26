(: create a db of Ovid's files from Perseus DL -- for Vitezović :)
(: order descending :)
(: include links to nodes in full text db :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

let $body := (
  "/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi005/phi0959.phi005.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi002/phi0959.phi002.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi003/phi0959.phi003.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi007/phi0959.phi007.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi008/phi0959.phi008.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi009/phi0959.phi009.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi004/phi0959.phi004.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi006/phi0959.phi006.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi010/phi0959.phi010.perseus-lat2.xml",
"/home/neven/rad/ogl/nevencanonicallat/canonical-latinLit/data/phi0959/phi001/phi0959.phi001.perseus-lat2.xml"
)

return db:create("ovid-pdl", $body , (), map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })