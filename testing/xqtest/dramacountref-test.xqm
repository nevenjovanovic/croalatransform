module namespace test = 'http://basex.org/modules/xqunit-tests';
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at 'file://home/neven/basex/repo/drama.xqm';
(: dramabibref-test - display bibliography on Croatian Latin drama :)


(: return page with bib title and refs :)
declare %unit:test function test:croalabib-dramabib-title-refs() {
  fetch:xml("http://localhost:8984/basex/drama-countref")
};

declare %unit:test function test:croalabib-dramabib-titleref-headscript() {
    let $titleref := doc("http://localhost:8984/basex/drama-countref")
    return unit:assert($titleref//head/script)
  };
  
declare %unit:test function test:croalabib-dramabib-titleref-bodyscript() {
    let $titleref := doc("http://localhost:8984/basex/drama-countref")
    return unit:assert($titleref//body/script)
  };

declare %unit:test function test:croalabib-dramabib-titleref-table() {
    let $titleref := doc("http://localhost:8984/basex/drama-countref")
    return unit:assert($titleref//div[matches(@class,'zapis')]/table[@class='tablesorter']/tbody/tr/td[3][matches(.,'[0-9]')])
  };
  
declare %unit:test function test:croalabib-dramabib-titleref-table-td1() {
    let $titleref := doc("http://localhost:8984/basex/drama-countref")
    return unit:assert($titleref//div[matches(@class,'zapis')]/table[@class='tablesorter']/tbody/tr/td[1][starts-with(a,'croala.drama')]/a[matches(@href,'dramata/croala.drama')])
  };
  
declare %unit:test function test:croalabib-dramabib-titleref-table-tdid() {
    let $titleref := doc("http://localhost:8984/basex/drama-countref")
    return unit:assert($titleref//div[matches(@class,'zapis')]/table[@class='tablesorter']/thead/tr/td[.='ID'])
  };
