module namespace test = 'http://basex.org/modules/xqunit-tests';
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at 'file://home/neven/rad/croala-r/croalatransform/plutonbasex/repo/croala.xqm';


(: return info on the db :)
declare %unit:test function test:croalabibinfo() {
  db:info('croalabib')
};

declare %unit:test function test:croalafuncinfo(){
  unit:assert(croala:infodb('croalabib')//tr)
};

