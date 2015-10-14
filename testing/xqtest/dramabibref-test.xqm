module namespace test = 'http://basex.org/modules/xqunit-tests';
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at 'file://home/neven/basex/repo/drama.xqm';
(: dramabibref-test - display bibliography on Croatian Latin drama :)


(: return page with bib title and refs :)
declare %unit:test function test:croalabib-dramabib-title-refs() {
  fetch:xml("http://localhost:8984/basex/dramabib-titleref/batu%C5%A1i%C4%87n1978a")
};

(: return page with bib title and refs :)
  declare %unit:test function test:croalabib-dramabib-titleref-div() {
    let $titleref := doc("http://localhost:8984/basex/dramabib-titleref/batu%C5%A1i%C4%87n1978a")
    return unit:assert($titleref//div[matches(@class,'zapis')]/table/thead/tr/td)
  };
  
declare %unit:test function test:croalabib-dramabib-titleref-reflist() {
    let $titleref := doc("http://localhost:8984/basex/dramabib-titleref/batu%C5%A1i%C4%87n1978a")
    return unit:assert($titleref//div[matches(@class,'zapis')]/table/tbody/tr/td)
  };

